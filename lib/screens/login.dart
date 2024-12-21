import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:plant/screens/home.dart';
import 'package:plant/screens/register.dart';
import 'package:plant/widgets/button.dart';
import 'package:plant/widgets/textfield.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isVisiable = true;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> loadUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? storedEmail = prefs.getString('email');
    String? storedPassword = prefs.getString('password');

    emailController.text = storedEmail ?? '';
    passwordController.text = storedPassword ?? '';
  }

  @override
  void initState() {
    super.initState();
    loadUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text(
          'Login',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image:
                    AssetImage("assets/bcbd716088094b157ab7f6dfa1b28095.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 250),
                  CustomTextField(
                    controller: emailController,
                    validator: (value) {
                      return value != null && !EmailValidator.validate(value)
                          ? "Enter a valid email"
                          : null;
                    },
                    hinttext: "Email",
                    suffixIcon: const Icon(Icons.email),
                    obscureText: false,
                  ),
                  const SizedBox(height: 12),
                  CustomTextField(
                    controller: passwordController,
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          isVisiable = !isVisiable;
                        });
                      },
                      icon: isVisiable
                          ? const Icon(Icons.visibility)
                          : const Icon(Icons.visibility_off),
                    ),
                    hinttext: "Password",
                    obscureText: isVisiable,
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Forgot Password?",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  CustomButton(
                    text: "Sign in",
                    onPressed: () async {
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      String? storedEmail = prefs.getString('email');
                      String? storedPassword = prefs.getString('password');

                      if (emailController.text == storedEmail &&
                          passwordController.text == storedPassword) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Home(),
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Invalid email or password"),
                          ),
                        );
                      }
                    },
                  ),
                  const SizedBox(height: 150),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Don\'t have an account?',
                        style: TextStyle(fontSize: 17, color: Colors.white),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Register(),
                            ),
                          );
                        },
                        child: const Text(
                          'Register',
                          style: TextStyle(
                            fontSize: 17,
                            decoration: TextDecoration.underline,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 100),
                    ],
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
