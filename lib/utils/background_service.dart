import 'dart:isolate';
import 'dart:ui';

import 'package:restaurant_app/services/api_provider.dart';
import 'package:restaurant_app/utils/notification_helper.dart';

import '../main.dart';

final ReceivePort port = ReceivePort();

class BackgroundService {
  static BackgroundService? _instance;
  static const String _isolateName = 'isolate';
  static SendPort? _uiSendPort;

  BackgroundService._internal() {
    _instance = this;
  }

  factory BackgroundService() => _instance ?? BackgroundService._internal();

  void initializeIsolate() {
    IsolateNameServer.registerPortWithName(
      port.sendPort,
      _isolateName,
    );
  }

  static Future<void> callback() async {
    final NotificationHelper notificationHelper = NotificationHelper();
    final apiProvider = ApiProvider();
    apiProvider.getRestaurant().then((res) async {
      await notificationHelper.showNotification(
          flutterLocalNotificationsPlugin, res);
    });
    _uiSendPort ??= IsolateNameServer.lookupPortByName(_isolateName);
    _uiSendPort?.send(null);
  }
}
