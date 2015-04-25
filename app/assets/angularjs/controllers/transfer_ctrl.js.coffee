AccountTransferCtrl = ($rootScope, $scope, $mdDialog, AccountTransfer, account_id, Account) ->

	$scope.account_transfer = {}

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

	$scope.create = ->
		$scope.account_transfer.account_id = $scope.account

		new AccountTransfer($scope.account_transfer).create().then (results) =>
			$rootScope.$broadcast('account:add_consumption',  $scope.account_transfer.account_id, $scope.account_transfer.amount)
			$rootScope.$broadcast('account:add_fund',  $scope.account_transfer.destination_id, $scope.account_transfer.amount)
			$mdDialog.hide()
			return

	$scope.hide = ->
		$mdDialog.hide()
		return

	$scope.cancel = ->
		$mdDialog.cancel()
		return

	return

AccountTransferCtrl.$inject = ['$rootScope','$scope', '$mdDialog', 'AccountTransfer', 'account_id', 'Account',]

angular.module('MoneyBit').controller('AccountTransferCtrl', AccountTransferCtrl)