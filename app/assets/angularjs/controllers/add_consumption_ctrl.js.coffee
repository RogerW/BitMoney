AccountAddConsumptionCtrl = ($rootScope, $scope, $mdDialog, AccountAddConsumption, account, Account, ConsumptionType, invoice, Invoice) ->

  clone = (obj) ->
    return obj  if obj is null or typeof (obj) isnt "object"
    temp = new obj.constructor()
    for key of obj
      temp[key] = clone(obj[key])
    temp
    
  $scope.loadConsumptionTypes = ->
    $scope.consumptionTypes = []
    ConsumptionType.query().then (results) =>
      $scope.consumptionTypes = results
      return
    
  temp_invoice = clone(invoice)
  
  if temp_invoice isnt null
    temp_invoice.amount = temp_invoice.amount.fractional/100
    if temp_invoice.consumptionType is null
      temp_invoice.consumption_type_id = temp_invoice.consumptionType.id
      
  $scope.account_add_consumption = temp_invoice || {}
  
  $scope.account = account || {}
  
  $scope.show_consumption = () ->
    if $scope.consumptionTypes is undefined or typeof ($scope.consumptionTypes) isnt "object"
      temp = temp_invoice.consumptionTypes.title
    else
      angular.forEach $scope.consumptionTypes, (value, key) ->
        console.log $scope.account_add_consumption.consumption_type_id
        if value.id == $scope.account_add_consumption.consumption_type_id
          temp = value.title
          console.log temp
          
    temp
  
  $scope.delete = () ->
    Invoice.$delete(Invoice.resourceUrl(invoice.id)).then (results) =>
      $rootScope.$broadcast('account:add_consumption',  $scope.account_add_consumption.account_id, $scope.account_add_consumption.amount)
      $rootScope.$broadcast('account:add_fund',  $scope.account_add_consumption.destination_id, $scope.account_add_consumption.amount)
      $mdDialog.hide()
      return
  

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

  $scope.create = ->
    $scope.account_add_consumption.account_id = $scope.account.id
    
    if $scope.account_add_consumption.id is null
      new AccountAddConsumption($scope.account_add_consumption).create().then (results) =>
        $rootScope.$broadcast('account:add_consumption',  $scope.account_add_consumption.account_id, $scope.account_add_consumption.amount)
        $mdDialog.hide()
        return
    else
      $scope.account_add_consumption.update().then (results) =>
        $rootScope.$broadcast('account:add_consumption',  $scope.account_add_consumption.account_id, $scope.account_add_consumption.amount)
        $mdDialog.hide()
        return

  $scope.hide = ->
    $mdDialog.hide()
    return

  $scope.cancel = ->
    $mdDialog.cancel()
    return

  return

AccountAddConsumptionCtrl.$inject = [
  '$rootScope'
  '$scope'
  '$mdDialog'
  'AccountAddConsumption'
  'account'
  'Account'
  'ConsumptionType'
  'invoice'
  'Invoice']

angular.module('MoneyBit').controller('AccountAddConsumptionCtrl', AccountAddConsumptionCtrl)