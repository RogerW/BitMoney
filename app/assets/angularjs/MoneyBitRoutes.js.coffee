app = angular.module('MoneyBit.routes', [ 'ngRoute' ])

app.config ($routeProvider) ->
  $routeProvider.when(
    '/',
    templateUrl: 'views/dashboard.html'
  ).when '/about', templateUrl: 'about.html'
  return
app.controller 'cfgController', ($scope) ->

  ###
  Here you can handle controller for specific route as well.
  ###

  return