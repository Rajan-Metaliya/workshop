import 'dart:async';

import 'package:flutter/material.dart';

import 'app/my_app.dart';
import 'data/repo/repo.dart';
import 'data/service/service.dart';

Future<void> main() async {
  runZonedGuarded(() async {
    initService();
    initRepo();

    await apiServer.init(baseUrl: "http://10.0.2.2:8080/");

    return runApp(const MyApp());
  }, (error, stack) {
    debugPrint(error.toString());
  });
}
