angular.module('MoneyBit').factory 'Invoice', ['railsResourceFactory', '$http','$sce', (railsResourceFactory, $http, $sce) ->
  Invoice = railsResourceFactory(
    {
      url:  "/invoices"
      name: 'invoice'
    }
  );

  Invoice.interceptResponse (response, constructor, context) ->
      if angular.isArray(response.data) and angular.isDefined(response.originalData.current_page)
        response.data.$current_page = response.originalData.current_page
        response.data.$from_index = response.originalData.from_index
        response.data.$to_index = response.originalData.to_index
        response.data.$total_entries = response.originalData.total_entries
      response

  return Invoice
  ]

#angular.module('MoneyBit').factory "Invoice", [
  #'railsResourceFactory'
  #(railsResourceFactory) ->
    #railsResourceFactory
      #url: "/invoices"
      #name: "invoice"
#]