angular.module('MoneyBit').factory "Invoice", [
  'railsResourceFactory'
  (railsResourceFactory) ->
    railsResourceFactory
      url: "/invoices"
      name: "invoice"
]