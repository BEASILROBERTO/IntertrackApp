import 'package:intertrack/features/app/presentation/screens/speech_screen.dart';
import 'package:flutter/material.dart';

class UserPage extends StatelessWidget {
  const UserPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Pagina de usuarios.",
            style: TextStyle(fontSize: 30),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => SpeechScreen(),
                ),
              );
            },
            child: Text("Abrir Pantalla de Reconocimiento de Voz"),
          ),
        ],
      ),
    );
  }
}
