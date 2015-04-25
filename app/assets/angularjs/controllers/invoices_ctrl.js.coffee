InvoicesCtrl = ($scope, Invoice) ->
  $scope.invoice_lists = [];
  
  $scope.query_invoice = (page) ->
    query_page = page || 1
    Invoice.query('page':query_page).then (results) =>
      $scope.invoice_lists = results
      return
  
  $scope.query_invoice(1)
  
  $scope.next = ->
    $scope.query_invoice($scope.invoice_lists.$current_page + 1)
    return
    
  $scope.back = -> 
    $scope.query_invoice($scope.invoice_lists.$current_page - 1)
    return
    
  $scope.naviEnable = (action) ->
    if (action == 'next')
      #console.log ($scope.invoice_lists.$total_entries > $scope.invoice_lists.$current_page * $scope.invoice_lists.$to_index )
      if ($scope.invoice_lists.$total_entries > $scope.invoice_lists.$to_index )
        return false
      else
        return true
    else
      if ($scope.invoice_lists.$current_page == 1)  
        return true
      else
        return false
    return
    
  $scope.$on 'account:add_fund', (event, account_id, amount) ->
    if $scope.invoice_lists.$current_page == 1
      $scope.query_invoice 1
    return
  $scope.$on 'account:add_consumption', (event, account_id, amount) ->
    if ($scope.invoice_lists.$current_page == 1)
      $scope.query_invoice(1)
    return
    
  $scope.getConsuptionTypeIcon = (invtype, icon) ->
    if (invtype == 'add_fund')
      return 'input'
    else
      return icon
    
  return

InvoicesCtrl.$inject = ['$scope', 'Invoice']

angular.module('MoneyBit').controller('InvoicesCtrl', InvoicesCtrl)
