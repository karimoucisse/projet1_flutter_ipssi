import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firstbd233/controller/firebase_helper.dart';
import 'package:firstbd233/model/my_user.dart';
import 'package:firstbd233/view/user_info.dart';
import 'package:flutter/material.dart';

import '../constante/constant.dart';

class ListPersonne extends StatefulWidget {
  const ListPersonne({super.key});

  @override
  State<ListPersonne> createState() => _ListPersonneState();
}

class _ListPersonneState extends State<ListPersonne> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseHelper().cloud_users.snapshots(),
        builder: (context, snap) {
          if (snap.data == null) {
            return Center(
              child: Text("Aucun utilisateur"),
            );
          } else {
            List documents = snap.data!.docs;
            List filteredStrings =
                documents.where((item) => item.id != moi.uid).toList();
            return ListView.builder(
                itemCount: filteredStrings.length,
                itemBuilder: (context, index) {
                  List<String> strings = [
                    'one',
                    'two',
                    'three',
                    'four',
                    'five'
                  ];
                  MyUser users = MyUser.bdd(filteredStrings[index]);
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return UserInfo(user: users);
                      }));
                    },
                    child: Card(
                      elevation: 5,
                      color: Colors.blue[900],
                      child: ListTile(
                          leading: CircleAvatar(
                            radius: 20,
                            backgroundImage: NetworkImage(users.avatar!),
                          ),
                          title: Text(users.fullName,
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)),
                          subtitle: Text(users.email,
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey[400])),
                          trailing:
                              IconButton(
                            icon: Icon(
                              Icons.favorite,
                              // size: 20.0,
                              color: moi.favoris.contains(users.uid)
                                  ? Colors.red
                                  : Colors.white,
                            ),
                            onPressed: () {
                              FirebaseHelper().favoris(users).then((value) {
                                print(value.email);
                                //naviguer vers la nouvelle page
                              }).catchError((onError) {
                                print(onError.toString());
                              });
                            },
                          )),
                    ),
                  );
                });
          }
        });
  }
}
