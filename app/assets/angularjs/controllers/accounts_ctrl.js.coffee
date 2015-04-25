AccountsCtrl = ($scope, $mdDialog, Account, $mdToast) ->
	$scope.accounts = []
	
	Account.query().then ((_this) ->
		(results) ->
			$scope.accounts = results
			return
	)(this)
	
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
	$scope.account_actions = [
		{
			'name': 'add_fund'
			'title': 'Доход'
			'icon': 'add_circle_outline'
		}
		{
			'name': 'withdrawal'
			'title': 'Расход'
			'icon': 'remove_circle_outline'
		}
		{
			'name': 'transfer'
			'title': 'Перевод'
			'icon': 'send'
		}
		{
			'name': 'edit'
			'title': 'Изменить'
			'icon': 'create'
		}
		{
			'name': 'delete'
			'title': 'Удалить'
			'icon': 'delete'
		}
	]
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
		return

	$scope.menu_action = (action, account_id) ->
		switch action
			when 'add_fund'
				return $scope.showAddFundDialog(account_id)
			when 'withdrawal'
				return $scope.showAddConsumptionDialog(account_id)
			when 'transfer'
			  return $scope.showTransferDialog(account_id)
			else
				console.log action
		return

	$scope.showAddFundDialog = (account_id, ev) ->
		$mdDialog.show(
			controller: 'AccountAddFundCtrl'
			templateUrl: 'assets/templates/add_fund_dialog.html'
			locals: account_id: account_id
			targetEvent: ev).then ((answer) ->
			$mdToast.show($mdToast.simple().content('Средства пополнены'));
			return
		), ->
			return

	$scope.showAddConsumptionDialog = (account_id, ev) ->
		$mdDialog.show(
			controller: 'AccountAddConsumptionCtrl'
			templateUrl: 'assets/templates/add_consumption_dialog.html'
			locals: account_id: account_id
			targetEvent: ev).then ((answer) ->
			$mdToast.show($mdToast.simple().content('Средства списаны'));
			return
		), ->
			return
	$scope.showTransferDialog = (account_id, ev) ->
		$mdDialog.show(
			controller: 'AccountTransferCtrl'
			templateUrl: 'assets/templates/transfer_dialog.html'
			locals: account_id: account_id
			targetEvent: ev).then ((answer) ->
			$mdToast.show($mdToast.simple().content('Средства переведены'));
			return
		), ->
			return

	return



AccountsCtrl.$inject = [
	'$scope'
	'$mdDialog'
	'Account'
	'$mdToast'
]
angular.module('MoneyBit').controller 'AccountsCtrl', AccountsCtrl
return