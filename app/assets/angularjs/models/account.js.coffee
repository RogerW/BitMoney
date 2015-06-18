angular.module('MoneyBit').factory 'Account', [
  'railsResourceFactory'
  (railsResourceFactory) ->
    railsResourceFactory
      url: '/accounts'
      name: 'account'
]
