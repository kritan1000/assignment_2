class StudentDetailsModel {
  final String fullName;
  final int age;
  final String department;
  final String gender;
 
  StudentDetailsModel({required this.fullName, required this.age,required this.department, required this.gender});
 
  static List<String> departments = [
    'Mathematics',
    'Science',
    'English',
    'Nepali',
    'Computer Science',
  ];
 
  static List<StudentDetailsModel> studentList = [];
 
  void addStudent(StudentDetailsModel student) {
    studentList.add(student);
  }
 
  static void saveStudent({
    required String fullName,
    required int age,
    required String department,
    required String gender,
  }) {
    studentList.add(StudentDetailsModel(
      fullName: fullName,
      age: age,
      department: department,
      gender: gender,
    ));
  }
}
 