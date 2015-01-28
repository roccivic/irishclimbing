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
  .config ($routeProvider, $httpProvider) ->
    $httpProvider.defaults.withCredentials = true;
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
      .when '/admin/competitors',
        templateUrl: 'views/admin/competitors.html'
        controller: 'AdminCompetitorsCtrl'
      .when '/admin/sponsors',
        templateUrl: 'views/admin/sponsors.html'
        controller: 'AdminSponsorsCtrl'
      .when '/admin/logout',
        templateUrl: 'views/admin/logout.html'
        controller: 'AdminLogoutCtrl'
      .otherwise
        redirectTo: '/home'

