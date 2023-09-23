import 'dart:io';

import 'package:flutter/material.dart';

import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:window_manager/window_manager.dart';

import 'domain/domain.dart';
import 'photo_app.dart';
import 'core/core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if(Platform.isWindows) {
    // Initialize FFI
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
  }
  if (Platform.isMacOS   || Platform.isLinux || Platform.isWindows) {
    await windowManager.ensureInitialized();
    WindowOptions windowOptions = const WindowOptions(
      minimumSize: Size(800, 600),
      size: Size(800, 600),
      center: true,
      alwaysOnTop: false,
      skipTaskbar: false,
      fullScreen: false,
      backgroundColor: Colors.transparent,
      title: 'Users',
      titleBarStyle: TitleBarStyle.normal,
    );
    windowManager.waitUntilReadyToShow(windowOptions, () async {
      await windowManager.show();
      await windowManager.focus();
    });
  }

  BlocFactory.instance.initialize();

  await DebugData.createFake();

  ///Запускаем наше приложение
  runApp(const PhotoApp());
}

