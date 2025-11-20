import 'package:injectable/injectable.dart';
import 'package:sqflite/sqflite.dart';
import 'package:service_list_flutter/module/dashboard/core/domain/model/service_order.dart';
import 'package:service_list_flutter/module/dashboard/core/domain/contract/insert_service_repository.dart';

@LazySingleton(as: InsertServiceRepository)
class InsertServiceRepositoryImpl implements InsertServiceRepository {
  final Database db;

  InsertServiceRepositoryImpl(this.db);

  @override
  Future<void> call(ServiceOrder service) async {
    await db.insert('service', service.toMap());
    return;
  }
}
