import 'package:assignment_2/views/armstrong_number_view.dart';
import 'package:assignment_2/views/automorphic_number_view.dart';
import 'package:assignment_2/views/even_odd_view.dart';
import 'package:assignment_2/views/palindrome_view.dart';
import 'package:assignment_2/views/student_details_view.dart';
import 'package:flutter/material.dart';


class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("Dashboard View"))),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PalindromeView()),
                  );
                },
                child: Text("Palindrome Number"),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AutomorphicView()),
                  );
                },
                child: Text("Automorphic Number"),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => OddEvenView()),
                  );
                },
                child: Text("Odd Even Number"),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ArmstrongView()),
                  );
                },
                child: Text("Armstrong Number"),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => StudentDetailsView(),
                    ),
                  );
                },
                child: Text("Student Details"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}