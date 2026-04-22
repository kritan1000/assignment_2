import 'package:flutter/material.dart';
import 'package:assignment_2/models/palindrome_number_model.dart';

class PalindromeView extends StatefulWidget {
  const PalindromeView({super.key});

  @override
  State<PalindromeView> createState() => _PalindromeViewState();
}

class _PalindromeViewState extends State<PalindromeView> {
  PalindromeModel? palindromeModel;
  final numberController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final model = palindromeModel;

    return Scaffold(
      appBar: AppBar(title: Text("Palindrome View")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: numberController,
                decoration: InputDecoration(
                  labelText: "Enter a number",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter number';
                  }
                  return null;
                },
              ),
              SizedBox(height: 8),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      setState(() {
                        palindromeModel = PalindromeModel(
                          number: int.parse(numberController.text),
                        );
                      });
                    }
                  },
                  child: Text("Check Palindrome"),
                ),
              ),
              if (model != null)
                Text(
                  "Your Enter number is ${model.isPalindrome() ? "" : "not"} Palindrome.",
                ),
            ],
          ),
        ),
      ),
    );
  }
}