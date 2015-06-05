AccountDialogCtrl = ($scope, $rootScope, $mdDialog, Account, account) ->
	$scope.account = account || []

	console.log($scope.account)

	$scope.loadCurrency = ->
		$scope.account.balance_currency = $scope.account.balance.currency.isoCode
		console.log $scope.account.balance_currency


	$scope.update_or_create = ->
		unless($scope.account.id > 0)
			new Account($scope.account).create().then (results) =>
				$rootScope.$broadcast('account:add_account',  results)
				$mdDialog.hide()
				return
		else
		  $scope.account.update().then (results) =>
			  $rootScope.$broadcast('account:add_account',  results)
			  $mdDialog.hide()
			  return
	$scope.cancel = () ->
		$mdDialog.hide()

	$scope.accountCurrencies = [
		{'currency':'USD', 'description':'Американский доллар'}
		{'currency':'EUR', 'description':'Евро'}
		{'currency':'RUB', 'description':'Рубль'}
	]


AccountDialogCtrl.$inject = [
	'$scope'
	'$rootScope'
	'$mdDialog'
	'Account'
	'account'
]
angular.module('MoneyBit').controller 'AccountDialogCtrl', AccountDialogCtrl
return