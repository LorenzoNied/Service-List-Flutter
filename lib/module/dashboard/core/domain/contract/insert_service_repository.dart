import 'package:service_list_flutter/module/dashboard/core/domain/model/service_order.dart';

abstract class InsertServiceRepository {
  Future<void> call(ServiceOrder service);
}