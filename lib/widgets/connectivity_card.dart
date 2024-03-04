

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueba2/services/connectivity_service.dart';

class ConnectivityCard extends StatelessWidget {
  const ConnectivityCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ConnectivityService>(
      builder: (context, connectivityService, child) {
        return Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Estado de la conexión: ${connectivityService.isConnected}',
              style: const TextStyle(fontSize: 20),
            ),
          ),
        );
      },
    );
  } 
}