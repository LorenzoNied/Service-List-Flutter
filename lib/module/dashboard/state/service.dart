import 'package:service_list_flutter/module/dashboard/core/domain/model/service_order.dart';

abstract class DashboardState {}

class DashboardInitial extends DashboardState {}

class DashboardLoading extends DashboardState {}

class DashboardLoaded extends DashboardState {
  final List<ServiceOrder> services;

  DashboardLoaded(this.services);
}