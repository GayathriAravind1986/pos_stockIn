import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple/Api/apiProvider.dart';

abstract class LoginInEvent {}

class LoginIn extends LoginInEvent {
  String email;
  String password;
  LoginIn(this.email, this.password);
}

class LoginInBloc extends Bloc<LoginInEvent, dynamic> {
  LoginInBloc() : super(dynamic) {
    on<LoginIn>((event, emit) async {
      await ApiProvider().loginAPI(event.email, event.password).then((value) {
        emit(value);
      }).catchError((error) {
        emit(error);
      });
    });
  }
}
