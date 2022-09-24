abstract class RegisterStats {}

class RegisterInitialStats extends RegisterStats {}

class RegisterSuccessStats extends RegisterStats {}

class RegisterLoadinglStats extends RegisterStats {}

class RegisterShowePasswordlStats extends RegisterStats {}

class CreateUserSuccessStats extends RegisterStats {}

class CreateUserErrorlStats extends RegisterStats {}

class RegisterErrorlStats extends RegisterStats {
  final error;
  RegisterErrorlStats({this.error});
}



