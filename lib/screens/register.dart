import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:plant/constants.dart';
import 'package:plant/screens/home.dart';
import 'package:plant/screens/login.dart';
import 'package:plant/widgets/button.dart';
import 'package:plant/widgets/textfield.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool isVisiable = true;
  bool isUpperCase = false;
  bool isLowerCase = false;
  bool isSpesialCharacter = false;
  String gender = "Male";
  String? Status;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  double age = 18;

  void onChangedPassword(String password) {
    setState(() {
      isUpperCase = password.contains(RegExp(r'[A-Z]'));
      isLowerCase = password.contains(RegExp(r'[a-z]'));
      isSpesialCharacter = password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
    });
  }

  Future<void> saveUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setString('name', nameController.text);
    await prefs.setString('email', emailController.text);
    await prefs.setString('password', passwordController.text);
    await prefs.setDouble('age', age);
    await prefs.setString('gender', gender);
    await prefs.setString('status', Status ?? 'Single');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.green,
        title: const Text(
          'Register',
          style: TextStyle(color: Colors.white),
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
                children: [
                  const SizedBox(height: 70),
                  CustomTextField(
                    controller: nameController,
                    hinttext: "Name",
                    obscureText: false,
                  ),
                  const SizedBox(height: 12),
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
                    onChanged: onChangedPassword,
                    hinttext: "Password",
                    obscureText: isVisiable,
                  ),
                  const SizedBox(height: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Age:",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                      Slider(
                        value: age,
                        activeColor: const Color(0xFF3D751A),
                        min: 0,
                        max: 100,
                        divisions: 100,
                        label: age.round().toString(),
                        onChanged: (double value) {
                          setState(() {
                            age = value;
                          });
                        },
                      ),
                      Text(
                        "Selected Age: ${age.round()}",
                        style:
                            const TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  const SizedBox(height: 12),
                  dropdownButton(),
                  radioRow(),
                  SizedBox(height: 30),
                  CustomButton(
                    text: "Register",
                    onPressed: () async {
                      // حفظ البيانات المدخلة في SharedPreferences
                      await saveUserData();

                      // التوجيه إلى صفحة تسجيل الدخول بعد التسجيل
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const Login(), // التوجيه إلى صفحة تسجيل الدخول
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Already have an account?',
                        style: TextStyle(
                          fontSize: 18,
                          color: Color(0xff1F4529),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Login(),
                            ),
                          );
                        },
                        child: const Text(
                          'Login',
                          style: TextStyle(
                            fontSize: 18,
                            decoration: TextDecoration.underline,
                            color: Color(0xff1F4529),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
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

  Padding radioRow() {
    return Padding(
      padding: const EdgeInsets.only(left: 45, top: 25),
      child: Row(
        children: [
          const Text(
            "Gender:",
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
          const Spacer(
            flex: 1,
          ),
          Radio(
            value: "Male",
            groupValue: gender,
            onChanged: (value) {
              setState(() {
                gender = value!;
              });
            },
            activeColor: green,
          ),
          const Text(
            "Male",
            style: TextStyle(
              fontSize: 18,
              color: Color(0xff1F4529),
            ),
          ),
          Radio(
            value: "Female",
            groupValue: gender,
            onChanged: (value) {
              setState(() {
                gender = value!;
              });
            },
            activeColor: green,
          ),
          const Text(
            "Female",
            style: TextStyle(
              fontSize: 18,
              color: Color(0xff1F4529),
            ),
          ),
          const Spacer(flex: 1)
        ],
      ),
    );
  }

  Padding dropdownButton() {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: DropdownButtonFormField(
        decoration: const InputDecoration(
          hintText: "Select your status",
          labelText: "Status",
          labelStyle: TextStyle(
            color: Color(0xff1F4529),
          ),
          border: OutlineInputBorder(),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: green),
          ),
        ),
        value: Status,
        items: ['Single', 'Married', 'Divorced'].map((String value) {
          return DropdownMenuItem<String>(value: value, child: Text(value));
        }).toList(),
        onChanged: (value) {
          setState(() {
            Status = value;
          });
        },
      ),
    );
  }
}
