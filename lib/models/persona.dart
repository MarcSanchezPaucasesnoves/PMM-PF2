
import 'package:pmm_pf2/utils/date_formatter.dart';

class Persona {
  String name;
  String surname;
  String eAddress;
  String password;
  DateTime birthDate;

  Persona({
    required this.name,
    required this.surname,
    required this.eAddress,
    required this.password,
    required this.birthDate
  });

  String getOnlyBirthDate() {
    if (birthDate == DateTime(1, 1, 1)) return "";
    return DateFormatter.dateToString(birthDate);
  }

}