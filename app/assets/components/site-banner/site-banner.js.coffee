do ->
  Polymer 'site-banner',
    shortname: ''
    isPhone: false
    isPhoneChanged: ->
      @parentElement.classList.toggle 'mobile', @isPhone
      return
  return