import 'package:flutter_bloc/flutter_bloc.dart';

/// DemoEvent Class
abstract class DemoEvent {}

/// FetchDemo Class
class FetchDemo extends DemoEvent {}

/// RotiDemo Class
class RotiDemo extends DemoEvent {}

/// DemoBloc Class
class DemoBloc extends Bloc<DemoEvent, dynamic> {
  DemoBloc() : super({
    "name" : "sehri"
  }) {
    on<FetchDemo>((event, emit)  {
      emit({
        "name" : "Biriyani"
      });
    });
    on<RotiDemo>((event, emit)  {
      emit({
        "name" : "Roti"
      });
    });
  }
}
