String? nameValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter a name';
  }
  return null;
}

String? validateNumber1(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter a number';
  }

  final number = int.tryParse(value);
  if (number == null || value.length != 10) {
    return 'Please enter a valid number 1';
  }

  return null;
}

String? validateNumber2(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter a number';
  }

  final number = int.tryParse(value);
  if (number == null || value.length != 10) {
    return 'Please enter a valid number 2';
  }

  return null;
}

String? validateNumber3(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter a number';
  }

  final number = int.tryParse(value);
  if (number == null || value.length != 10) {
    return 'Please enter a valid number 3';
  }

  return null;
}

String? validateNumber4(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter a number';
  }

  final number = int.tryParse(value);
  if (number == null || value.length != 10) {
    return 'Please enter a valid number 4';
  }

  return null;
}

class HomeData {
  String? name;
  String? num1;
  String? num2;
  String? num3;
  String? num4;

  HomeData({this.name, this.num1, this.num2, this.num3, this.num4});
}

