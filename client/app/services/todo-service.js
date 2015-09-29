angular.module('app').service('ToDoService', ['$resource', function($resource) {
  var CustomerResource = $resource('/api/todo', {}, {});

  return CustomerResource;
}]);
