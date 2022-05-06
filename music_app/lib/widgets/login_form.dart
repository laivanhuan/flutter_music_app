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
                Image.network(
                  'https://p.kindpng.com/picc/s/21-210072_man-wearing-headphones-silhouette-hd-png-download.png',
                  height: 184,
                ),
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
                if (!isLogin)
                  SizedBox(
                    height: 35.47,
                  ),
                SizedBox(
                  height: 59,
                  width: 311.4,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      isLogin ? 'Login' : 'Create',
                      style: TextStyle(fontSize: 16, letterSpacing: 6),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black,
                      elevation: 0,
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(50.0),
                      ),
                    ),
                  ),
                ),
                if (isLogin)
                  Padding(padding: EdgeInsets.only(top: 20), child: Text('or')),
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
