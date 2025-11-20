import 'package:service_list_flutter/module/dashboard/core/domain/model/service_order.dart';
import 'package:injectable/injectable.dart';
import 'package:service_list_flutter/module/dashboard/core/domain/contract/insert_service_repository.dart';

@injectable
class InsertServiceUsecase {
  final InsertServiceRepository insertServiceRepository;

  InsertServiceUsecase({required this.insertServiceRepository});

  Future<void> call (ServiceOrder service) async {
      await insertServiceRepository(service);
  }  
}