InvoicesCtrl = ($scope, Invoice) ->
  $scope.invoice_lists = [];
  
  Invoice.query().then (results) =>
    $scope.invoice_lists = results
    return
    
  $scope.getConsuptionTypeIcon = (invtype, icon) ->
    if (invtype == 'add_fund')
      return 'input'
    else
      return icon
    
  return

InvoicesCtrl.$inject = ['$scope', 'Invoice']

angular.module('MoneyBit').controller('InvoicesCtrl', InvoicesCtrl)
