angular.module('app').service('ToDoService', ['$resource', function($resource) {
  var CustomerResource = $resource('/api/v1/todos/:id', {}, {
    update: {
      method: 'PUT'
    }
  });

  return CustomerResource;
}]);
