// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';

import 'package:isaghi/core/src/app_exports.dart';

import 'state.dart';

class InternetCubit extends Cubit<InternetState> {
  final Connectivity _connectivity;
  late StreamSubscription<List<ConnectivityResult>> _subscription;

  InternetCubit(
    this._connectivity,
  ) : super(InternetInitial()) {
    // Initialize the subscription in the constructor
    _subscription =
        _connectivity.onConnectivityChanged.listen(_handleConnectivityChange);

    // Check the initial connectivity state
    checkConnection();
  }

  void _handleConnectivityChange(List<ConnectivityResult> result) {
    if (result.contains(ConnectivityResult.wifi)) {
      connected();
    } else {
      notConnected();
    }
  }

  void checkConnection() {
    Connectivity().checkConnectivity().then(_handleConnectivityChange);
  }

  void connected() {
    emit(ConnectedState(message: "Connected"));
  }

  void notConnected() {
    emit(NotConnectedState(message: "Not Connected"));
  }

  @override
  Future<void> close() {
    // Cancel the subscription only if it's not null
    _subscription.cancel();
    return super.close();
  }
}
