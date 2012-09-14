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


  $(window.document).on 'typeahead.beforeSelect', 'input[data-autocomplete]', (value, data)->
    console.log 'before select'
    $(this).data('typeahead')['entered_value'] = $(this).val()

  $(window.document).on 'typeahead.noSelect', 'input[data-autocomplete]', (e)->
    console.log 'no select'
    $.ajax("#{$(this).attr('data-callback')}/new",
      dataType: 'script',
      data: { value: $(this).data('typeahead')['entered_value'] }
    )
    return true

  $(window.document).on 'typeahead.select', 'input[data-autocomplete]', (value, text)->
    console.log 'selected'
    $.ajax("#{$(this).attr('data-callback')}/associate"
      dataType: 'script',
      id: value
    )

