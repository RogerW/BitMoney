AccountsCtrl = ($scope, $mdDialog, Account, $mdToast) ->
  $scope.accounts = []
  $scope.account = []

  Account.query().then (results) =>
    $scope.accounts = results
    return


  $scope.loadAccount = (account_id) ->
    Account.get({'id': account_id}).then (results) =>
      $scope.account = results
      return

    
  $scope.$on 'account:add_fund', (event, account_id, amount) ->
    angular.forEach $scope.accounts, (value, key) ->
      if value.id == account_id
        value.balance.fractional = parseFloat(value.balance.fractional) + amount * 100
        return
      $scope.openAddFund = 0
      return
  $scope.$on 'account:add_consumption', (event, account_id, amount) ->
    angular.forEach $scope.accounts, (value, key) ->
      if value.id == account_id
        value.balance.fractional = parseFloat(value.balance.fractional) - amount * 100
        return
      $scope.openAddFund = 0
      return
  $scope.$on 'account:add_account', (event, account) ->
    Account.query().then (results) =>
      $scope.accounts = results
      return
  $scope.account_actions = [
    { 
      'name': 'add_fund'
      'title': 'Доход'
      'icon': 'fa-plus'
    }
    {
      'name': 'withdrawal'
      'title': 'Расход'
      'icon': 'fa-minus'
    }
    {
      'name': 'transfer'
      'title': 'Перевод'
      'icon': 'fa-exchange'
    }
    {
      'name': 'edit'
      'title': 'Изменить'
      'icon': 'fa-pencil'
    }
    {
      'name': 'delete'
      'title': 'Удалить'
      'icon': 'fa-trash'
    }]


  $scope.dialogs = 
    'add_fund':
      controller: 'AccountAddFundCtrl'
      template:   'assets/templates/add_fund_dialog.html'
    'withdrawal':
      controller: 'AccountAddConsumptionCtrl'
      template:   'assets/templates/add_consumption_dialog.html'
    'transfer':
      controller: 'AccountTransferCtrl'
      template:   'assets/templates/transfer_dialog.html'
    'edit':
      controller: 'AccountDialogCtrl'
      template:   'assets/templates/account_dialog.html' 
      
  $scope.openAddFund = 0

  $scope.AddFundPanel = (id) ->
    if id == $scope.openAddFund
      return true
    false

  $scope.AddFundPanelOpen = (id) ->
    if $scope.openAddFund == id
      $scope.openAddFund = 0
    else
      $scope.openAddFund = id
        
  $scope.menu_action = (action, account, ev) ->
    if $scope.dialogs[action] != undefined
      $mdDialog.show(
        parent: (angular.element(document.body))
        controller: $scope.dialogs[action].controller
        templateUrl: $scope.dialogs[action].template
        locals: {account: account, invoice: null}
        clickOutsideToClose: true
        targetEvent: ev).then ((message) ->
        $mdToast.show($mdToast.simple().content(message));
        return
      ), ->
        return

AccountsCtrl.$inject = [
  '$scope'
  '$mdDialog'
  'Account'
  '$mdToast'
]

angular.module('MoneyBit').controller 'AccountsCtrl', AccountsCtrl
return