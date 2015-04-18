AccountAddFundCtrl = ($rootScope, $scope, $mdDialog, AccountAddFund) ->
  $scope.account_add_fund = {}
  
  $scope.create = ->
    new AccountAddFund($scope.account_add_fund).create().then (results) =>
      $rootScope.$broadcast('account:add_fund',  $scope.account_add_fund)
      return
      
  $scope.hide = ->
    $mdDialog.hide()
    console.log 'hide'
    return
    
  $scope.cancel = ->
    $mdDialog.cancel()
    console.log 'hide'
    return

  $scope.answer = (answer) ->
    $mdDialog.hide answer
    console.log 'hide'
    return
  
  return
  
AccountAddFundCtrl.$inject = ['$rootScope','$scope', '$mdDialog', 'AccountAddFund']
  
angular.module('MoneyBit').controller('AccountAddFundCtrl', AccountAddFundCtrl)