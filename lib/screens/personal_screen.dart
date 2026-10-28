import 'package:flutter/material.dart';
import 'package:pmm_pf2/models/persona.dart';
import 'package:pmm_pf2/utils/date_formatter.dart';

class PersonalScreen extends StatefulWidget {
  const PersonalScreen({super.key});

  @override
  State<PersonalScreen> createState() => _PersonalScreenState();
}

class _PersonalScreenState extends State<PersonalScreen> {
  bool _isFirstLoad = true;
  late String _name;
  late String _surname;
  late String _eAddress;
  late String _password;
  late DateTime _birthDate;
  late Persona _persona;
  TextEditingController _inputFieldDataController = TextEditingController();
  late DateTime _inputDataDate;
  

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_isFirstLoad) {
      _persona = ModalRoute.of(context)!.settings.arguments as Persona;
      _name = _persona.name;
      _surname = _persona.surname;
      _eAddress = _persona.eAddress;
      _password = _persona.password;
      _birthDate = _persona.birthDate;
      _inputDataDate = _birthDate;
      _inputFieldDataController.text = _persona.getOnlyBirthDate();

      if (_inputFieldDataController.text == "") {
        _inputDataDate = DateTime.now();
      }

      _isFirstLoad = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${_persona.surname} - Edit Profile"),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),

        children: [
          _inputName(),
          Divider(),
          _inputSurname(),
          Divider(),
          _inputEmail(),
          Divider(),
          _inputPassword(),
          Divider(),
          _inputData(),
          Divider(),
          ElevatedButton(
            child: Text("Save and return"),
            onPressed: () => Navigator.of(context).pop(Persona(name: _name, surname: _surname, eAddress: _eAddress, password: _password, birthDate: _birthDate)), 
          )
        ],
      ),
    );
  }



  TextField _inputName() {
    return TextField(
      textCapitalization: TextCapitalization.sentences,
      controller: TextEditingController(text: _name),
      decoration: InputDecoration(
        labelText: "Name",
        suffixIcon: Icon(Icons.abc),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
      ),
      onChanged:(value) {
        _name = value;
      },
    );
  }

  TextField _inputSurname() {
    return TextField(
      textCapitalization: TextCapitalization.sentences,
      controller: TextEditingController(text: _surname),
      decoration: InputDecoration(
        labelText: "Surname",
        suffixIcon: Icon(Icons.abc),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
      ),
      onChanged:(value) {
        _surname = value;
      },
    );
  }

  TextField _inputEmail() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      controller: TextEditingController(text: _eAddress),
      decoration: InputDecoration(
        labelText: "Email Address",
        suffixIcon: Icon(Icons.alternate_email),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
      ),
      onChanged:(value) {
        _eAddress = value;
      },
    );
  }

  TextField _inputPassword() {
    return TextField(
      obscureText: true,
      textCapitalization: TextCapitalization.sentences,
      controller: TextEditingController(text: _password),
      decoration: InputDecoration(
        labelText: "Password",
        suffixIcon: Icon(Icons.lock),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
      ),
      onChanged:(value) {
        _password = value;
      },
    );
  }

  TextField _inputData() {
    return TextField(
      enableInteractiveSelection: false,
      controller: _inputFieldDataController,
      readOnly: true,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        labelText: "Birthdate",
        suffixIcon: Icon(Icons.calendar_month),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
      ),
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
        _selectData(context);
      },
    );
  }

  void _selectData(BuildContext context) async{
    DateTime? picked;
    picked = await showDatePicker(
      context: context,
      initialDate: _inputDataDate,
      firstDate: DateTime(1800),
      lastDate: DateTime.now()
    );
    if (picked != null) {
      setState(() {
        _inputFieldDataController.text = DateFormatter.dateToString(picked as DateTime);
        _birthDate = picked;
      });
    }
  }
}