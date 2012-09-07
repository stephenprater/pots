# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
#
$ ->
  vessell_search = new Search('#vessells', Routes.vessells_path())
  vessell_search.reset()

  #perhaps - disable the enter key on everything but the last form element?

  $('#vessell_accession_number').bind('railsAutocomplete.select', (obj,data)->
    vessell_search.add_params(product_search:$(this.val()))
    $.ajax(vessell_search.to_s(), dataType: 'script')
    $(this).val ''
  ).keypress (event)->
    if event.which == 13
      vessell_search.add_params(product_search:$(this).val())
      event.preventDefault()
      $.ajax(vessell_search.to_s(), dataType: 'script')
  true

  $('input[data-association]').live('railsAutocomplete.beforeSelect', (obj,data) ->
      $(this).attr('data-entered-value', $(this).val())
  )
  
  $('input[data-association]').keypress (event)->
    #and then this one
    # tab or enter will move to the next field
    if event.which == 13 or event.which == 9
      event.preventDefault()
      console.log('keypress')
      id_element = $(this).attr('data-id-element')
      current_index = parseInt( $(id_element).attr('name').match(/\[(\d)+?\]/)[1], 10)

      # we hit enter and didn't fire select, so that means we want to create a new one
      wrapper = $(id_element).wrap("<div class='input-append'>").closest('div')
      new_text = $("input##{$(this).attr('data-association')}_template").clone()
      new_text.attr('id', new_text.attr('name').replace(/((?:\[)|(?:\]\[))/g,'_').slice(0,-1))
      new_text.attr('disabled', true)
      new_text.attr('type','text')
      new_text.attr('value',$(this).val())
      wrapper.append(new_text)
      wrapper.append('<a class="btn add-on" href="#"><i class="icon-trash"></i></a>')
      
      next_id = $(id_element).remove()
      next_id.attr('name',next_id.attr('name').replace(current_index,current_index+1))
      next_id.attr('id', next_id.attr('id').replace(current_index,current_index+1))
      
      $(this).before(next_id)
      $(this).attr('data-id-element', next_id.attr('id'))
      $(this).val('')


  $('input[data-association]').live('railsAutocomplete.select', (obj,data) ->
    #this one fires first
    console.log('selected')
    inputs = $(this).closest('form').find(':tabbable')
    inputs.eq(inputs.index(this) + 1 ).focus()
  )
