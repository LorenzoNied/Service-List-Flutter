import 'package:injectable/injectable.dart';
import 'package:service_list_flutter/module/dashboard/core/domain/contract/fetch_service_repository.dart';
import 'package:service_list_flutter/module/dashboard/core/domain/model/service_order.dart';
import 'package:sqflite/sqflite.dart';

@LazySingleton(as: FetchServiceRepository)
class FetchAllServiceOrderRepositoryImpl implements FetchServiceRepository {
  final Database database;

  FetchAllServiceOrderRepositoryImpl({required this.database});

  @override
  Future<List<ServiceOrder>> call() async {
    final db = await database.database;
    final result = await db.query('service');
    return result.map((e) => ServiceOrder.fromMap(e)).toList();
  }
}
