import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

// Maneja los mensajes en segundo plano
Future<void> _firebaseMessagingHandler(RemoteMessage message) async {
  print("Mensaje recibido en segundo plano: ${message.notification?.title}");
}

// Configuración de notificaciones
const AndroidInitializationSettings initializationSettingsAndroid =
    AndroidInitializationSettings('@mipmap/ic_launcher');
final DarwinInitializationSettings initializationSettingsDarwin =
    DarwinInitializationSettings();
final InitializationSettings initializationSettings = InitializationSettings(
  android: initializationSettingsAndroid,
  iOS: initializationSettingsDarwin,
);

// Inicializa el plugin de notificaciones
final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingHandler);
  await flutterLocalNotificationsPlugin.initialize(
    initializationSettings,
    onDidReceiveNotificationResponse: (NotificationResponse response) {
      print("Notificación seleccionada: ${response.payload}");
    },
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FutureBuilder(
        future: Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform,
        ),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return const NotificationHomePage();
          }
          if (snapshot.hasError) {
            return const Center(child: Text("Error al inicializar Firebase"));
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

class NotificationHomePage extends StatefulWidget {
  const NotificationHomePage({super.key});

  @override
  State<NotificationHomePage> createState() => _NotificationHomePageState();
}

class _NotificationHomePageState extends State<NotificationHomePage> {
  @override
  void initState() {
    super.initState();

    // Solicitar permisos para recibir notificaciones
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    messaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
      criticalAlert: true,
      provisional: false,
    );

    // Escuchar mensajes en primer plano
    FirebaseMessaging.onMessage.listen((RemoteMessage remoteMessage) {
      print("Mensaje recibido: ${remoteMessage.notification?.title}");
      flutterLocalNotificationsPlugin.show(
        remoteMessage.hashCode,
        remoteMessage.notification?.title,
        remoteMessage.notification?.body,
        const NotificationDetails(
          android: AndroidNotificationDetails(
            "Id de Prueba",
            "Canal de prueba",
            channelDescription: 'Demostración',
            importance: Importance.max,
            priority: Priority.max,
          ),
        ),
      );
    });

    // Obtener el token del dispositivo
    FirebaseMessaging.instance.getToken().then((token) {
      print("Token del dispositivo: $token");
    });
  }

  // Función para mostrar una notificación local
  void _showLocalNotification() {
    flutterLocalNotificationsPlugin.show(
      0, // ID único de la notificación
      "Notificación Local", // Título
      "Esta es una notificación generada manualmente.", // Cuerpo
      const NotificationDetails(
        android: AndroidNotificationDetails(
          "local_channel", // ID del canal
          "Notificaciones Locales", // Nombre del canal
          channelDescription: "Canal para notificaciones locales",
          importance: Importance.high,
          priority: Priority.high,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Notificaciones Push")),
      body: Center(
        child: ElevatedButton(
          onPressed: _showLocalNotification,
          child: const Text("Mostrar Notificación Local"),
        ),
      ),
    );
  }
}
