$ ->
  class BootTag
    constructor: (@item, options) ->
      @options = $.extend(true, {}, $.fn.bootTag.defaults, options)
      @element = $(@item)

      #make the browser less interfering
      @textField().attr('autocomplete','off')

      @textField().typeahead(
        source: @options.tags
      )

      @textField().on 'change', (val, text) ->
        console.log(val)
        console.log(text)
        @addTag(val)

      @textField().on 'keypress', (e)->
        if e.which == 13
          e.preventDefault()

    close = ->
      $('<a class="close"></a>').text(unescape('%D7')).click ->
        @self.trigger 'bootTag.removeTag'

    find_input = (tag)->
      @element.find("input[type='hidden']").filter ->
        $(@).val(tag)

    textField: ->
      @element.next(@options.input)

    reset: ->
      @textField().val("")

    addTag: (tag)->
      sel = find_input(tag)
      
      if sel.length
        @.trigger('bootTag.tagExists')
        return
      
      data = @element.data('bootTag')
      
      hidden_input = $('<input type="hidden"/>').attr('name', data.field).val(tag)
      
      element.empty().append($('<span></span>').text(tag)).append(hidden_input)
      element.addClass('tag').append(@.close())

      #what does this do?
      unless $(element).parent.length
        element.insertBefore($('.boottag-edit-handle', @))

      @element.trigger('bootTag.tagAdded')

    removeTag: (tag)->
      sel = find_input(tag)
      
      if sel.length
        sel.parent.remove()
        @element.trigger('bootTag.tagRemoved')

    getTags: ->
      $(el).val() for el in @element.find("input[type='hidden']")


  $.fn.bootTag = (option)->
    for el in this
      self = $(el)
      data = self.data('bootTag')
      options = if (typeof option == 'object') then option else null

      unless data
        self.data('bootTag', (data = new BootTag(el, options)))

      if typeof option == 'string'
        data[option]()

  $.fn.bootTag.defaults = {
    tags: []
    field: 'tags[]'
    input: null
  }
