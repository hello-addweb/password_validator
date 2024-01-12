import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:password_validator_package/password_validator_package.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    String password = "addweb@123"; // false
    String password2 = 'AddWeb@123'; // true
    bool isValidPassword = PasswordValidator.validatePassword(password);
    bool isValidPassword2 = PasswordValidator.validatePassword(password2);

    log("isValidPassword  $isValidPassword"); // false
    log("isValidPassword22  $isValidPassword2"); // true

    return Scaffold(
      appBar: AppBar(
        title: const Text("Password Validation"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              Text("$isValidPassword"),
              TextFormField(
                validator: (value) {
                  /// your logic
                  if (value!.isEmpty) {
                    return "Please Enter Password";
                  } else if (PasswordValidator.validatePassword(value)) {
                    //return "Please Enter Valid Password";
                    return "Password should be between 8 to 15 characters and should contain atleast one uppercase, one lowercase ,one number and one special character.";
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(),
                  errorBorder: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(),
                  disabledBorder: OutlineInputBorder(),
                  focusedErrorBorder: OutlineInputBorder(),
                  hintText: 'Enter Password',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
