mainApp = angular.module 'main', ['ui.bootstrap', 'ui.router']

mainApp.config ($stateProvider, $urlRouterProvider) =>

  $urlRouterProvider.otherwise '/' 

  $stateProvider.state 'home',
    url: '/'
    controller: 'HomeController'