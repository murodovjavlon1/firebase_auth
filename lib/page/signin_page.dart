import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:name/page/home_page.dart';
import 'package:name/page/signup_page.dart';
import 'package:name/server/auth_server.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({super.key});

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  void _callSingUpPage() {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return const SignupPage();
    }));
  }

  void _doSingIn() {
    String email = emailController.text.toString().trim();
    String password = passwordController.text.toString().trim();
    if (email.isEmpty || password.isEmpty) return;

    AuthServer.singInUser(email, password).then((value) => {
      response(value!)

    });
  }

  void response(User fuser) {
   // if(fuser!=null){
       Navigator.push(context, MaterialPageRoute(builder: (context) {
      return const HomePage();
    }));
   // }
   
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
              // email
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

              const SizedBox(
                height: 10,
              ),
              TextButton(
                onPressed: _doSingIn,
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all<Color>(
                      const Color.fromARGB(255, 102, 124, 141)),
                ),
                child: const Text(
                  "Sing In",
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
                    "Don't have an accuont",
                    style: TextStyle(fontSize: 18),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: _callSingUpPage,
                    // onTap: () {
                    //   Navigator.push(context,
                    //       MaterialPageRoute(builder: (context) {
                    //     return HomePage();
                    //   }));
                    //    print("=========================");
                    // },
                    child: const Text(
                      "Sing Up",
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
