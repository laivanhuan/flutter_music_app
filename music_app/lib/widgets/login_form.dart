import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  var isLogin = true;

  void changeState() {
    setState(() {
      isLogin = !isLogin;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(50),
          child: Form(
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Email',
                    hintStyle: TextStyle(),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ),
                SizedBox(
                  height: 35.47,
                ),
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    hintStyle: TextStyle(),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ),
                SizedBox(
                  height: 35.47,
                ),
                if (!isLogin)
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Comfirm Password',
                      hintStyle: TextStyle(),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                  ),
                SizedBox(
                  height: 35.47,
                ),
                FlatButton(
                    onPressed: () {},
                    child: Text(isLogin ? 'Login' : 'Create')),
                if (isLogin) Text('or'),
                FlatButton(
                    onPressed: changeState,
                    child: Text(isLogin ? 'Create a new account' : 'Login')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
