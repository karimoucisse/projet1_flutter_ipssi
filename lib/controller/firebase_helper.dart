import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FirebaseHelper {
  final auth = FirebaseAuth.instance;
  final cloud_users = FirebaseFirestore.instance.collection("UTILISATEURS");
  final storage = FirebaseStorage.instance;


  //inscrire un utiisateur
  inscription(String nom , String prenom , String email , String password) async {
    UserCredential credential = await auth.createUserWithEmailAndPassword(email: email, password: password);
    String uid = credential.user!.uid;
    Map<String,dynamic> data = {
      "NOM":nom,
      "PRENOM":prenom,
      "EMAIL": email,
    };
    addUser(uid, data);

}

  //ajouter un utilisateur dans la base de donnée
  addUser(String uid,Map<String,dynamic>data ){
    cloud_users.doc(uid).set(data);
  }


  //me connecter


  //mise à jour d'un utilisateur
}