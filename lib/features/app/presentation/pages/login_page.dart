import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color.fromARGB(255, 131, 183, 218),
        child: Column(
          children: [
            Container(
              width: 600,
              height: 150,
              margin: EdgeInsets.all(10),
              child: Image.network(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQO2tWaSDPUixIf_4hByRtZ_tQxU435aTJ1v4GpZrbeY_tWn5JeJdUDAqX3I_UQcBEnaAE&usqp=CAU'),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: const Text(
                "Iniciar Sesión",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
              child: const Text(
                "Usuario",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            TextFormField(
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 15),
                border: UnderlineInputBorder(),
                labelText: "Ingresa tu usuario",
              ),
              style: TextStyle(fontSize: 14),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
              child: const Text(
                "Contraseña",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            TextFormField(
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 15),
                border: UnderlineInputBorder(),
                labelText: "Ingresa tu contraseña",
              ),
              style: TextStyle(fontSize: 14),
            ),
            SizedBox(
              height: 25,
            ),
            ElevatedButton(
              onPressed: () async {},
              child: const Text('Ingresar'),
            ),
            Expanded(child: Container()),
            Container(
              padding: const EdgeInsets.all(30),
              width: double.infinity,
              color: Colors.black26,
              child: const Text(
                "Cerrar sesión",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
              ),
            )
          ],
        ),
      ),
    );
  }
}
