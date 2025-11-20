import 'package:service_list_flutter/module/dashboard/core/domain/model/service_order.dart';

abstract class FetchServiceRepository {
  Future<List<ServiceOrder>> call ();
}