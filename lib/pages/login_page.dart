import 'package:flutter/material.dart';
import '/utils/routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool changeButton = false;

  final _formKey = GlobalKey<FormState>();

  void moveToHome(BuildContext context) async {
  if (_formKey.currentState != null && _formKey.currentState!.validate()) {
    setState(() {
      changeButton = false;
    });

    // Store the BuildContext in a local variable
    BuildContext currentContext = context;

    // Perform asynchronous operations
    try {
      await Future.delayed(const Duration(seconds: 1));

      // Check if the context is still valid
      if (currentContext == context) {
        // Continue with the navigation using the stored context
        // ignore: use_build_context_synchronously
        await Navigator.pushNamed(currentContext, MyRoutes.homeRoute);
      }

      setState(() {
        changeButton = true;
      });
    } catch (error) {
      // Handle any errors
    }
  }
}


  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Image.asset("assets/images/login_image.png", fit: BoxFit.cover),
              const SizedBox(
                height: 20.0,
              ),
              Text(
                "Welcome $name",
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 16.0, horizontal: 32.0),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: "Enter Username",
                        labelText: "Username",
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Username cant be empty";
                        }
                        return null;
                      },
                      onChanged: (value) {
                        name = value;
                        setState(() {});
                      },
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: const InputDecoration(
                          hintText: "Enter Password", labelText: "Password"),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Password cant be empty";
                        } else if (value.length < 5) {
                          return "Password length should be atleast 5 characters";
                        }
                        return null;
                      },
                    ),

                    const SizedBox(
                      height: 20.0,
                    ),
                    Material(
                        color: Colors.deepPurple,
                        borderRadius:
                            BorderRadius.circular(changeButton ? 50 : 8),
                        child: InkWell(
                          onTap: () => moveToHome(context),
                          child: AnimatedContainer(
                            duration: const Duration(seconds: 1),
                            width: changeButton ? 50 : 150,
                            height: 50,
                            alignment: Alignment.center,
                            child: changeButton
                                ? const Icon(
                                    Icons.done,
                                    color: Colors.white,
                                  )
                                : const Text(
                                    "Login",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                            // shape:
                            //     changeButton ? BoxShape.circle : BoxShape.rectangle,
                          ),
                        )),

                    // ElevatedButton(
                    //     onPressed: () {},
                    //     child: Text("Login"),
                    //     style: TextButton.styleFrom())
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
