import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app/app.dart';
import 'app/app_bloc_observer.dart';
import 'data/data_helper.dart';



Future<void> main() async {

  Bloc.observer = AppBlocObserver();
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  runZonedGuarded(
        () => runApp(App(appBloc: DataHelperImpl.instance.appBloc)),
        (error, stackTrace) => log(error.toString(), stackTrace: stackTrace),
  );
}

