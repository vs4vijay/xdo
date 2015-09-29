/**
* xDo app
*/

var app = angular.module('app', ['ngResource']);

app.controller('AppCtrl', ['$scope', function($scope) {
  // Parent controller for all the Ctrls
  $scope.appModel = {}

}]);

// Can define config block here or use ngRoute
