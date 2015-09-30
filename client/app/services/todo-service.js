angular.module('app').service('ToDoService', ['$resource', function($resource) {
  var CustomerResource = $resource('/api/v1/todos', {}, {});

  return CustomerResource;
}]);
