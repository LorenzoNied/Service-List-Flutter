import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:service_list_flutter/core/injection.dart';
import 'package:service_list_flutter/module/dashboard/controller/dashboard_controller.dart';
import 'package:service_list_flutter/module/dashboard/state/service.dart';
import 'package:service_list_flutter/module/insert_service/view/insert_service.dart';
import 'package:service_list_flutter/module/dashboard/core/domain/model/service_order.dart';
import 'package:service_list_flutter/module/insert_service/view/serviceDetailsView.dart';

class DashboardView extends StatelessWidget {
  final controller = getIt<DashaboardController>();

  DashboardView({super.key});

  Color _statusColor(String? status) {
    switch (status) {
      case "aguardando":
        return Colors.orange;
      case "andamento":
        return Colors.blue;
      case "concluido":
        return Colors.green;
      case "cancelado":
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => controller,
      child: BlocBuilder<DashaboardController, DashboardState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: const Text("Serviços"),
              centerTitle: true,
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () async {
                final service = await Navigator.push<ServiceOrder>(
                  context,
                  MaterialPageRoute(builder: (_) => InsertService()),
                );

                if (service != null && context.mounted) {
                  controller.insertServiceUsecase(service);
                }
              },
              child: const Icon(Icons.add),
            ),
            body: _buildBody(state),
          );
        },
      ),
    );
  }

  Widget _buildBody(DashboardState state) {
    if (state is DashboardLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (state is DashboardLoaded) {
      if (state.services.isEmpty) {
        return const Center(
          child: Text(
            "Nenhum serviço encontrado",
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
        );
      }

      return ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: state.services.length,
        itemBuilder: (context, index) {
          final service = state.services[index];
          return _buildServiceCard(service, context);
        },
      );
    }

    return const Center(
      child: Text(
        "Carregando lista...",
        style: TextStyle(fontSize: 16),
      ),
    );
  }

 Widget _buildServiceCard(ServiceOrder service, BuildContext context) {
  return InkWell(
    borderRadius: BorderRadius.circular(16),
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => ServiceDetailsView(service: service),
        ),
      );
    },
    child: Card(
      elevation: 4,
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Status bolinha
            Container(
              width: 12,
              height: 12,
              margin: const EdgeInsets.only(top: 5),
              decoration: BoxDecoration(
                color: _statusColor(service.status),
                shape: BoxShape.circle,
              ),
            ),

            const SizedBox(width: 14),

            // Conteúdo
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Título
                  Text(
                    service.title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),

                  const SizedBox(height: 6),

                  // Solicitante (customer)
                  Text(
                    "Solicitante: ${service.customer}",
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black87,
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  // Observação (se existir)
                  if (service.description != null &&
                      service.description!.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.only(top: 6),
                      child: Text(
                        service.description!,
                        style: const TextStyle(
                          fontSize: 13,
                          color: Colors.black54,
                        ),
                      ),
                    ),

                    const SizedBox(height: 6),

                  // Status com cor
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: _statusColor(service.status),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      service.status ?? "Sem status",
                      style: const TextStyle(
                        fontSize: 13,
                        color: Colors.white,        // 👈 texto branco
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}