@App = angular.module('MoneyBit', [ 'ngMaterial', 'Devise'])

#@App.config ($mdGestureProvider) ->
#	$mdGestureProvider.skipClickHijack()

@App.config ($mdThemingProvider) ->
  $mdThemingProvider.definePalette 'customBlue',
    '50': 'e5f0f7'
    '100': 'c2dced'
    '200': '9cc7e2'
    '300': '74b0d6'
    '400': '579fcd'
    '500': '398ec4'
    '600': '3380b0'
    '700': '2e729d'
    '800': '286389'
    '900': '1d4762'
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
  $mdThemingProvider.definePalette 'customRed',
    '50': 'ffe9ea'
    '100': 'fecbcd'
    '200': 'feabaf'
    '300': 'fd898e'
    '400': 'fc7076'
    '500': 'fc575e'
    '600': 'e54f56'
    '700': 'cc464c'
    '800': 'b33e43'
    '900': '832d31'
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
  $mdThemingProvider.definePalette 'customGreen',
    '50': 'eef3eb'
    '100': 'd6e3d0'
    '200': 'bed3b4'
    '300': 'a3c195'
    '400': '90b37f'
    '500': '7ca668'
    '600': '71975f'
    '700': '648654'
    '800': '58764a'
    '900': '405636'
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
      '600'
    ]
    'contrastLightColors': undefined
  $mdThemingProvider.definePalette 'customYellow',
    '50': 'fef8e9'
    '100': 'feefca'
    '200': 'fde5aa'
    '300': 'fcda87'
    '400': 'fcd26e'
    '500': 'fbca54'
    '600': 'e4b84c'
    '700': 'cba444'
    '800': 'b28f3c'
    '900': '83692c'
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
      '600'
    ]
    'contrastLightColors': undefined
  $mdThemingProvider.theme('default')
    .primaryPalette('customBlue', {'default':'500'})
    .warnPalette('customRed')
    .accentPalette('customGreen')
  $mdThemingProvider.theme('greenTheme')
    .primaryPalette('customGreen')
    .backgroundPalette('customGreen')
  $mdThemingProvider.theme('redTheme')
    .primaryPalette('customGreen')
    .backgroundPalette('customRed')
  return
  
@App.config ["$httpProvider", ($httpProvider) ->
  $httpProvider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content')
]