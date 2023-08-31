import 'package:boysun_tourism/splash_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../homeScreen.dart';
import '../no_internet_dialog.dart';
import 'internet_cubit.dart';

class AppRouter extends StatelessWidget {
  const AppRouter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InternetCubit, InternetState>(builder: (context, state) {
      return Navigator(
        pages: [
          if (state is InternetInitial) const MaterialPage(child: HomeScreen()),
          if (state is InternetDisconnected)
            const MaterialPage(child: NoIntertnet()),
        ],
        onPopPage: (route, result) => route.didPop(result),
      );
    });
  }
}
