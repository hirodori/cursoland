import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  final VoidCallback showLoginPage;
  const RegisterPage({super.key, required this.showLoginPage});

  @override
  State<RegisterPage> createState() => RegisterPageState();
}

class RegisterPageState extends State<RegisterPage> {
  // Controllers para o email e password
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmpasswordController = TextEditingController();
  final _firstnameController = TextEditingController();
  final _lastnameController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmpasswordController.dispose();
    _firstnameController.dispose();
    _lastnameController.dispose();
    super.dispose();
  }

  Future signUp() async {
    if (passwordConfirmed()) {
      // Criar usuário
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      // Adicionar detalhes do usuário
      addUserDetails(
        _firstnameController.text.trim(),
        _lastnameController.text.trim(),
        _emailController.text.trim(),
      );
    }
  }

  Future addUserDetails(String firstName, String lastName, String email) async {
    await FirebaseFirestore.instance.collection('users').add(
      {
        'first name': firstName,
        'last name': lastName,
        'email': email,
      },
    );
  }

  bool passwordConfirmed() {
    if (_passwordController.text.trim() ==
        _confirmpasswordController.text.trim()) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 25,
                ),
                Text(
                  'Hello, Amigos!!',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 36,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Register your account below!',
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
                SizedBox(
                  height: 50,
                ),

                // Nome
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextField(
                    controller: _firstnameController,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.amber),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      hintText: 'First Name',
                      fillColor: Colors.grey[100],
                      filled: true,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),

                // Sobrenome
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextField(
                    controller: _lastnameController,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.amber),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      hintText: 'Last Name',
                      fillColor: Colors.grey[100],
                      filled: true,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),

                // Email
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.amber),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      hintText: 'Email',
                      fillColor: Colors.grey[100],
                      filled: true,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),

                // Password
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.amber),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      hintText: 'Password',
                      fillColor: Colors.grey[100],
                      filled: true,
                    ),
                  ),
                ),

                SizedBox(
                  height: 10,
                ),

                // Confirmar Password
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextField(
                    controller: _confirmpasswordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.amber),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      hintText: 'Confirm Password',
                      fillColor: Colors.grey[100],
                      filled: true,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),

                // Botão Sign in
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: GestureDetector(
                    onTap: signUp,
                    child: Container(
                      padding: EdgeInsets.all(25),
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),

                // Registro
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already a member? ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    GestureDetector(
                      onTap: widget.showLoginPage,
                      child: Text(
                        'Login now',
                        style: TextStyle(
                          color: Colors.blue,
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
    );
  }
}
