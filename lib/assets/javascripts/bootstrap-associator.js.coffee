$ ->
  class Associator
    constructor: (item, options) ->
      @options = $.extend(true, {}, $.fn.associator.defaults, options)
      @element = $(item)

      @new_callback = @element.attr('data-new-callback')
      @associate_callback = @element.attr('data-associate-callback')
      @autocomplete = @element.attr('data-autocomplete')
      @association = @element.attr('data-association')

      @element.typeahead(
        ajax: {
          url: @autocomplete
          method: 'get'
          triggerLength: 2
        }
        menu: "<ul id='#{@element.attr('data-association')}' class='typeahead dropdown-menu'></ul>"
        display: @autocomplete.match /[^_]+$/
        matcher: (item)->
          true if !~(item.toLowerCase().indexOf(this.query.toLowerCase()) || item == "New")
      )

      @element.bind 'keypress', (e)->
        if e.which == 13
          e.preventDefault()

      that = @

      @element.bind 'typeahead.beforeSelect', (e, val) ->
        that['entered_value'] = val

        @element.bind 'typeahead.select', (e, val) ->
        debugger
        if val.id == 0
          $.get(@new_callback, { name: that['entered_value']})
        else
          $.get(@associate_callback)


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

