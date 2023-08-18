import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:messengerapp/main.dart';
import 'package:messengerapp/screenlogin.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'screenhome.dart';

class ScreenSplash extends StatefulWidget {
  const ScreenSplash({super.key});

  @override
  State<ScreenSplash> createState() => _ScreenSplashState();
}

class _ScreenSplashState extends State<ScreenSplash> {
  @override
  void initState() {
    checkUserLoggedIn();
    // TODO: implement initState
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'MESSENGER',
          style: TextStyle(
              fontStyle: FontStyle.italic, fontSize: 55, color: Colors.blue),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }
  Future<void> gotoLogIn(BuildContext context) async {
    Future.delayed(Duration(seconds: 5));
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx) {
      return ScreenLogIn();
    }));
  }

  Future<void> checkUserLoggedIn() async {
    final _sharedPrefs = await SharedPreferences.getInstance();
    final _userLoggedIn = _sharedPrefs.getBool(SAVE_KEY_NAME);
    if (_userLoggedIn == null || _userLoggedIn == false) {
      gotoLogIn(context);
    } else {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx1) {
        return ScreenHome();
      }));
    }
  }
}
