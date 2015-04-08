class AccountsCtrl extends @NGController
  @register window.App

  @$inject: [
    '$scope',
    'Account'
  ]
  
  init: ->
    @loadAccounts()

  loadAccounts: ->
    @Account.query().then (results) =>
      @all = results
      console.log @all

  create: ->
    new @Account(@newAccount).create().then (results) =>
      @loadAccounts()

  destroy: (account_id) ->
    @Account.$delete(@Account.resourceUrl(account_id)).then (results) =>
      @loadAccounts()

