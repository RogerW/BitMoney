app = angular.module('MoneyBit.controller', [ 'ngMaterial' ])

app.controller 'AppCtrl', [
  '$scope'
  '$mdSidenav'
  ($scope, $mdSidenav) ->

    $scope.toggleSidenav = (menuId) ->
      $mdSidenav(menuId).toggle()
      return
    
    $scope.menuItems = [
      {'label':'Главная', 'href':"/", 'icon':'dashboard'},
      {'label':'Профиль', 'href':"/user", 'icon':'account_box'},
      {'label':'Выйти', 'href':"/logout", 'icon':'exit_to_app'}
    ]
    
    selectMenuItem = (menuItem) ->
      $scope.selected = if angular.isNumber(menuItem) then $scope.menuItems[menuItem] else menuItem
      alarm menuItem
      return

    return
]