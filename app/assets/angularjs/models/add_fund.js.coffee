angular.module('MoneyBit').factory "AccountAddFund", [
  'railsResourceFactory'
  (railsResourceFactory) ->
    railsResourceFactory
      url: "/account/add_funds"
      name: "account_add_fund"
]