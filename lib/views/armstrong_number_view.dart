import 'package:flutter/material.dart';
import 'package:assignment_2/models/armstrong_number_model.dart';

class ArmstrongView extends StatefulWidget {
  const ArmstrongView({super.key});

  @override
  State<ArmstrongView> createState() => _ArmstrongViewState();
}

class _ArmstrongViewState extends State<ArmstrongView> {
  ArmstrongNumberModel? armstrongNumberModel;
  final numberController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final model = armstrongNumberModel;

    return Scaffold(
      appBar: AppBar(title: Text("Armstrong View")),
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
                        armstrongNumberModel = ArmstrongNumberModel(
                          number: int.parse(numberController.text),
                        );
                      });
                    }
                  },
                  child: Text("Check Armstrong"),
                ),
              ),
              if (model != null)
                Text(
                  "Your Enter number is ${model.isArmstrong() ? "" : "not"} Armstrong.",
                ),
            ],
          ),
        ),
      ),
    );
  }
}