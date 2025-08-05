import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple/Api/apiProvider.dart';

abstract class ReportTodayEvent {}

class ReportTodayList extends ReportTodayEvent {
  String fromDate;
  String toDate;
  ReportTodayList(this.fromDate, this.toDate);
}

class ReportTodayBloc extends Bloc<ReportTodayEvent, dynamic> {
  ReportTodayBloc() : super(dynamic) {
    on<ReportTodayList>((event, emit) async {
      await ApiProvider()
          .getReportTodayAPI(event.fromDate, event.toDate)
          .then((value) {
        emit(value);
      }).catchError((error) {
        emit(error);
      });
    });
  }
}
