angular.module('app').controller('ToDoCtrl', ['$scope', 'ToDoService', function($scope, ToDoService) {

  $scope.ToDoModel = {};

  $scope.ToDoList = ToDoService.query();
  // [{name: 'vijay', text: 'This is todo1'}];

  $scope.addToDo = function(toDoModel) {
    //toDoModel.done = false;
    $scope.ToDoList.unshift(toDoModel);
    $scope.ToDoModel = {};
  };

  $scope.editToDo = function(toDoModel) {
    console.log('[+] Editing done ', toDoModel);
    toDoModel.isEdit = false;
  };

  $scope.markDone = function(toDoModel) {
    console.log('[+] Marking done ', toDoModel);
  };


}]);
