import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// import '../../../core/src/app_export.dart';
import 'state.dart';

class InternetCubit extends Cubit<InternetState> {
  late StreamSubscription<ConnectivityResult> _subscription;

  InternetCubit() : super(InternetInitial()) {
    _subscription =
        Connectivity().onConnectivityChanged.listen(_handleConnectivityChange)
            as StreamSubscription<ConnectivityResult>;

    // Check the initial connectivity state
    checkConnection();
  }

  void _handleConnectivityChange(List<ConnectivityResult> result) {
    if (result.contains(ConnectivityResult.wifi) ||
        result.contains(ConnectivityResult.mobile)) {
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
