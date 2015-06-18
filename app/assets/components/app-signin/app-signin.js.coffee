Polymer 'app-signin',
#  ready: ->
#    @$.login.headers = '{"X-CSRF-Token": "'+ $('meta[name="csrf-token"]').attr('content') + '"}'
  rememberClick: ->
    if @$.remember.checked
      @$.remember.checked = false
    else
      @$.remember.checked = true
    return
  toggleChange: ->
    $('.remember__field')[0].checked = @$.remember.checked
  logged: ->
    console.log $('.login__box')
    $('.login__box').submit()
    return
#  loginResponse: (event, response) ->
##    alert response
#    console.log(response)
#    return
#  loginError: (event, response) ->
#    console.log(response)
#    return