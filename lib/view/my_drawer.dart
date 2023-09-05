import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:firstbd233/constante/constant.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    //variable
    String nameFile;
    Uint8List bytesFile;

    //fonctions
    pickFile(){
      FilePicker.platform.pickFiles(
        type: FileType.image
      );
    }
    return Padding(
        padding: EdgeInsets.all(10),
      child: Column(
        children: [
          //Image Circulaire
          GestureDetector(
            onTap: (){
              pickFile();
            },
            child: CircleAvatar(
              radius: 150,
              backgroundImage: NetworkImage(moi.avatar!),
            ),
          ),
          Divider(thickness: 5,color: Colors.black,),


          //nom et prénom
          Text("Bonjour ${moi.fullName}",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)


        ],
      ),
    );
  }
}
