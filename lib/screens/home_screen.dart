import 'package:flutter/material.dart';
import 'package:pmm_pf2/models/persona.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Persona _persona = Persona(name: "", surname: "", eAddress: "", password: "", birthDate: DateTime(1, 1, 1));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DevProfile M3"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Name: ${_persona.name}"),
            Text("Surname: ${_persona.surname}"),
            Text("Email address: ${_persona.eAddress}"),
            Text("Password: ${_persona.password}"),
            Text("Birthdate: ${_persona.getOnlyBirthDate()}"),
            ElevatedButton(
              child: Text("Edit Profile"),
              onPressed:() => Navigator.of(context)
                .pushNamed("/personal_screen", arguments: _persona)
                .then(((value) {
                  if (value != null) {
                    setState(() {
                      _persona = value as Persona;
                    });
                  }
                })),
            ),
            ElevatedButton(
              child: Text("Explore Widget Showcase"),
              onPressed: () { }
            ),
          ],
        ),
      ),
    );
  }
}