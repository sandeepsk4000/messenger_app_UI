import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:messengerapp/main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'screenhome.dart';

class ScreenLogIn extends StatefulWidget {
  const ScreenLogIn({super.key});

  @override
  State<ScreenLogIn> createState() => _ScreenLogInState();
}

class _ScreenLogInState extends State<ScreenLogIn> {
  final _userNameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              SizedBox(
                  width: double.infinity,
                  height: 200,
                  child: Image(
                    image: AssetImage('assets/images/backgroungflutter.jpg'),
                    fit: BoxFit.fill,
                  )),
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: SizedBox(
                  width: 350,
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Username field is required';
                      } else {
                        return null;
                      }
                    },
                    controller: _userNameController,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Color.fromARGB(255, 176, 173, 173),
                        hintText: 'Username',
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(40.0)))),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: SizedBox(
                  width: 350,
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Password field is required';
                      } else {
                        return null;
                      }
                    },
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Color.fromARGB(255, 176, 173, 173),
                        hintText: 'Password',
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(40.0)))),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: SizedBox(
                  width: 350,
                  height: 50,
                  child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          checkLogin(context);
                        } else {
                          print('Data is empty');
                        }
                      },
                      child: Text('Log in'),
                      style: ButtonStyle(
                          shape:
                              MaterialStatePropertyAll(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40.0),
                          )),
                          backgroundColor: MaterialStatePropertyAll<Color>(
                              Color.fromARGB(255, 3, 56, 96)))),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextButton(onPressed: () {}, child: Text('Forgot Password ?')),
              SizedBox(
                height: 10,
              ),
             
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: Icon(
                      Icons.facebook_rounded,
                      color: Colors.blue,
                    ),
                    label: Text(
                      'Sign In',
                      style: TextStyle(
                        color: Color.fromARGB(255, 3, 56, 96),
                      ),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll<Color>(
                          Color.fromARGB(211, 255, 255, 255)),
                    ),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: Icon(
                      Icons.email_rounded,
                      color: Colors.red,
                    ),
                    label: Text(
                      'Sign In',
                      style: TextStyle(
                        color: Color.fromARGB(255, 3, 56, 96),
                      ),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll<Color>(
                        Color.fromARGB(211, 255, 255, 255),
                      ),
                    ),
                  ),
                  
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't Have an account ?"),
                  TextButton(onPressed: () {}, child: Text('Sign Up'))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> checkLogin(BuildContext context) async {
    final _username = _userNameController.text;
    final _password = _passwordController.text;
    if (_username == 'sandeep' && _password == '1234') {
      //goto home
      //Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx1) {
      // return ScreenHome();
      // }));
      final _sharedprefs = await SharedPreferences.getInstance();
      await _sharedprefs.setBool(SAVE_KEY_NAME, true);
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => ScreenHome()));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.all(10),
          backgroundColor: Colors.red,
          content: Text(
            "Username and Password doesn't match",
            style: TextStyle(color: Colors.white),
          )));
    }
  }
}
