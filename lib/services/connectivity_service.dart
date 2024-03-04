import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class ConnectivityService with ChangeNotifier {
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;
  bool _isConnected = false;

  ConnectivityService() {
    _connectivitySubscription = _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  bool get isConnected => _isConnected;

  void _updateConnectionStatus(ConnectivityResult result) {
    print('Connectivity status: $result');
    _isConnected = (result != ConnectivityResult.none);
    notifyListeners(); // Notifica a los escuchas sobre el cambio de conectividad
  }

  void checkInitialAuthStatus() {
    // Lógica para verificar el estado de autenticación inicial
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }
}
