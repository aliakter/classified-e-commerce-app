import 'dart:io';
import 'package:classified_apps/apps/data/remote_urls.dart';
import 'package:classified_apps/apps/global_widget/firebase_options.dart';
import 'package:classified_apps/apps/views/splash/localization/app_localizations_setup.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'apps/bindings/app_bindings.dart';
import 'apps/core/utils/my_theme.dart';
import 'apps/routes/pages.dart';
import 'apps/routes/routes.dart';

late final SharedPreferences sharedPreferences;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  Stripe.publishableKey =
      'pk_test_51LtUkeIH2i6FoGaE6IFfIDMGyP5Tnzm5fT4HM0340Eu8NnufyOmyvqBn14BRihpYaPdUrcVniN3AkmHZPFjLhR8t00QIxImi8s';

  await dotenv.load(fileName: "assets/.env");
  sharedPreferences = await SharedPreferences.getInstance();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );

  runApp(MyApp());
}

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message,
    {BuildContext? context}) async {
  if (Platform.isAndroid) {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }
  print("Background or terminated app notification");

  RemoteNotification? notification = message.notification;
  AndroidNotification? android = message.notification?.android;
  if (notification != null && android != null) {
    showDialog(
        context: context!,
        builder: (_) {
          return AlertDialog(
            title: Text("${notification.title}"),
            content: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [Text("${notification.body}")],
              ),
            ),
          );
        });
  }

  print('Handling a background message ${message.messageId}');
}

const AndroidNotificationChannel channel = AndroidNotificationChannel(
  'high_importance_channel', // id
  'High Importance Notifications', // title
  description:
      'This channel is used for important notifications.', // description
  importance: Importance.high,
);
final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _navigatorKey = GlobalKey<NavigatorState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("In app notification 0");

    var initialzationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    // var initializationSettingsDarwin =
    // DarwinInitializationSettings(onDidReceiveLocalNotification: onDidReceiveLocalNotification);
    //
    // void onDidReceiveLocalNotification(
    //     int id, String title, String body, String payload) async {
    //   print("Ios Notification Received");
    //   // display a dialog with the notification details, tap ok to go to another page
    //   // showDialog(
    //   //   context: context,
    //   //   builder: (BuildContext context) =>
    //   //       CupertinoAlertDialog(
    //   //         title: Text(title),
    //   //         content: Text(body),
    //   //         actions: [
    //   //           CupertinoDialogAction(
    //   //             isDefaultAction: true,
    //   //             child: Text('Ok'),
    //   //             onPressed: () async {
    //   //               // Navigator.of(context, rootNavigator: true).pop();
    //   //               // await Navigator.push(
    //   //               //   context,
    //   //               //   MaterialPageRoute(
    //   //               //     builder: (context) => SecondScreen(payload),
    //   //               //   ),
    //   //               // );
    //   //             },
    //   //           )
    //   //         ],
    //   //       ),
    //   // );
    // }

    final DarwinInitializationSettings initializationSettingsDarwin =
        DarwinInitializationSettings();
    print("In app notification 1");

    var initializationSettings = InitializationSettings(
        android: initialzationSettingsAndroid,
        iOS: initializationSettingsDarwin);
    flutterLocalNotificationsPlugin.initialize(initializationSettings);
    print("In app notification 2");

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print("In app notification 3");
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null) {
        flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
              android: AndroidNotificationDetails(
                channel.id,
                channel.name,
                channelDescription: channel.description,
                color: Colors.blue,
                // TODO add a proper drawable resource to android, for now using
                //      one that already exists in example app.
                icon: "@mipmap/ic_launcher",
              ),
            ));
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print("Running app notification");

      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null) {
        showDialog(
            context: context,
            builder: (_) {
              return AlertDialog(
                title: Text("${notification.title}"),
                content: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [Text("${notification.body}")],
                  ),
                ),
              );
            });
      }
    });

    getToken();
  }

  getToken() async {
    print("fmc triggered ajsdlasjlda");
    String? token = await FirebaseMessaging.instance.getToken();
    //print('Device token is $token');
    sharedPreferences.setString('fcmToken', "${token}");
    http
        .get(Uri.parse(RemoteUrls.registerWithToken(
            sharedPreferences.getString('fcmToken') ?? '',
            userId: '')))
        .then((value) {
      print("fcm token stored main ${sharedPreferences.getString('fcmToken')}");
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(344, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: MyTheme.theme,
          supportedLocales: AppLocalizationsSetup.supportedLocales,
          localizationsDelegates: AppLocalizationsSetup.localizationsDelegate,
          localeResolutionCallback:
              AppLocalizationsSetup.localeResolutionCallBack,
          // locale: const Locale('en'),
          routingCallback: (routing) {
            if (routing?.current == Routes.initial) {
              if (kDebugMode) {
                print(".................. main ................");
              }
            }
          },
          navigatorKey: _navigatorKey,
          initialBinding: AppBindings(),
          transitionDuration: const Duration(milliseconds: 300),
          defaultTransition: Transition.cupertino,
          home: Pages.initial,
          getPages: Pages.pages,
        );
      },
    );
  }
}
