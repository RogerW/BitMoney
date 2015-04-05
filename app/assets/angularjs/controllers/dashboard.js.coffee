app = angular.module('MoneyBit.dashboard', [])

app.controller('getAccounts', ['$scope', '$http', (scope, http) ->

  ###this controller uses the config.params object as the request payload###
  config = params:
    'rows': 5
    'id': '{index}'
    'title': '{username}'
    'balance': '{numberLength|4}'
    'description': '{string|20}'
    'callback': 'JSON_CALLBACK'
  http.jsonp('http://www.filltext.com', config, {}).success (data) ->
    scope.accounts = data
    return
  return
]);

app.controller('getInvoices', ['$scope', '$http', (scope, http) ->

  ###this controller uses the config.params object as the request payload###

  config = params:
    'rows': 20
    'id': '{index}'
    'account_id': '{number|5}'
    'created_at': '{date}'
    'amount': '{numberLength|4}'
    'note': '{lorem|3}'
    'invtype': '[0,1]'
    'consumption_type': '[0,1,2,3,4]'
    'callback': 'JSON_CALLBACK'
  http.jsonp('http://www.filltext.com', config, {}).success (data) ->
    scope.invoices = data
    return

  scope.invoice_types = {0: 'invoice__add-fund', 1: 'invoice__withdrawal'}
  scope.consumption_types = {0: 'directions_car', 1: 'local_bar', 2: 'restaurant_menu', 3:'store_mall_directory', 4:'attach_money'}
  return
]);