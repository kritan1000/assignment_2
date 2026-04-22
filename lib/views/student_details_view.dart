import 'package:assignment_2/models/student_details_model.dart';
import 'package:flutter/material.dart';
 
class StudentDetailsView extends StatefulWidget {
  const StudentDetailsView({super.key});
 
  @override
  State<StudentDetailsView> createState() => _StudentDetailsViewState();
}
 
class _StudentDetailsViewState extends State<StudentDetailsView> {
  final _formKey = GlobalKey<FormState>();
  final fullNameController = TextEditingController();
  final ageController = TextEditingController();
  StudentDetailsModel? studentModel;
 
  String? selectedDepartment;
  String selectedGender = 'Male';
 
  @override
  void dispose() {
    fullNameController.dispose();
    ageController.dispose();
    super.dispose();
  }
 
  void _clearForm() {
    fullNameController.clear();
    ageController.clear();
    setState(() {
      selectedDepartment = null;
      selectedGender = 'Male';
    });
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Student Details"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Full Name
                  TextFormField(
                    controller: fullNameController,
                    decoration: InputDecoration(
                      labelText: 'Full Name',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter full name';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 10),
 
                  // Age
                  TextFormField(
                    controller: ageController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Age',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter age';
                      }
                      if (int.tryParse(value) == null) {
                        return 'Please enter a valid age';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 10),
 
                  // Department Dropdown
                  DropdownButtonFormField<String>(
                    value: selectedDepartment,
                    hint: Text('Select Department'),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                    items: StudentDetailsModel.departments.map((dept) {
                      return DropdownMenuItem(
                        value: dept,
                        child: Text(dept),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedDepartment = value;
                      });
                    },
                  ),
                  SizedBox(height: 10),
 
                  // Gender Radio Buttons
                  Text(
                    'Gender',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: ['Male', 'Female', 'Other'].map((gender) {
                      return Row(
                        children: [
                          Radio<String>(
                            value: gender,
                            groupValue: selectedGender,
                            onChanged: (value) {
                              setState(() {
                                selectedGender = value!;
                              });
                            },
                          ),
                          Text(gender),
                        ],
                      );
                    }).toList(),
                  ),
                  SizedBox(height: 10),
 
                  // Save Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          if (selectedDepartment == null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                  content: Text('Please select a department')),
                            );
                            return;
                          }
                          setState(() {
                            StudentDetailsModel.saveStudent(
                            fullName: fullNameController.text,
                            age: int.parse(ageController.text),
                            department: selectedDepartment!,
                            gender: selectedGender,
                          );
                          });
                         
                         
                          _clearForm();
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                content: Text('Student saved successfully!')),
                          );
                        }
                      },
                      child: Text("Save Student"),
                    ),
                  ),
                ],
              ),
            ),
 
            SizedBox(height: 20),
            Divider(),
 
            // List Header
            Text(
              'Student List (${StudentDetailsModel.studentList.length})',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
 
            // ListView
            Expanded(
              child: StudentDetailsModel.studentList.isEmpty
                  ? Center(child: Text('No students saved yet.'))
                  : ListView.builder(
                      itemCount: StudentDetailsModel.studentList.length,
                      itemBuilder: (context, index) {
                        final student = StudentDetailsModel.studentList[index];
                        return Card(
                          margin: EdgeInsets.symmetric(vertical: 5),
                          child: ListTile(
                            leading: CircleAvatar(
                              child: Text('${index + 1}'),
                            ),
                            title: Text(student.fullName),
                            subtitle: Text(
                                'Age: ${student.age} | Dept: ${student.department}'),
                            trailing: Text(student.gender),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}