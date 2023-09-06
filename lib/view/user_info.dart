import 'package:firstbd233/view/liste_personne.dart';
import 'package:firstbd233/view/my_background.dart';
import 'package:firstbd233/view/my_dashboard.dart';
import 'package:flutter/material.dart';

import '../model/my_user.dart';

class UserInfo extends StatefulWidget {
  MyUser user;
  // const UserInfo({super.key});
  UserInfo({required this.user});
  @override
  State<UserInfo> createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // TRY THIS: Try changing the color here to a specific color (to
          // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
          // change color while the other colors stay the same.
          backgroundColor: Colors.transparent,
          elevation: 0,
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
        ),
        extendBodyBehindAppBar: true,
        body: Stack(children: <Widget>[
          MyBackGroundPage(),
          Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              SizedBox(
                height: 40,
              ),
              CircleAvatar(
                radius: 100,
                backgroundImage: NetworkImage("${widget.user.avatar}"),
              ),
              SizedBox(
                height: 40,
              ),
              Column(children: [
                Text("prenom/nom: ${widget.user.fullName}",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    )),
                SizedBox(
                  height: 10,
                ),
                Text("email: ${widget.user.email}",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ))
              ]),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return MyDashBord();
                    }));
                  },
                  child: Text("Retourner à la page précedente"))
            ]),
          )
        ]));
  }
}
