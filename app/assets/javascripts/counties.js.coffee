$ ->
  $('#counties input[type="text"]:last').live 'focus', (e)->
    $(this).bind 'keydown', (e)->
      if e.which == 9
        e.preventDefault()
        $.get(Routes.new_county_path(), => 
          $(this).unbind('keydown')
          $(this).parents('tr').next('tr').find('input:first').focus()
        )
        true
