import 'package:injectable/injectable.dart';
import 'package:service_list_flutter/module/dashboard/core/domain/contract/fetch_service_repository.dart';
import 'package:service_list_flutter/module/dashboard/core/domain/model/service_order.dart';

@injectable
class FetchServiceUsecase {
  final FetchServiceRepository fetchServiceRepository;

  FetchServiceUsecase({required this.fetchServiceRepository});

  Future<List<ServiceOrder>> call () async{
    return await fetchServiceRepository();
  }
}