import 'package:flutter/material.dart';
import 'package:assignment_2/models/even_odd_model.dart';

class OddEvenView extends StatefulWidget {
  const OddEvenView({super.key});

  @override
  State<OddEvenView> createState() => _OddEvenViewState();
}

class _OddEvenViewState extends State<OddEvenView> {
  EvenOddModel? evenOddModel;
  final numberController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final model = evenOddModel;
    return Scaffold(
      appBar: AppBar(title: Text("OddEven View")),
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
                        evenOddModel = EvenOddModel(
                          number: int.parse(numberController.text),
                        );
                      });
                    }
                  },
                  child: Text("Check OddEven"),
                ),
              ),
              if (model != null)
                Text(
                  "Your Enter number is ${model.isEven() ? "Even" : "Odd"}.",
                ),
            ],
          ),
        ),
      ),
    );
  }
}