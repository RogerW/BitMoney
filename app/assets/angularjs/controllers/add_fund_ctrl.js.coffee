AccountAddFundCtrl = ($rootScope, $scope, $mdDialog, AccountAddFund, account_id, Account) ->

  $scope.account_add_fund = {}

  $scope.account = account_id || 0

  $scope.showAccountSelect = ->
    if account_id == 1
      true
    else
      false

  $scope.loadAccounts = ->
    $scope.accounts = []
    Account.query().then (results) =>
      $scope.accounts = results
      return

  $scope.create = ->
    $scope.account_add_fund.account_id = $scope.account

    new AccountAddFund($scope.account_add_fund).create().then (results) =>
      $rootScope.$broadcast('account:add_fund',  $scope.account_add_fund)
      $mdDialog.hide()
      return
      
  $scope.hide = ->
    $mdDialog.hide()
    return
    
  $scope.cancel = ->
    $mdDialog.cancel()
    return

  return
  
AccountAddFundCtrl.$inject = ['$rootScope','$scope', '$mdDialog', 'AccountAddFund', 'account_id', 'Account']
  
angular.module('MoneyBit').controller('AccountAddFundCtrl', AccountAddFundCtrl)