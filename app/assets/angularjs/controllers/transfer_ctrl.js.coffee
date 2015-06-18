AccountTransferCtrl = ($rootScope, $scope, $mdDialog, AccountTransfer, account, Account) ->
  
  clone = (obj) ->
    return obj  if obj is null or typeof (obj) isnt "object"
    temp = new obj.constructor()
    for key of obj
      temp[key] = clone(obj[key])
    temp

  $scope.source = clone(account) || {}
  $scope.destination_accounts = []
  
  $scope.account_transfer = {}

  accounts_loaded = true
  $scope.loadAccounts = ->
    console.log "load accounts"
    if accounts_loaded
      accounts_loaded = false
      $scope.accounts = []
      Account.query().then (results) =>
        console.log results
        $scope.accounts = results
        return
        
  get_destination_accounts = (source, accounts) ->
    destination_accounts = []
    console.log accounts
    angular.forEach accounts, (value, key) ->
      if value.id != source.id
        destination_accounts.push(value)
    console.log destination_accounts
    destination_accounts
    
  $scope.change_source = () ->
    console.log "change source"
    $scope.destination_accounts = get_destination_accounts($scope.source, $scope.accounts)
    
  $scope.loadDestination = () ->
    console.log accounts_loaded
    if accounts_loaded
      accounts_loaded = false
      $scope.accounts = []
      Account.query().then (results) =>
        $scope.accounts = results
        $scope.destination_accounts = get_destination_accounts($scope.source, $scope.accounts)
        return
    else
      $scope.change_source()
    return

  $scope.create = ->
    $scope.account_transfer.account_id = $scope.source.id

    new AccountTransfer($scope.account_transfer).create().then ((results) =>
      $rootScope.$broadcast('account:add_consumption',  $scope.account_transfer.account_id, $scope.account_transfer.amount)
      $rootScope.$broadcast('account:add_fund',  $scope.account_transfer.destination_id, $scope.account_transfer.amount)
      $mdDialog.hide(results.message)
      return
    ), (error) ->
      if error.status == 422
        $scope.errors = error.data.errors
        $scope.errorShow = true
        return
      return
    return

  $scope.hide = ->
    $mdDialog.hide()
    return

  $scope.cancel = ->
    $mdDialog.cancel()
    return

  return

AccountTransferCtrl.$inject = [
  '$rootScope'
  '$scope'
  '$mdDialog'
  'AccountTransfer'
  'account'
  'Account']

angular.module('MoneyBit').controller('AccountTransferCtrl', AccountTransferCtrl)