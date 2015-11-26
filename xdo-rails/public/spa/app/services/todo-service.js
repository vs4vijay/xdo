angular.module('app').service('ToDoService', ['$resource', function($resource) {
  var CustomerResource = $resource('/todos/:id', {}, {
    update: {
      method: 'PUT'
    }
  });

  return CustomerResource;
}]);
