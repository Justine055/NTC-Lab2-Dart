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
    print('======================================');
    print('          STUDENT SUMMARY             ');
    print('======================================');
    print('Student Name : $fullName');
    print('Student ID   : $idNumber');
  }
}

String computeGrade(double average) {
  if (average >= 75) {
    return 'Passed';
  } else if (average >= 70) {
    return 'Conditional';
  } else {
    return 'Failed';
  }
}

void main() {
  String fullName = "Justine Andrew Balingit";
  String idNumber = "424004373";
  List<double> grades = [88.5, 88.0, 92.0];

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

  String status = computeGrade(average);

  student.displayInfo();

  print('--------------------------------------');
  print('Grades Entered:');
  
  for (int i = 0; i < student.grades.length; i++) {
    print('  Subject ${i + 1}: ${student.grades[i].toStringAsFixed(2)}');
  }

  print('--------------------------------------');
  print('Average Grade: ${average.toStringAsFixed(2)}');
  print('Final Status : $status');
  print('======================================');
}