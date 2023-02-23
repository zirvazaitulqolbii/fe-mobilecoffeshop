import 'dart:async';

import 'package:coffeshop/registrasi.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<FormState> _key = GlobalKey();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();

  void getDataLogin() {
    if (_key.currentState!.validate()) {
      if (_email.text.isEmpty || _password.text.isEmpty) {
        print("Data Tidak Boleh Kosong");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: _key,
        child: ListView(
          children: [
            SizedBox(height: 100),
            Center(
              child: Image.asset(
                "assets/image/logorona.jpeg",
                scale: 10,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50, left: 40, right: 40),
              child: TextFormField(
                decoration: InputDecoration(
                  prefixIcon: Icon(CupertinoIcons.person),
                  label: Text("Email"),
                  fillColor: Colors.grey[350],
                  filled: true,
                  border: OutlineInputBorder(
                    borderSide: BorderSide(),
                  ),
                ),
                validator: (e) {
                  if (e!.isEmpty) {
                    return "Email cannot be empty!";
                  }
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 40, right: 40),
              child: TextFormField(
                decoration: InputDecoration(
                    prefixIcon: Icon(CupertinoIcons.padlock_solid),
                    label: Text("Enter Your Password"),
                    fillColor: Colors.grey[350],
                    filled: true,
                    border: OutlineInputBorder(
                      borderSide: BorderSide(),
                    )),
                validator: (e) {
                  if (e!.isEmpty) {
                    return "Password tidak boleh kosong!";
                  }
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 40, left: 40, right: 40),
              child: Container(
                height: 50,
                child: ElevatedButton(
                    onPressed: () {
                      getDataLogin();
                    },
                    child: Text(
                      "LOGIN",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Belum Mempunyai akun? ",
                    style: TextStyle(fontSize: 16),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => RegistrasiPage()));
                      },
                      child: Text(
                        "Daftar Sekarang !",
                        style: TextStyle(fontSize: 16, color: Colors.blueAccent),
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
