import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final email = TextEditingController();
  final password = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login',
      home: Scaffold(
        backgroundColor: const Color(0xFFFEEB82),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.fromLTRB(20, 100, 20, 0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Center(
                    child: Container(
                      width: 250,
                      height: 250,
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
                  const SizedBox(
                    height: 10,
                  ),
                  const Row(
                    children: [
                      Text(
                        'Email',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                    ],
                  ),
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
                      labelText: 'Enter your Email',
                      labelStyle: TextStyle(color: Colors.black),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                    ),
                    controller: email,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Row(
                    children: [
                      Text(
                        'Password',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                    ],
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
                        labelText: 'Enter your Password',
                        labelStyle: TextStyle(color: Colors.black),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        )),
                    controller: password,
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
                              'Login Screen',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Email : \n ${email.text}',
                                  style: const TextStyle(fontSize: 18),
                                ),
                                Text(
                                  'Password : \n ${password.text}',
                                  style: const TextStyle(fontSize: 18),
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
                      backgroundColor: const Color(0xFFF05F42),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    child: const Text('Login'),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextButton(
                    onPressed: () => Navigator.pushNamed(context, '/register'),
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
