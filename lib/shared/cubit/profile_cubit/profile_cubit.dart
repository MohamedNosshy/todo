import 'dart:core';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iti_project/shared/cubit/profile_cubit/profile_state.dart';

class ProfileCubit extends Cubit<ProfileStates> {
  ProfileCubit() : super(ProfileInitialState());

  static ProfileCubit get(context) => BlocProvider.of(context);

  String? email;
  String? name;
  String? phone;

  Future getUserData() async {
    emit(ProfileLoadingState());
    await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((snapshot) async {
      if (snapshot.exists) {
        email = snapshot.data()!["email"];
        name = snapshot.data()!["name"];
        phone = snapshot.data()!["phone"];
      }
      emit(ProfileSuccessState());
    }).catchError((error) {
      emit(ProfileErrorState(error: error));
    });
  }
}
