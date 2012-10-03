$ ->

  unless String::template
    String::template = (obj)->
      str = @toString()
      return str unless obj

      (str = str.replace ///\#{#{key}\}///, obj[key]) for key of obj
      return str

  class Associator
    constructor: (item, options) ->
      @options = $.extend(true, {}, $.fn.associator.defaults, options)
      @element = $(item)

      @association = @element.data('association')
      @element.removeAttr('data-association')
      
      @element.typeahead(
        ajax: {
          url: @association.autocomplete
          method: 'get'
          triggerLength: 2
        }
        menu: "<ul id='#{@association.name}' class='typeahead dropdown-menu'></ul>"
        display: @association.autocomplete.match /[^_]+$/
        matcher: (value, item)->
          true if !~(value.toLowerCase().indexOf(this.query.toLowerCase()) || item.id == "0")
      )

      @element.bind 'keypress', (e)->
        if e.which == 13
          e.preventDefault()

      that = @

      @element.bind 'typeahead.beforeSelect', (e, val, item, obj) ->
        typeahead = $(this).data('typeahead')
        if obj.id == 0
          obj[typeahead.options.display] = val
        obj['field'] = that.association.field

      @element.bind 'typeahead.select', (e, val, obj) ->
        id = obj.id
        delete obj.id
        $.ajax(
          url: that.association.callback.template(association_id: id)
          data: obj
          dataType: 'script'
        )

  $.fn.associator = (option)->
    for el in this
      self = $(el)
      data = self.data('associator')
      options = if(typeof option == 'object') then option else null

      unless data
        self.data('associator', (data = new Associator(el, options)))

      if typeof option == 'string'
        data[option]()

  $.fn.associator.defaults = {}

