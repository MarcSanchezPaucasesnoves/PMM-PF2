import 'package:flutter/material.dart';
import 'package:pmm_pf2/models/persona.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Persona _persona = Persona.complete(name: "", surname: "", eAddress: "", password: "", birthDate: DateTime(0, 0, 0));

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
            ElevatedButton(
              child: Text("Edit Profile"),
              onPressed:() => Navigator.of(context).pushNamed("/personal_screen"),
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