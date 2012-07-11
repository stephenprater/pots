$ ->
  $("a[rel=popover]").popover()
  $(".tooltip").tooltip()
  $("a[rel=tooltip]").tooltip()
  $("input.datepicker").datepicker()


$ ->
  Array::remove = (e)-> @[t..t] = [] if(t = @indexOf(e)) > -1

  class Search
    constructor: (@selector,@base_path)->

    reset: ()->
      $(@selector).data('url',{})

    add_params: (options)->
      old = $(@selector).data('url')
      new_params = ($.extend(old, options))
      $(@selector).data('url',new_params)

    remove_params: (keys...)->
      old = $(@selector).data('url')
      delete old[key] for key in keys
      $(@selector).data('url',old)

    merge_param: (obj)->
      old = $(@selector).data('url')
      for k,v of obj 
        if old[k]
          old[k].push v
        else
          old[k] = [v]

    unmerge_param:(obj)->
      old = $(@selector).data('url')
      for k,v of obj
        if old[k]
          old[k].remove(v)

        if old[k].length == 0
          delete old[k]
          
    to_s: ()->
      console.log $(@selector).data('url')
      "#{@base_path}?#{jQuery.param($('#parties').data('url'))}"

    window.Search = Search

