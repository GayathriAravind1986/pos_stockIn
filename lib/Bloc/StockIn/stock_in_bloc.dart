import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple/Api/apiProvider.dart';

abstract class StockInEvent {}

class StockInLocation extends StockInEvent {}

class StockInSupplier extends StockInEvent {
  String locationId;
  StockInSupplier(this.locationId);
}

class StockInAddProduct extends StockInEvent {
  String locationId;
  StockInAddProduct(this.locationId);
}

class StockInBloc extends Bloc<StockInEvent, dynamic> {
  StockInBloc() : super(dynamic) {
    on<StockInLocation>((event, emit) async {
      await ApiProvider().getLocationAPI().then((value) {
        emit(value);
      }).catchError((error) {
        emit(error);
      });
    });
    on<StockInSupplier>((event, emit) async {
      await ApiProvider().getSupplierAPI(event.locationId).then((value) {
        emit(value);
      }).catchError((error) {
        emit(error);
      });
    });
    on<StockInAddProduct>((event, emit) async {
      await ApiProvider().getAddProductAPI(event.locationId).then((value) {
        emit(value);
      }).catchError((error) {
        emit(error);
      });
    });
  }
}
