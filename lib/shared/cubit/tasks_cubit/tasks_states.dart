abstract class TasksStates {}

class TasksInitialState extends TasksStates {}

class CreateTasksLoadingState extends TasksStates {}

class CreateTasksSuccessState extends TasksStates {}

class CreateTaskErrorState extends TasksStates {}




class GetTaskErrorState extends TasksStates {
  final error;
  GetTaskErrorState({this.error});
}

class GetTaskLoadingState extends TasksStates {}

class GetTaskSuccessState extends TasksStates {}



