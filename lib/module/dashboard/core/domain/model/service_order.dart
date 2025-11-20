class ServiceOrder {
  int? id;
  String? status;
  String? description;
  String? observation; 
  String customer;
  String title;
  String? startedAt;
  String? finishedAt;


  ServiceOrder({
    this.id, 
    this.status = "aguardando", 
    this.description, 
    this.observation,
    required this.customer,
    required this.title,
    this.startedAt,
    this.finishedAt
  });

  Map<String, dynamic> toMap() {
    return {
      'status': status,
      'description': description,
      'observation': observation,
      'customer': customer,
      'title': title,
      'started_at': startedAt,
      'finished_at': finishedAt
    };
  }

 factory ServiceOrder.fromMap(Map<String, dynamic> map) {
    return ServiceOrder(
      id: map['id'],
      status: map['status'],
      description: map['description'],
      observation: map['observation'],
      customer: map['customer'],
      title: map['title'],
      startedAt: map['started_at'],
      finishedAt: map['finished_at']
    );
  }
}