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
      body: Column(
          children: [
            Card(
              margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)
              ),
              elevation: 4,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ListTile(
                      leading: Icon(Icons.person),
                      title: Text("Name"),
                      subtitle: Text(_persona.name),
                    ),
                    ListTile(
                      leading: Icon(Icons.person),
                      title: Text("Surname"),
                      subtitle: Text(_persona.surname),
                    ),
                    ListTile(
                      leading: Icon(Icons.email),
                      title: Text("Email address"),
                      subtitle: Text(_persona.eAddress),
                    ),
                    ListTile(
                      leading: Icon(Icons.lock),
                      title: Text("Password"),
                      subtitle: Text(_persona.password),
                    ),
                    ListTile(
                      leading: Icon(Icons.calendar_month),
                      title: Text("Birthdate"),
                      subtitle: Text(_persona.getOnlyBirthDate()),
                    ),
                    FilledButton(
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
                  ],
                )
              ),
            ),
            
            ElevatedButton(
              child: Text("Explore Widget Showcase"),
              onPressed: () { }
            ),
          ],
        ),
      );
  }
}