import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'screenlogin.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HOME'),
        actions: [
          IconButton(
              onPressed: () {
                return signOut(context);
              },
              icon: Icon(Icons.logout_rounded))
        ],
      ),
      body: SafeArea(
        child: ListView.separated(
            itemBuilder: (context, index) {
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage(
                      'assets/images/flutter_tutorial_hero-1536x614.jpg'),
                ),
                title: Text('person$index'),
                subtitle: Text('message$index'),
                trailing: listAlt(index),
              );
            },
            separatorBuilder: (context, index) {
              return Divider();
            },
            itemCount: 20),
      ),
    );
  }

  signOut(BuildContext context) async {
    final _sharedPrefs = await SharedPreferences.getInstance();

    await _sharedPrefs.clear();
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => ScreenLogIn()),
        (route) => false);
  }

  listAlt(index) {
    if (index == 0 || index % 3 == 0) {
      return IconButton(
          onPressed: () {},tooltip: 'Add to contact',
          icon: Icon(
            Icons.person_2_rounded,
            color: Colors.blue,
          ));
    } else {
      return IconButton(
        tooltip: 'Send message',
          onPressed: () {},
          icon: Icon(
            Icons.send_rounded,
            color: Colors.blue,
          ));
    }
  }
}
