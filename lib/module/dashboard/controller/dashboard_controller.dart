import 'package:injectable/injectable.dart';
import 'package:service_list_flutter/module/dashboard/core/domain/model/service_order.dart';
import 'package:service_list_flutter/module/dashboard/core/domain/usecase/fetch_pessoas_usecase.dart';
import 'package:service_list_flutter/module/dashboard/core/domain/usecase/insert_service_usecase.dart';
import 'package:service_list_flutter/module/dashboard/state/service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@lazySingleton
class DashaboardController extends Cubit<DashboardState>{
  final FetchServiceUsecase fetchServiceUsecase;
  final InsertServiceUsecase insertServiceUsecase;

  DashaboardController({
    required this.fetchServiceUsecase, 
    required this.insertServiceUsecase,
  }) : super(DashboardInitial()) {
    fetchservice();
  }

  Future<void> fetchservice() async{
    emit(DashboardLoading());
    final services = await fetchServiceUsecase();
    emit(DashboardLoaded(services));
  }

  Future<void> insertService(ServiceOrder service) async{
    emit(DashboardLoading());
    await insertServiceUsecase(service);
    await fetchservice();
  }
}