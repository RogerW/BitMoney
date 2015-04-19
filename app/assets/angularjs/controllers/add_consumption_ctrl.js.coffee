AccountAddConsumptionCtrl = ($rootScope, $scope, $mdDialog, AccountAddConsumption, account_id, Account, ConsumptionType) ->

	$scope.account_add_fund = {}

	$scope.account = account_id || 0

	$scope.showAccountSelect = ->
		if account_id == 0
			true
		else
			false

	$scope.loadAccounts = ->
		$scope.accounts = []
		Account.query().then (results) =>
			$scope.accounts = results
			return

	$scope.loadConsumptionTypes = ->
		$scope.consumptionTypes = []
		ConsumptionType.query().then (results) =>
			$scope.consumptionTypes = results
			return

	$scope.create = ->
		$scope.account_add_consumption.account_id = $scope.account

		new AccountAddConsumption($scope.account_add_consumption).create().then (results) =>
			$rootScope.$broadcast('account:add_consumption',  $scope.account_add_consumption)
			$mdDialog.hide()
			return

	$scope.hide = ->
		$mdDialog.hide()
		return

	$scope.cancel = ->
		$mdDialog.cancel()
		return

	return

AccountAddConsumptionCtrl.$inject = ['$rootScope','$scope', '$mdDialog', 'AccountAddConsumption', 'account_id', 'Account', 'ConsumptionType']

angular.module('MoneyBit').controller('AccountAddConsumptionCtrl', AccountAddConsumptionCtrl)