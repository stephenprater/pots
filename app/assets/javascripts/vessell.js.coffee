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

  $('input[data-association]').bind('railsAutocomplete.beforeSelect', (obj,data) ->
      $(this).attr('data-entered-value', $(this).val())
  )
  
  $('input[data-association]').keypress (event)->
    if event.which == 13
      debugger
      event.preventDefault()

  $('input[data-association]').bind('railsAutocomplete.select', (obj,data) ->
    inputs = $(this).closest('form').find(':tabbable')
    inputs.eq(inputs.index(this) + 1 ).focus()
  )
