angular.module('app').controller('ToDoCtrl', ['$scope', 'ToDoService', function($scope, ToDoService) {

  $scope.ToDoModel = {};

  $scope.ToDoList = ToDoService.query();
  // [{name: 'vijay', text: 'This is todo1'}];

  $scope.addToDo = function(toDoModel) {
    ToDoService.save(toDoModel, function(data) {
      $scope.ToDoList.push(data);
      $scope.ToDoModel = {};
    });
  };

  $scope.updateToDo = function(toDoModel) {
    console.log('[+] Updating ToDo ', toDoModel);
    var id = toDoModel._id['$oid'];
    var tempToDoModel = angular.copy(toDoModel);
    delete tempToDoModel.isEdit;
    ToDoService.update({id: id}, tempToDoModel, function(data) {
      //
      toDoModel.isEdit = false;
    });
  };

  $scope.markDone = function(toDoModel) {
    console.log('[+] Marking done ', toDoModel);
    var id = toDoModel._id['$oid'];
    ToDoService.update({id: id}, toDoModel, function(data) {
      //
    });
  };


}]);
