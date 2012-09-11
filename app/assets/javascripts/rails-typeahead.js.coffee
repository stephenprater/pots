$ ->
  sources = $.parseJSON($('script#autocompletes').html())
  inputs = $('input[data-autocomplete="typeahead"]')
  for input in inputs
    $(input).typeahead({
      source: sources[$(input).attr('data-source')]
    })
