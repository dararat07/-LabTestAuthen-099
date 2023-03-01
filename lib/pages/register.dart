import 'package:authentest_632021099/service/auth_sevrice.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String groupSimple = '';
  bool isChecked = false;
  final _formKey = GlobalKey<FormState>();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _Username = TextEditingController();
  TextEditingController _Telephone = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Login"),
        ),
        body: Form(
          key: _formKey,
          child: Column(children: [
            TextFormField(
              controller: _email,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Enter some text';
                }
                return null;
              },
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.email),
                labelText: "Email",
                hintText: "please enter email",
                hintStyle: TextStyle(color: Colors.amber),
              ),
            ),
            TextFormField(
              controller: _password,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Enter some text';
                }
                return null;
              },
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.password),
                labelText: "password",
                hintText: "please enter password",
                hintStyle: TextStyle(color: Colors.amber),
              ),
            ),
            TextFormField(
              controller: _Username,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Enter some text';
                }
                return null;
              },
              decoration: InputDecoration(
                labelText: "Username",
                hintText: "please enter Username",
                hintStyle: TextStyle(color: Colors.amber),
              ),
            ),
            TextFormField(
              controller: _Telephone,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Enter some text';
                }
                return null;
              },
              decoration: InputDecoration(
                labelText: "Telephone",
                hintText: "please enter Telephone",
                hintStyle: TextStyle(color: Colors.amber),
              ),
            ),
            Text("ประเภทผู้ใช้งาน"),
            RadioListTile(
              title: Text('อาจารย์ 1'),
              controlAffinity: ListTileControlAffinity.platform,
              value: 'อาจารย์',
              groupValue: groupSimple,
              onChanged: (value) {
                setState(() {
                  groupSimple = value!;
                });
              },
            ),
            RadioListTile(
              title: Text('เจ้าหน้าที่ 2'),
              controlAffinity: ListTileControlAffinity.platform,
              value: 'เจ้าหน้าที่',
              groupValue: groupSimple,
              onChanged: (value) {
                setState(() {
                  groupSimple = value!;
                });
              },
            ),
            RadioListTile(
              title: Text('นิสิต 3'),
              controlAffinity: ListTileControlAffinity.platform,
              value: 'นิสิต',
              groupValue: groupSimple,
              onChanged: (value) {
                setState(() {
                  groupSimple = value!;
                });
              },
            ),
            ElevatedButton(
              onPressed: () {
                // print(_email.toString());
                AuthService.registerUser(_email.text, _password.text)
                    .then((value) {
                  print("succes");
                  Navigator.pop(context);
                });
              },
              child: Text('Login'),
            ),
          ]),
        ));
  }
}
