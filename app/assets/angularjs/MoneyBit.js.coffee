@App = angular.module('MoneyBit', [ 'MoneyBit.controller','MoneyBit.routes', 'ngMdIcons', 'rails', 'ngMaterial'])

@App.config ($mdThemingProvider) ->
  $mdThemingProvider.definePalette 'primaryMoneyBitPalette',
    '50': 'ECF4FA'
    '100': 'BFDAEC'
    '200': 'A8CEE5'
    '300': '84B9DA'
    '400': '5EA4CF'
    '500': '398EC4'
    '600': '327DAC'
    '700': '2E729C'
    '800': '225474'
    '900': '16384C'
    'A100': '4AB9FF'
    'A200': '2A8EC4'
    'A400': '2A7CC4'
    'A700': '2A51C4'
    'contrastDefaultColor': 'light'
    'contrastDarkColors': [
      '50'
      '100'
      '200'
      '300'
      '400'
      'A100'
    ]
    'contrastLightColors': undefined
  $mdThemingProvider.definePalette 'warnMoneyBitPalette',
    '50': 'FFFFEF'
    '100': 'FEC9CB'
    '200': 'FEB6B9'
    '300': 'FD979B'
    '400': 'FD767D'
    '500': 'FC575E'
    '600': 'E54F56'
    '700': 'D74A51'
    '800': 'B13E42'
    '900': '8C3035'
    'A100': 'FF777E'
    'A200': 'E56B71'
    'A400': 'FD417D'
    'A700': 'FD0B7D'
    'contrastDefaultColor': 'light'
    'contrastDarkColors': [
      '50'
      '100'
      '200'
      '300'
      '400'
      'A100'
    ]
    'contrastLightColors': undefined
  $mdThemingProvider.theme('default')
    .primaryPalette('primaryMoneyBitPalette')
    .warnPalette('warnMoneyBitPalette')
  return
  
@App.config ["$httpProvider", ($httpProvider) ->
  $httpProvider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content')
]