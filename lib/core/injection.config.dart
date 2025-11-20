// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:service_list_flutter/core/database/database.dart' as _i649;
import 'package:service_list_flutter/core/database/database_module.dart' as _i504;
import 'package:service_list_flutter/module/dashboard/controller/dashboard_controller.dart'
    as _i263;
import 'package:service_list_flutter/module/dashboard/core/domain/contract/fetch_service_repository.dart'
    as _i776;
import 'package:service_list_flutter/module/dashboard/core/domain/contract/insert_service_repository.dart'
    as _i80;
import 'package:service_list_flutter/module/dashboard/core/domain/usecase/fetch_pessoas_usecase.dart'
    as _i1063;
import 'package:service_list_flutter/module/dashboard/core/domain/usecase/insert_service_usecase.dart'
    as _i444;
import 'package:service_list_flutter/module/dashboard/data/repository/fetch_service_repository.dart'
    as _i419;
import 'package:service_list_flutter/module/dashboard/data/repository/insert_service_repository.dart'
    as _i860;
import 'package:sqflite/sqflite.dart' as _i779;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final databaseModule = _$DatabaseModule();
    await gh.factoryAsync<_i779.Database>(
      () => databaseModule.database,
      preResolve: true,
    );
    gh.lazySingleton<_i649.AppDatabase>(() => databaseModule.appDatabase);
    gh.lazySingleton<_i80.InsertServiceRepository>(
      () => _i860.InsertServiceRepositoryImpl(gh<_i779.Database>()),
    );
    gh.lazySingleton<_i776.FetchServiceRepository>(
      () => _i419.FetchAllServiceOrderRepositoryImpl(
        database: gh<_i779.Database>(),
      ),
    );
    gh.factory<_i1063.FetchServiceUsecase>(
      () => _i1063.FetchServiceUsecase(
        fetchServiceRepository: gh<_i776.FetchServiceRepository>(),
      ),
    );
    gh.factory<_i444.InsertServiceUsecase>(
      () => _i444.InsertServiceUsecase(
        insertServiceRepository: gh<_i80.InsertServiceRepository>(),
      ),
    );
    gh.factory<_i263.DashaboardController>(
      () => _i263.DashaboardController(
        fetchServiceUsecase: gh<_i1063.FetchServiceUsecase>(),
        insertServiceUsecase: gh<_i444.InsertServiceUsecase>(),
      ),
    );
    return this;
  }
}

class _$DatabaseModule extends _i504.DatabaseModule {}
