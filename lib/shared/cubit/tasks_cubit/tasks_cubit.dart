/*import 'dart:core';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iti_project/shared/cubit/tasks_cubit/tasks_states.dart';

class TasksCubit extends Cubit<TasksStates> {
  TasksCubit() : super(TasksInitialState());

  static TasksCubit get(context) => BlocProvider.of(context);


  void createTask(
      {required String title,
        required String time,
        required String date,
        required String uid,
        required context}) {

    FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .set()
        .then((value) {
      emit((CreateUserSuccessStats()));
    }).catchError((error) {
      emit(CreateUserErrorlStats());
    });




  // String? email;
  // String? name;
  // String? phone;
  //
  // Future getTasksData() async {
  //   emit(GetTaskLoadingState());
  //   await FirebaseFirestore.instance
  //       .collection('users')
  //       .doc(FirebaseAuth.instance.currentUser!.uid)
  //       .get()
  //       .then((snapshot) async {
  //     if (snapshot.exists) {
  //       email = snapshot.data()!["email"];
  //       name = snapshot.data()!["name"];
  //       phone = snapshot.data()!["phone"];
  //     }
  //     emit(GetTaskSuccessState());
  //   }).catchError((error) {
  //     emit(GetTaskErrorState(error: error));
  //   });
  // }
}
*/