import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'internet_state.dart';

class InternetCubit extends Cubit<InternetState> {
  final Connectivity connectivity;
  StreamSubscription? connectivityStreamSubscription;

  InternetCubit({required this.connectivity}) : super(InternetInitial()) {
    checkingInternet();
  }

  void checkingInternet() async {
    connectivityStreamSubscription =
        connectivity.onConnectivityChanged.listen((connectivityResult) {
      connectivityResult == ConnectivityResult.none
          ? emit(InternetDisconnected())
          : emit(InternetInitial());
    });
  }
}
