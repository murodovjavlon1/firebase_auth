import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:name/page/home_page.dart';
import 'package:name/page/signin_page.dart';
import 'package:name/server/auth_server.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPassword = TextEditingController();
  @override
  void initState() {
    super.initState();
    _doSingUp();
  }

  void _doSingUp() {
    String email = emailController.text.toString().trim();
    String password = passwordController.text.toString().trim();
    String cPassword = confirmPassword.text.toString().trim();

    if (email.isEmpty || password.isEmpty) return;
    if (password != cPassword) {
      return;
    }
     // ignore: avoid_print
     print("======================");
    AuthServer.singUpUser(email, password).then((value) => {response(value!)});
  }

  void response(User fuser) {
    Navigator.pop(context, MaterialPageRoute(builder: (context) {
      return const HomePage();
    }));
  }

  void _singIn() {
    Navigator.pop(context, MaterialPageRoute(builder: (context) {
      return const SigninPage();
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Colors.deepPurple,
              Color.fromARGB(255, 157, 121, 219),
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.only(right: 15, left: 15),
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white12,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: TextField(
                  controller: emailController,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    hintText: "Email",
                    border: InputBorder.none,
                  ),
                ),
              ),

              Container(
                margin: const EdgeInsets.only(top: 15),
                padding: const EdgeInsets.only(right: 15, left: 15),
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white12,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: TextField(
                  controller: passwordController,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    hintText: "Password",
                    border: InputBorder.none,
                  ),
                ),
              ),

              Container(
                margin: const EdgeInsets.only(top: 15),
                padding: const EdgeInsets.only(right: 15, left: 15),
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white12,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: TextField(
                  controller: passwordController,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    hintText: "Confirm Password",
                    border: InputBorder.none,
                  ),
                ),
              ),

              const SizedBox(
                height: 10,
              ),
              TextButton(
                onPressed: _doSingUp,
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all<Color>(
                      const Color.fromARGB(255, 102, 124, 141)),
                ),
                child: const Text(
                  "Sing Up",
                  style: TextStyle(fontSize: 17, color: Colors.white),
                ),
              ),
              const SizedBox(
                height: 15,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    "Already have an account",
                    style: TextStyle(fontSize: 18),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: _singIn,
                    child: const Text(
                      "Sing In",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
