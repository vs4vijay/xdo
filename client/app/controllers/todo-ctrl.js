angular.module('app').controller('ToDoCtrl', ['$scope', 'ToDoService', function($scope, CustomerService) {

  $scope.ToDoModel = {};

  $scope.ToDoList = [{name: 'vijay', text: 'This is todo1'}];//ToDoService.query();

  $scope.addToDo = function(toDoModel) {
    $scope.ToDoList.unshift(toDoModel);
    $scope.ToDoModel = {};
  };


}]);
