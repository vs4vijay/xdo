/**
* xDo app client
* 
* Auther: vs4vijay@gmail.com
*/

var app = angular.module('app', ['ngResource']);

app.controller('AppCtrl', ['$scope', function($scope) {
  // Parent controller for all the Ctrls
  $scope.appModel = {}

}]);

// Can define config block here or use ngRoute
