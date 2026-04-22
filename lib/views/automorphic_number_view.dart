import 'package:flutter/material.dart';
import 'package:assignment_2/models/automorphic_number_model.dart';

class AutomorphicView extends StatefulWidget {
  const AutomorphicView({super.key});

  @override
  State<AutomorphicView> createState() => _AutomorphicViewState();
}

class _AutomorphicViewState extends State<AutomorphicView> {
  AutomorphicNumberModel? automorphicNumberModel;
  final numberController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final model = automorphicNumberModel;
    return Scaffold(
      appBar: AppBar(title: Text("Automorphic View")),
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
                        automorphicNumberModel = AutomorphicNumberModel(
                          number: int.parse(numberController.text),
                        );
                      });
                    }
                  },
                  child: Text("Check Automorphic"),
                ),
              ),
              if (model != null)
                Text(
                  "Your Enter number is ${model.checkAutomorphic() ? "" : "not"} Automorphic.",
                ),
            ],
          ),
        ),
      ),
    );
  }
}