'use strict'

###*
 # @ngdoc overview
 # @name irishclimbingApp
 # @description
 # # irishclimbingApp
 #
 # Main module of the application.
###
angular
  .module('irishclimbingApp', [
    'ngAnimate',
    'ngCookies',
    'ngRoute',
    'ngSanitize'
  ])
  .config ($routeProvider) ->
    $routeProvider
      .when '/home',
        templateUrl: 'views/home.html'
        controller: 'HomeCtrl'
      .when '/register',
        templateUrl: 'views/register.html'
        controller: 'RegisterCtrl'
      .when '/contact',
        templateUrl: 'views/contact.html'
        controller: 'ContactCtrl'
      .when '/admin',
        templateUrl: 'views/admin.html'
        controller: 'AdminCtrl'
      .otherwise
        redirectTo: '/home'

