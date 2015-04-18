AccountsCtrl = ($scope, $mdDialog, Account) ->
  $scope.accounts = [];
  
  Account.query().then (results) =>
    $scope.accounts = results
    return
    
  $scope.$on('account:add_fund', (event, data) ->
    angular.forEach($scope.accounts, (value, key) ->
      if (value.id == data.account_id)
        console.log parseFloat(value.balance.fractional) + data.amount*100
        value.balance.fractional = parseFloat(value.balance.fractional) + (data.amount*100)
        return
    )
    $scope.openAddFund = 0
    return
  )
  
  $scope.account_actions = [
    {'name':'add_fund', 'title':'Доход', 'icon':'add_circle_outline'},
    {'name':'withdrawal', 'title':'Расход', 'icon':'remove_circle_outline'},
    {'name':'transfer', 'title':'Перевод', 'icon':'send'},
    {'name':'edit', 'title':'Изменить', 'icon':'create'},
    {'name':'delete', 'title':'Удалить', 'icon':'delete'}
  ]
  
  $scope.openAddFund = 0
  
  $scope.AddFundPanel = (id) ->
    return true if (id == $scope.openAddFund)
    return false
  
  $scope.AddFundPanelOpen = (id) ->
    if($scope.openAddFund == id)
      $scope.openAddFund = 0
      return
    else
      $scope.openAddFund = id
      return
  
  $scope.menu_action = (action, account_id) ->
    switch action
      when "add_fund" then $scope.showAdvanced()
      else
        console.log action
    return
      
  $scope.showAdvanced = (ev) ->
    $mdDialog.show(
      controller: 'AccountAddFundCtrl'
      templateUrl: 'assets/templates/add_fund_dialog.html'
      targetEvent: ev).then ((answer) ->
        concole.log = 'You said the information was "' + answer + '".'
        return
      ), ->
        $scope.alert = 'You cancelled the dialog.'
        return
    return
  
  return
  
AccountsCtrl.$inject = ['$scope', '$mdDialog', 'Account']

angular.module('MoneyBit').controller('AccountsCtrl', AccountsCtrl)

#window.App.controller('AccountCtrl', AccountCtrl)