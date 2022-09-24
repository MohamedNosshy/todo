import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iti_project/shared/cubit/login/states.dart';

import '../../../models/userModel.dart';
import '../../../modules/todo_app/todo_layout.dart';

class LoginCubit extends Cubit<LoginStats> {
  LoginCubit() : super(LoginInitialStats());

  static LoginCubit get(context) => BlocProvider.of(context);

  UserModel? loginModel;

  void userLogin({
    required String email,
    required String password,
    required context,
  }) {
    emit(LoginLoadinglStats());
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      print(value.user!.email);
      print(value.user!.uid);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeLayout()),
      );
      emit(LoginSuccessStats());
    }).catchError((error) {
      emit(LoginErrorlStats());
    });
  }

  bool isShowePassword = true;
  IconData icon = Icons.visibility;
  void showePassword() {
    isShowePassword = !isShowePassword;
    icon = isShowePassword ? Icons.visibility : Icons.visibility_off;
    emit(LoginShowePasswordlStats());
  }
}
