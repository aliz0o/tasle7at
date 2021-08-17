import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tasle7at/utils/validation.dart';

class ValidationScreen extends StatefulWidget {
  @override
  _ValidationScreenState createState() => _ValidationScreenState();
}

class _ValidationScreenState extends State<ValidationScreen> {
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    Validation validation = Validation();
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key: _formKey,
                child: TextFormField(
                  validator: (value) {
                    if (validation.isValidPhoneNumber(value)) {
                      return null;
                    } else {
                      return 'Not Valid Phone Number';
                    }
                  },
                  decoration: new InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 15),
                    labelText: "Enter Your Phone Number",
                    fillColor: Colors.white,
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(25.0),
                      borderSide: new BorderSide(),
                    ),
                  ),
                  keyboardType: TextInputType.phone,
                  style: new TextStyle(
                    fontSize: 15,
                  ),
                ),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  _formKey.currentState.validate();
                },
                child: Text('Enter'))
          ],
        ),
      ),
    );
  }
}
