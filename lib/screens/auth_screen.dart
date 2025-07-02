import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});
  @override
  State<AuthScreen> createState() {
    return AuthScreenState();
  }
}

class AuthScreenState extends State<AuthScreen> {
  final formKey = GlobalKey<FormState>();
  var isLogin = true;
  var enteredEmail = "";
  var enteredPassword = "";

  void submit() {
    final isValid = formKey.currentState!.validate();

    if (isValid) {
      formKey.currentState!.save();
      print("Email: $enteredEmail");
      print("Password: $enteredPassword");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(
                  top: 30,
                  bottom: 20,
                  left: 20,
                  right: 20,
                ),
                width: 330,
                child: Image.asset('assets/Slika.png'),
              ),
              Card(
                margin: EdgeInsets.all(20),

                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Form(
                      key: formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: "Email adress",
                            ),
                            autocorrect: false,
                            textCapitalization: TextCapitalization.none,
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value == null ||
                                  value.trim().isEmpty ||
                                  !value.contains('@')) {
                                return "Please enter a valid email adress";
                              }
                              return null;
                            },
                            onSaved: (newValue) {
                              enteredEmail = newValue!;
                            },
                          ),
                          TextFormField(
                            decoration: InputDecoration(labelText: "Password"),
                            obscureText: true,
                            validator: (value) {
                              if (value == null || value.trim().length < 6) {
                                return "Password must be at least 6 characters long";
                              }
                              return null;
                            },
                            onSaved: (newValue) {
                              enteredPassword = newValue!;
                            },
                          ),
                          SizedBox(height: 12),
                          ElevatedButton(
                            onPressed: submit,
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  Theme.of(
                                    context,
                                  ).colorScheme.primaryContainer,
                            ),
                            child: Text(isLogin ? "Login" : "Sign Up"),
                          ),
                          TextButton(
                            onPressed: () {
                              setState(() {
                                isLogin = !isLogin;
                              });
                            },
                            child: Text(
                              isLogin
                                  ? 'Create an account'
                                  : "I already have an account",
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
