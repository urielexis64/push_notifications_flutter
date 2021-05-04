// SHA1: B3:CE:AD:19:26:D9:96:5C:89:8A:AF:64:B8:3F:62:B0:2F:E8:78:2A
import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationService {
  static FirebaseMessaging messaging = FirebaseMessaging.instance;
  static String? token;
  static StreamController<String> _messageStream = StreamController.broadcast();
  static Stream<String> get messageStream => _messageStream.stream;

  static Future _backgroundHandler(RemoteMessage message) async {
    /*print('background handler ${message.messageId}');*/
    _messageStream.add(message.notification?.title ?? 'No title');
  }

  static Future _onMessageHandler(RemoteMessage message) async {
    /* print('onMessage handler ${message.messageId}'); */
    _messageStream.add(message.notification?.title ?? 'No title');
  }

  static Future _onMessageOpenApp(RemoteMessage message) async {
    /* print('onMessageOpenApp handler ${message.messageId}'); */
    _messageStream.add(message.notification?.title ?? 'No title');
  }

  static Future initializeApp() async {
    // push notifications
    await Firebase.initializeApp();
    token = await FirebaseMessaging.instance.getToken();
    print(token);

    // Handlers
    FirebaseMessaging.onBackgroundMessage(_backgroundHandler);
    FirebaseMessaging.onMessage.listen(_onMessageHandler);
    FirebaseMessaging.onMessageOpenedApp.listen(_onMessageOpenApp);
    // local notifications
  }

  static closeStreams() {
    _messageStream.close();
  }
}
