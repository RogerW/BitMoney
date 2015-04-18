class Thing extends @NGService
  @register window.App
  
  @$inject: []
 
  edit: (id) ->
    @notify "thing:edit", id
 
  reload: ->
    @notify "thing:reload"