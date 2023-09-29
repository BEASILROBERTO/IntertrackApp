// Pagina 0 (home)
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:convert';

class HomePage extends StatelessWidget {
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
      body: json.encode({
        'service_id': serviceId,
        'template_id': templateId,
        'user_id': userId,
      }),
    );

    if (response.statusCode == 200) {
      print('Correo electrónico enviado con éxito');
    } else {
      print('Error al enviar el correo electrónico');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Image.network(
          'https://1.bp.blogspot.com/-wzZvzYTo7Dc/WR72BmeRqeI/AAAAAAAATX4/ISNvUa8V_kcQZpO-HRXnqRpCCCgXmq_8QCLcB/s1600/Google-Maps.jpg',
          height: 500,
          width: 550,
        ),
        ElevatedButton(
          onPressed: () async {
            // En lugar de showNotificacion(), llamamos a sendNotification() y sendEmail()
            await sendNotification();
            // print('aqui no hay nada que ver');
          },
          child: const Text('Enviar Notificación y Correo Electrónico'),
        ),
      ]),
    );
  }
}
