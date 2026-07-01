void main() {
  String? middleName = 'Jetsada'; 
  String city = 'phitsanulok';

  int middleNameLength = middleName?.length ?? 0;
  print('Middle name length: $middleNameLength');

  print('City length: ${city.length}');

  print('Middle name before assignment: $middleName');

  middleName ??= 'N/A';
  print('Middle name after assignment: $middleName');

  middleName ??= 'Something Else';
  print('Middle name after second assignment: $middleName');
}