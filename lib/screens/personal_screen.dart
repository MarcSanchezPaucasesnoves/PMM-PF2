import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pmm_pf2/models/persona.dart';
import 'package:pmm_pf2/utils/string_formatter.dart';

class PersonalScreen extends StatefulWidget {
  const PersonalScreen({super.key});

  @override
  State<PersonalScreen> createState() => _PersonalScreenState();
}

class _PersonalScreenState extends State<PersonalScreen> {
  final _formKey = GlobalKey<FormState>();

  bool _isFirstLoad = true;
  late String _name;
  late String _surname;
  late String _eAddress;
  late String _password;
  late DateTime _birthDate;
  late Persona _persona;


  final TextEditingController _inputFieldDataController = TextEditingController();
  late DateTime _inputDataDate;
  late String _primarySurname;
  

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
      _primarySurname = _persona.getPrimarySurname();
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
        title: _appBarTitle(),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        
          children: [
            _inputName(),
            SizedBox(height: 20),
            _inputSurname(),
            SizedBox(height: 20),
            _inputEmail(),
            SizedBox(height: 20),
            _inputPassword(),
            SizedBox(height: 20),
            _inputData(),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text("Save and return"),
              
              onPressed:() {
                if (_formKey.currentState!.validate()) {
                  _name = StringFormatter.stringWithoutSpaces(_name);
                  _surname = StringFormatter.stringWithoutSpaces(_surname);
                  _eAddress = StringFormatter.stringWithoutSpaces(_eAddress);
                  _password = StringFormatter.stringWithoutSpaces(_password);
                  Navigator.of(context).pop(Persona(name: _name, surname: _surname, eAddress: _eAddress, password: _password, birthDate: _birthDate));
                }
              }, 
            )
          ],
        ),
      ),
    );
  }



  TextFormField _inputName() {
    return TextFormField(
      textCapitalization: TextCapitalization.sentences,
      controller: TextEditingController(text: _name),
      decoration: InputDecoration(
        labelText: "Name",
        suffixIcon: Icon(Icons.abc),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
      ),
      validator: (value) => _validateInputString(value, "El nom no pot estar buid"),
      onChanged:(value) {
        _name = value;
      },
    );
  }

  TextFormField _inputSurname() {
    return TextFormField(
      textCapitalization: TextCapitalization.sentences,
      controller: TextEditingController(text: _surname),
      decoration: InputDecoration(
        labelText: "Surname",
        suffixIcon: Icon(Icons.abc),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
      ),
      validator: (value) => _validateInputString(value, "El cognom no pot estar buid"),
      onChanged:(value) {
        _surname = value;
      },
    );
  }

  TextFormField _inputEmail() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      controller: TextEditingController(text: _eAddress),
      decoration: InputDecoration(
        labelText: "Email Address",
        suffixIcon: Icon(Icons.alternate_email),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
      ),
      validator: (value) => _validateInputString(value, "El mail no pot estar buid"),
      onChanged:(value) {
        _eAddress = value;
      },
    );
  }

  TextFormField _inputPassword() {
    return TextFormField(
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
      validator: (value) => _validateInputString(value, "La contrasenya no pot estar buida"),
      inputFormatters: [
        FilteringTextInputFormatter.deny(RegExp(r'\s')),
      ],
      onChanged:(value) {
        _password = value;
      },
    );
  }

  TextFormField _inputData() {
    return TextFormField(
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
      validator: (value) => _validateInputString(value, "La data no pot estar buida"),
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
        _inputFieldDataController.text = StringFormatter.dateToString(picked as DateTime);
        _birthDate = picked;
      });
    }
  }




  Text _appBarTitle(){
    if (StringFormatter.stringIsEmpty(_surname)) return Text("Edit Profile");
    return Text("$_primarySurname - Edit Profile");
  }
}

String? _validateInputString(String? value, String errorMessage) {
  if (value == null || StringFormatter.stringIsEmpty(value)) return errorMessage;
  return null;
}