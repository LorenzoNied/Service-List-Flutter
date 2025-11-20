import 'package:flutter/material.dart';
import 'package:service_list_flutter/module/dashboard/core/domain/model/service_order.dart';

class ServiceDetailsView extends StatelessWidget {
  final ServiceOrder service;

  const ServiceDetailsView({super.key, required this.service});

  Color _statusColor(String? status) {
    switch (status) {
      case "aguardando":
        return Colors.orange;
      case "andamento":
        return Colors.blue;
      case "concluido":
        return Colors.green;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detalhes do Serviço"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              service.title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 16),

            Row(
              children: [
                Container(
                  width: 14,
                  height: 14,
                  decoration: BoxDecoration(
                    color: _statusColor(service.status),
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 10),
                Text(
                  service.status ?? "Sem status",
                  style: TextStyle(
                    fontSize: 18,
                    color: _statusColor(service.status),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 24),

            const Text(
              "Observação",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),

            const SizedBox(height: 8),

            Text(
              service.observation?.isNotEmpty == true
                  ? service.observation!
                  : "Nenhuma observação.",
              style: const TextStyle(fontSize: 16, color: Colors.black54),
            ),
          ],
        ),
      ),
    );
  }
}
