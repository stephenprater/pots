$ ->
  class BootTag
    constructor: (item, options) ->
      @options = $.extend(true, {}, $.fn.bootTag.defaults, options)
      @element = $(item)
      @textField = @element.next(@options.input)

      #make the browser less interfering
      @textField.attr('autocomplete','off')

      @textField.typeahead(
        source: @options.tags
        display: false
        menu: "<ul id='#{@element.attr('data-tag-source')}' class='typeahead dropdown-menu'></ul>"
      )

      that = @ 

      @textField.bind 'typeahead.select', (e, text) ->
        that.addTag(text)
        $(this).val("")

      @textField.bind 'typeahead.noSelect', (e, text) ->
        console.log('no select')
        that.addTag(text)
        $(this).val("")
        window.autocompletes[that.element.attr('data-tag-source')].push(text)

      @element.bind 'bootTag.tagAdded', (e, el) ->
        $(this).append($(el).hide())
        $(el).fadeIn()

      @element.bind 'bootTag.tagRemoved', (e, el) ->
        $(el).fadeOut ->
          $(this).remove()

      @element.bind 'bootTag.tagExists', (e, el) ->
        $(el).effect('highlight', {}, 500)

    find_input: (tag)->
      @element.find("input[type='hidden']").filter ->
        $(@).val() == tag

    reset: ->
      @textField.val("")

    addTag: (tag)->
      sel = @find_input(tag)
      
      if sel.length
        @element.trigger('bootTag.tagExists', sel.closest('li.tag'))
        return
      
      tag_element = $('<li></li>')
        .empty()
        .addClass('tag')
        .append($('<span></span>').text(tag)
          .append($('<a class="close"></a>').text(unescape('%D7')).click( =>
            this.removeTag(tag)
          ))
        )
        .append($('<input type="hidden"/>').attr('name', @options.field).val(tag))

      @element.trigger('bootTag.tagAdded', [tag_element])

    removeTag: (tag)->
      sel = @find_input(tag)
      
      if sel.length
        @element.trigger('bootTag.tagRemoved', [sel.closest('li.tag')])

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
