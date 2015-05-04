AccountsCtrl = ($scope, $mdDialog, Account, $mdToast) ->
	$scope.accounts = []
	$scope.account = []

	Account.query().then ((_this) ->
		(results) ->
			$scope.accounts = results
			return
	)(this)

	$scope.loadAccount = (account_id) ->
		Account.get({'id': account_id}).then (results) =>
			console.log results
			console.log account_id
			$scope.account = results

	
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
		}
	]
	$scope.openAddFund = 0

	$scope.AddFundPanel = (id) ->
		if id == $scope.openAddFund
			return true
		false

	$scope.AddFundPanelOpen = (id) ->
		console.log "Try Open hide panel " + id
		console.log $scope.openAddFund
		if $scope.openAddFund == id
			console.log "panel already open"
			$scope.openAddFund = 0
		else
			console.log "panel opening"
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
			when 'edit'
				angular.forEach $scope.accounts, (value, key) ->
					if value.id == account_id
						$scope.showAccountDialog(value)
				return
			when 'add_account'
				return $scope.showAccountDialog()
			when 'delete'
				angular.forEach $scope.accounts, (value, key) ->
					if value.id == account_id
						value.delete().then (results) =>
							Account.query().then (results) =>
								$scope.accounts = results
								return
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
	$scope.showAccountDialog = (account, ev) ->
		$mdDialog.show(
			controller: 'AccountDialogCtrl'
			templateUrl: 'assets/templates/account_dialog.html'
			locals: account: account
			targetEvent: ev).then ((answer) ->
			$mdToast.show($mdToast.simple().content('Счет обновлен'));
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