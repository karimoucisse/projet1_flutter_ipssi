import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firstbd233/constante/constant.dart';
import 'package:firstbd233/model/my_user.dart';

class FirebaseHelper {
  final auth = FirebaseAuth.instance;
  final cloud_users = FirebaseFirestore.instance.collection("UTILISATEURS");
  // final cloud_favoris = FirebaseFirestore.instance.collection("FAVORIS");
  final storage = FirebaseStorage.instance;

  //inscrire un utiisateur
  Future<MyUser> inscription(
      String nom, String prenom, String email, String password) async {
    UserCredential credential = await auth.createUserWithEmailAndPassword(
        email: email, password: password);
    String uid = credential.user!.uid;
    Map<String, dynamic> data = {
      "NOM": nom,
      "PRENOM": prenom,
      "EMAIL": email,
    };
    addUser(uid, data);
    return getUser(uid);
  }

  Future<MyUser> favoris(user) async {
    String uid = user!.uid;
    List userFavoris = moi.favoris;
    if (moi.favoris.contains(uid)) {
      userFavoris = userFavoris.where((item) => item != uid).toList();
    } else {
      userFavoris.add(uid);
    }
    Map<String, dynamic> map = {"FAVORIS": userFavoris};
    updateUser(moi.uid, map);
    return user;
  }

  Future<MyUser> getUser(String uid) async {
    DocumentSnapshot snapshot = await cloud_users.doc(uid).get();
    return MyUser.bdd(snapshot);
  }

  //ajouter un utilisateur dans la base de donnée
  addUser(String uid, Map<String, dynamic> data) {
    cloud_users.doc(uid).set(data);
  }

  //me connecter
  Future<MyUser> connexion(String email, String password) async {
    UserCredential credential =
        await auth.signInWithEmailAndPassword(email: email, password: password);
    String uid = credential.user!.uid;
    return getUser(uid);
  }

  //mise à jour d'un utilisateur
  updateUser(String uid, Map<String, dynamic> map) {
    cloud_users.doc(uid).update(map);
  }

  //stocker un fichier
  Future<String> stockage(String dossier, String uidUser, String nameFile,
      Uint8List datasFile) async {
    TaskSnapshot snapshot =
        await storage.ref("/$dossier/$uidUser/$nameFile").putData(datasFile);
    String url = await snapshot.ref.getDownloadURL();
    return url;
  }
}
