import 'package:firebase_auth/firebase_auth.dart';
//import 'package:flutter/database/db_firestore.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_aula1/models/time.dart';
import 'package:get/get.dart';

import '../models/pontocoleta.dart';

class AuthService extends GetxController {
  FirebaseAuth _auth = FirebaseAuth.instance;
  Rxn<User> _firebaseUser = Rxn<User>();
  //Rx<User?> _firebaseUser = Rx<User>();
  var userIsAuthenticated = false.obs;

  @override
  void onInit() {
    super.onInit();

    //_firebaseUser = Rx<User>(_auth.currentUser);
    _firebaseUser.bindStream(_auth.authStateChanges());

    ever(_firebaseUser, (User? user) {
      if (user != null) {
        userIsAuthenticated.value = true;
      } else {
        userIsAuthenticated.value = false;
      }
    });
  }

  User? get user => _firebaseUser.value;
  static AuthService get to => Get.find<AuthService>();

  definirPontoColeta(PontoColeta pontoColeta) async {
    /*
    final userId = _firebaseUser.value.uid;
    try {
      FirebaseFirestore db = await DBFirestore.get();
      await db.collection('usuarios').doc(userId).set({
        'time_id': time.id,
        'time_nome': time.nome,
      });
    } catch (e) {
      showSnack('Erro ao definir time', e.message);
    }
    */
  }

  showSnack(String titulo, String erro) {
    Get.snackbar(
      titulo,
      erro,
      backgroundColor: Colors.grey[900],
      colorText: Colors.white,
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  createUser(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      showSnack('Erro ao registrar!', e.toString());
    }
  }

  login(String email, String password) async {
    try {
      //ver outras opções de login
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      showSnack('Erro no Login!', e.toString());
    }
  }

  logout() async {
    try {
      await _auth.signOut();
    } catch (e) {
      showSnack('Erro ao sair!', e.toString());
    }
  }
}
