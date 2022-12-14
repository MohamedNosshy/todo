abstract class ProfileStates {}

class ProfileInitialState extends ProfileStates {}

class ProfileSuccessState extends ProfileStates {}

class ProfileLoadingState extends ProfileStates {}

class ProfileErrorState extends ProfileStates {
  final error;
  ProfileErrorState({this.error});
}
