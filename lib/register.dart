import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final mobileNumber = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final address = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Register',
      home: Scaffold(
        backgroundColor: const Color(0xFFFEEB82),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.fromLTRB(20, 50, 20, 50),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Center(
                    child: Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(1000.0),
                        border: Border.all(
                          color: const Color(0xFFDAAC18),
                          width: 5.0,
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(1000.0),
                        child: Image.asset('img/icon.jpg'),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    validator: (value) {
                      if (value! == '') {
                        return 'Please enter your first name';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      labelText: 'First Name',
                      labelStyle: TextStyle(color: Colors.black),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      icon: Icon(
                        Icons.account_box,
                        color: Colors.black,
                      ),
                    ),
                    controller: firstName,
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    validator: (value) {
                      if (value! == '') {
                        return 'Please enter your last name';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      labelText: 'Last Name',
                      labelStyle: TextStyle(color: Colors.black),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      icon: Icon(
                        Icons.account_box,
                        color: Colors.black,
                      ),
                    ),
                    controller: lastName,
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    validator: (value) {
                      if (value! == '') {
                        return 'Please enter your number';
                      }
                      if (double.tryParse(value) == null) {
                        return 'Please enter valid number';
                      }
                      if (value.length < 10) {
                        return 'Must be of 10 characters';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      labelText: 'Mobile Number',
                      labelStyle: TextStyle(color: Colors.black),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      icon: Icon(
                        Icons.phone,
                        color: Colors.black,
                      ),
                    ),
                    controller: mobileNumber,
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    validator: (value) {
                      if (value! == '') {
                        return 'Please enter your email';
                      }
                      if (!EmailValidator.validate(value)) {
                        return 'Please enter valid email';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      labelStyle: TextStyle(color: Colors.black),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      icon: Icon(
                        Icons.alternate_email,
                        color: Colors.black,
                      ),
                    ),
                    controller: email,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value! == '') {
                        return 'Please enter your password';
                      }
                      if (value.length < 5) {
                        return 'Must be more than 5 characters length';
                      }
                      return null;
                    },
                    obscureText: true,
                    enableSuggestions: false,
                    autocorrect: false,
                    decoration: const InputDecoration(
                      labelText: 'Password',
                      labelStyle: TextStyle(color: Colors.black),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      icon: Icon(
                        Icons.lock,
                        color: Colors.black,
                      ),
                    ),
                    controller: password,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value! == '') {
                        return 'Please enter your confirm password';
                      }
                      if (value != password.text) {
                        return 'Must be equals with password';
                      }
                      return null;
                    },
                    obscureText: true,
                    enableSuggestions: false,
                    autocorrect: false,
                    decoration: const InputDecoration(
                        labelText: 'Confirm Password',
                        labelStyle: TextStyle(color: Colors.black),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        icon: Icon(
                          Icons.lock,
                          color: Colors.black,
                        )),
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value! == '') {
                        return 'Please enter your address';
                      }
                      return null;
                    },
                    obscureText: true,
                    enableSuggestions: false,
                    autocorrect: false,
                    decoration: const InputDecoration(
                      labelText: 'Address',
                      labelStyle: TextStyle(color: Colors.black),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      icon: Icon(
                        Icons.home_filled,
                        color: Colors.black,
                      ),
                    ),
                    controller: address,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  TextButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: const Text(
                              'Register Screen',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'First Name: \n ${firstName.text}',
                                  style: const TextStyle(fontSize: 15),
                                ),
                                Text(
                                  'Last Name: \n ${lastName.text}',
                                  style: const TextStyle(fontSize: 15),
                                ),
                                Text(
                                  'Mobile Number: \n ${mobileNumber.text}',
                                  style: const TextStyle(fontSize: 15),
                                ),
                                Text(
                                  'Email: \n ${email.text}',
                                  style: const TextStyle(fontSize: 15),
                                ),
                                Text(
                                  'Password: \n ${password.text}',
                                  style: const TextStyle(fontSize: 15),
                                ),
                                Text(
                                  'Address: \n ${address.text}',
                                  style: const TextStyle(fontSize: 15),
                                ),
                              ],
                            ),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text(
                                  'OK',
                                  style: TextStyle(fontSize: 15),
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text(
                                  'Cancel',
                                  style: TextStyle(fontSize: 15),
                                ),
                              ),
                            ],
                          ),
                        );
                      }
                    },
                    style: TextButton.styleFrom(
                      minimumSize: const Size.fromHeight(50),
                      backgroundColor: const Color(0xFFDAAC18),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    child: const Text('Register'),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextButton(
                    onPressed: () => Navigator.pushNamed(context, '/main'),
                    style: TextButton.styleFrom(
                      minimumSize: const Size.fromHeight(50),
                      backgroundColor: const Color(0xFFF05F42),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    child: const Text('Back to Login'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
