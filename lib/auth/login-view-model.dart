
import 'package:flutter/material.dart';
import 'package:rcda_012_tp_flutter/auth/AuthContext.dart';
import 'package:sn_progress_dialog/progress_dialog.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class LoginViewModel {

  void callApi(BuildContext context, String email, String password, void Function() onClosePopup) async {
    // Afficher popup chargement
    var pd = ProgressDialog(context: context);

    pd!.show(
        msg: "Tentative de connexion en cours...",
        barrierColor: Color(0x77000000),
        progressBgColor: Colors.transparent,
        elevation: 10.0
    );

    // FAKE: Simuler un lag de 1 seconde
    await Future.delayed(Duration(seconds: 1));

    // l'url
    var url = Uri.parse("http://127.0.01:3000/auth");

    //  header pour autoriser envoyer JSON
    final headers = {
      'Content-Type' : 'application/json'
    };
    // le body qu'on envoie en JSON
    final bodyRequest = convert.jsonEncode({
      'email' :  email,
      'password' : password
    });

    // appeler l'url
    var response = await http.post(url, headers: headers, body: bodyRequest);

    // mapper la reponse en json
    var responseBodyJson = convert.jsonDecode(response.body);

    // Fermer la popup de chargement
    pd!.close();

    // si code pas code 203 => erreur
    if (responseBodyJson['code'] != '203'){
      // Erreur à afficher
      showDialog<void>(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
                title: Text('Erreur'),
                content: Text(responseBodyJson['message']));
          });
      return;
    }

    // Stocker le token dans un static
    var token = responseBodyJson['data'] as String;

    AuthContext.token = token;

    // Afficher la popup d'information
    showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: Text('Information'),
              content: Text(responseBodyJson['message']));
        }).then((value) {
          // Appeler/déclencher la fonction passer en parametre donc le :
          // void Function() onClosePopup
          onClosePopup();
    });
  }
}