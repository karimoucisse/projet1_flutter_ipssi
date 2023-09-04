import 'package:firstbd233/constante/constant.dart';

class MyUser {
  late String nom;
  late String prenom;
  late String email;
  String? avatar;
  DateTime? birthday;
  late Genre genre;


  MyUser(){
    nom = "";
    prenom = "";
    email = "";
    genre = Genre.autres;
  }


}