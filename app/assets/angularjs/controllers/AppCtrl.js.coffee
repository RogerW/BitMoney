app = angular.module('MoneyBit.controller', [ 'ngMaterial' ])

app.controller 'AppCtrl', [
  '$scope'
  '$mdSidenav'
  ($scope, $mdSidenav) ->

    $scope.toggleSidenav = (menuId) ->
      $mdSidenav(menuId).toggle()
      return

    return

    $scope.menuItems = [
      {'label':'Главная', 'href':"/", 'icon':'dashboard'},
      {'label':'Профиль', 'href':"/user", 'icon':'account_box'},
      {'label':'Выйти', 'href':"/logout", 'icon':'exit_to_app'}
    ]
]