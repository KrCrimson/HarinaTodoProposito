import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz_data;
import 'main.dart'; // Asegúrate de importar main.dart para acceder a la instancia global

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // Función para programar la notificación
  Future<void> scheduleNotification(DateTime scheduledTime) async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'your_channel_id', 
      'your_channel_name',
      channelDescription: 'Your channel description',
      importance: Importance.max,
      priority: Priority.high,
      ticker: 'ticker',
    );
    const NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);

    // Convertir DateTime a TZDateTime
    final tz.TZDateTime tzScheduledTime = tz.TZDateTime.from(scheduledTime, tz.local);

    // Usar la variable global flutterLocalNotificationsPlugin
    await flutterLocalNotificationsPlugin.zonedSchedule(
      0, // ID de la notificación
      'Notificación Programada',
      '¡Es hora de tu notificación!',
      tzScheduledTime,
      platformChannelSpecifics,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.wallClockTime, // Requiere este parámetro
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle, // Requiere este parámetro
      matchDateTimeComponents: DateTimeComponents.time,
    );
  }

  @override
  Widget build(BuildContext context) {
    // Un controlador de fecha y hora para seleccionar la hora
    final TimeOfDay time = TimeOfDay.now();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Pantalla Principal"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                // Abrir un cuadro de diálogo para elegir una hora
                final TimeOfDay? selectedTime = await showTimePicker(
                  context: context,
                  initialTime: time,
                );

                if (selectedTime != null) {
                  // Crear una fecha con la hora seleccionada
                  final DateTime now = DateTime.now();
                  final DateTime scheduledTime = DateTime(
                    now.year,
                    now.month,
                    now.day,
                    selectedTime.hour,
                    selectedTime.minute,
                  );

                  // Programar la notificación
                  scheduleNotification(scheduledTime);
                }
              },
              child: const Text('Programar Notificación'),
            ),
          ],
        ),
      ),
    );
  }
}

