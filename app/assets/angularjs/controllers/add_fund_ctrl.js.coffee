AccountAddFundCtrl = ($rootScope, $scope, $mdDialog, AccountAddFund, account, Account, invoice, Invoice) ->
  
  clone = (obj) ->
    return obj  if obj is null or typeof (obj) isnt "object"
    temp = new obj.constructor()
    for key of obj
      temp[key] = clone(obj[key])
    temp
  
  temp_invoice = clone(invoice)
  
  if temp_invoice isnt null
    temp_invoice.amount = temp_invoice.amount.fractional/100

  $scope.account_add_fund = temp_invoice || {}
  console.log $scope.account_add_fund
  $scope.errors = []
  $scope.errorShow = false

  $scope.account = account || {}

  $scope.showAccountSelect = ->
    if account.id == undefined
      true
    else
      false

  $scope.loadAccounts = ->
    $scope.accounts = []
    Account.query().then (results) =>
      $scope.accounts = results
      return
    return

  $scope.create = ->
    $scope.account_add_fund.account_id = $scope.account.id

    if $scope.account_add_fund.id== undefined
      new AccountAddFund($scope.account_add_fund).create().then ((results) ->
        $rootScope.$broadcast('account:add_fund',  $scope.account_add_fund.account_id, $scope.account_add_fund.amount)
        $mdDialog.hide(results.message)
        return
      ), (error) ->
        if error.status == 422
          $scope.errors = error.data.errors
          $scope.errorShow = true
          return
        return
      return
    else
      $scope.account_add_fund.update().then ((results) ->
        $rootScope.$broadcast('account:add_fund',  $scope.account_add_fund.account_id, $scope.account_add_fund.amount)
        $mdDialog.hide(results.message)
        return
      ), (error) ->
        if error.status == 422
          $scope.errors = error.data.errors
          $scope.errorShow = true
          return
        return
      return
      
  $scope.hide = (message) ->
    $mdDialog.hide(message)
    return
    
  $scope.cancel = ->
    $mdDialog.cancel()
    return
    
  $scope.deleteInvoice = () ->
    console.log "delete"
    Invoice.$delete(Invoice.resourceUrl(invoice.id)).then (results) =>
      $rootScope.$broadcast('account:add_consumption',  $scope.account_add_fund.account_id, $scope.account_add_fund.amount)
      $rootScope.$broadcast('account:add_fund',  $scope.account_add_fund.destination_id, $scope.account_add_fund.amount)
      $mdDialog.hide()
      return

  return
  
AccountAddFundCtrl.$inject = ['$rootScope','$scope', '$mdDialog', 'AccountAddFund', 'account', 'Account', 'invoice', 'Invoice']
  
angular.module('MoneyBit').controller('AccountAddFundCtrl', AccountAddFundCtrl)