app = angular.module('MoneyBit.dashboard', ['ngMaterial', 'ngDropdowns'])

app.controller('getAccounts', ['$scope', '$http', ($scope, $http) ->

  ###this controller uses the config.params object as the request payload###
  config = params:
    'rows': 5
    'id': '{index}'
    'title': '{username}'
    'balance': '{numberLength|4}'
    'description': '{string|20}'
    'callback': 'JSON_CALLBACK'
  $http.jsonp('http://www.filltext.com', config, {}).success (data) ->
    $scope.accounts = data
    return

  $scope.ddSelectOptions = [
    {
      text: 'Option1'
      value: 'a value'
    }
    {
      text: 'Option2'
      value: 'another value'
      someprop: 'somevalue'
    }
    { divider: true }
    {
      divider: true
      text: 'divider label'
    }
    {
      text: 'Option4'
      href: '#option4'
    }
  ]
  $scope.ddSelectSelected = {}
  return
]);

app.controller('getInvoices', ['$scope', '$http', ($scope, $http) ->

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
  $http.jsonp('http://www.filltext.com', config, {}).success (data) ->
    $scope.invoices = data
    return

  $scope.invoice_types = {0: 'invoice__add-fund', 1: 'invoice__withdrawal'}
  $scope.consumption_types = {0: 'directions_car', 1: 'local_bar', 2: 'restaurant_menu', 3:'store_mall_directory', 4:'attach_money'}

  $scope.showAdvanced = (ev) ->
    alert "Press FAP"
    return

  return
]);

app.controller('consumptions', ['$scope', '$mdDialog', ($scope, $mdDialog) ->

  $scope.showAdvanced = (ev) ->
    $mdDialog.show(
      controller: DialogController
      templateUrl: 'assets/templates/add_consuption_dialog.html'
      targetEvent: ev).then ((answer) ->
        $scope.alert = 'You said the information was "' + answer + '".'
        return
      ), ->
        $scope.alert = 'You cancelled the dialog.'
        return
    return

  return
])

DialogController = ($scope, $mdDialog) ->

  $scope.hide = ->
    $mdDialog.hide()
    return

  $scope.cancel = ->
    $mdDialog.cancel()
    return

  $scope.answer = (answer) ->
    $mdDialog.hide answer
    return

  return