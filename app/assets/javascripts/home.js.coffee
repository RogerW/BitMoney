<<<<<<< HEAD
# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

document.querySelector('#mediaQuery').addEventListener 'core-media-change', (e) ->
  document.body.classList.toggle 'core-narrow', e.detail.matches
  return
=======
$( "#submit_button" ).on('click', (e) ->
  $( '#polymer_form' ).submit()
  )
#document.querySelector('#test').addEventListener 'click', (e) ->
  #alert 'Oppa'
  #return
>>>>>>> a12e4a950d715ac71cdd6b4446fd3c153e7ed7cf
