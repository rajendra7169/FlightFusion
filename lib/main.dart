import 'package:flightfusion/app.dart';
import 'package:flightfusion/app_config.dart';
import 'package:flightfusion/firebase_options.dart';
import 'package:flightfusion/services/api_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

Future<void> setupApp({
  bool isProduction = false,
  bool isDevelopment = false,
  bool isStaging = false,
}) async {
  WidgetsFlutterBinding.ensureInitialized();
  AppConfig.appFlavor = isProduction
      ? Flavor.production
      : isStaging
          ? Flavor.staging
          : Flavor.development;
  await GetStorage.init();
  await initFirebase();
  await ApiService().init();

  start();
}

Future<void> initFirebase() async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // await FirebaseService().initializeFirebaseMessaging();
  // await FirebaseService().initializeFirebaseMessagingHandler();
}
