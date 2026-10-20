import 'dart:io';

class Student {
  String fullName;
  String idNumber;
  List<double> grades;

  Student({
    required this.fullName,
    required this.idNumber,
    required this.grades,
  });

  void displayInfo() {
    print('\n======================================');
    print('          STUDENT SUMMARY             ');
    print('======================================');
    print('Student Name : $fullName');
    print('Student ID   : $idNumber');
  }
}

String computeGrade(List<double> grades, double average) {
  if (average >= 75) {
    return 'Passed';
  } else if (average >= 70) {
    return 'Conditional';
  } else {
    return 'Failed';
  }
}

void main() {
  print('======================================');
  print('      STUDENT GRADE CALCULATOR        ');
  print('======================================');

  stdout.write('Enter Student Full Name: ');
  String fullName = stdin.readLineSync() ?? 'Unknown';

  stdout.write('Enter Student ID Number: ');
  String idNumber = stdin.readLineSync() ?? 'N/A';

  List<double> grades = [];

  for (int i = 1; i <= 3; i++) {
    stdout.write('Enter grade for Subject $i: ');
    String? input = stdin.readLineSync();
    double grade = double.tryParse(input ?? '') ?? 0.0;
    grades.add(grade);
  }

  Student student = Student(
    fullName: fullName,
    idNumber: idNumber,
    grades: grades,
  );

  double total = 0;
  for (int i = 0; i < student.grades.length; i++) {
    total += student.grades[i];
  }
  double average = total / student.grades.length;

  // Determine status via computeGrade() function call
  String status = computeGrade(student.grades, average);

  // Output formatted results
  student.displayInfo();

  print('--------------------------------------');
  print('Grades Entered:');
  // Loop displaying all 3 grades in a formatted list
  for (int i = 0; i < student.grades.length; i++) {
    print('  Subject ${i + 1}: ${student.grades[i].toStringAsFixed(2)}');
  }

  print('--------------------------------------');
  print('Average Grade: ${average.toStringAsFixed(2)}');
  print('Final Status : $status');
  print('======================================\n');
}