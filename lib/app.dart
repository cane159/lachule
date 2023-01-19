import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:lachule/bases/app_theme.dart';
import 'package:lachule/binding/main_binding.dart';
import 'package:lachule/routes/app_pages.dart';
import 'package:lachule/service/app_service.dart';
import 'package:lachule/service/notification_servide.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  String? mToken;
  late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  final NotificationService _notiService = Get.find();

  @override
  void initState() {
    // TODO: implement initState
    requestPermission();
    getToken();
    initInfo();
    super.initState();
  }

  void requestPermission() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;

    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('User granted permission');
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      print('User granted provisional permission');
    } else {
      print('User declined or has not accepted permission');
    }
  }

  void getToken() async {
    await FirebaseMessaging.instance.getToken().then((token) {
      setState(() {
        mToken = token;
        print('My token is ${mToken}');
      });
      AppService.call(
        context: Get.context!,
        request: _notiService.createDevice(
          userID: 'pushgears_dev_1234',
          deviceToken: token ?? '',
        ),
        onSuccess: (response) async {
          print('================Success push device================');
        },
        onFail: (response) async {
          print('================Fail push device================');
        },
      );
      saveToken(token!);
    });
  }

  void saveToken(String token) async {
    await FirebaseFirestore.instance.collection("Usertokens").doc("User").set({
      'token': token,
    });
  }

  initInfo() {
    var androidInitialize =
        const AndroidInitializationSettings('@mipmap/ic_launcher');
    var initializationSettings =
        InitializationSettings(android: androidInitialize);
    flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
    );

    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      print('=========================onMessage=========================');
      print(
          'onMessage: ${message.notification?.title}/${message.notification?.body}');

      BigTextStyleInformation bigTextStyleInformation = BigTextStyleInformation(
        message.notification!.body.toString(),
        htmlFormatBigText: true,
        contentTitle: message.notification!.title.toString(),
        htmlFormatContentTitle: true,
      );
      AndroidNotificationDetails androidPlatfornChannelSpecifics =
          AndroidNotificationDetails(
        'dbfood',
        'dbfood',
        importance: Importance.max,
        styleInformation: bigTextStyleInformation,
        priority: Priority.max,
        playSound: true,
        //sound: const RawResourceAndroidNotificationSound('notification'),
      );
      NotificationDetails platformChannelSpecifics =
          NotificationDetails(android: androidPlatfornChannelSpecifics);
      await flutterLocalNotificationsPlugin.show(
        0,
        message.notification?.title,
        message.notification?.body,
        platformChannelSpecifics,
        payload: message.data['title'],
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: appTheme,
      initialRoute: AppPages.INITIAl,
      getPages: AppPages.routes,
      defaultTransition: Transition.fade,
      transitionDuration: const Duration(microseconds: 500),
      initialBinding: MainBinding(),
    );
  }
}
