import 'package:intertrack/widgets/map.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:geolocator/geolocator.dart';

class HomePage extends StatelessWidget {
  // Testing geolocator.
  Future<void> getPosition() async {
    await Geolocator.checkPermission();
    await Geolocator.requestPermission();

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    print("Current location ${position.toString()}");
  }

  // API for email sending.
  Future<void> sendNotification() async {
    const serviceId = 'service_aeszbsq';
    const templateId = 'template_gcu5ijm';
    const userId = 'gdf71SunnLlh_IAHx';

    final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        'origin': 'http://localhost'
      },
      body: json.encode(
        {
          'service_id': serviceId,
          'template_id': templateId,
          'user_id': userId,
        },
      ),
    );

    response.statusCode == 200
        ? print('Correo electrónico enviado con éxito')
        : print('Error al enviar el correo electrónico');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InterMap(),
      // Floating button to send notifications.
      floatingActionButton: FloatingActionButton.small(
        backgroundColor: Colors.blue,
        tooltip: "Enviar notificacion a email.",
        onPressed: () async {
          // sendNotification is in charge of sending a notification when the button is pressed.
          await sendNotification();
          // TODO: GOT TO FIX GETTING LOCATION
          // await getPosition();
        },
        child: Icon(Icons.notification_add),
      ),
    );
  }
}
