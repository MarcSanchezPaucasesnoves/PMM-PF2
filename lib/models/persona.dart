
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
    return birthDate.toString().substring(1, 10);
  }

}