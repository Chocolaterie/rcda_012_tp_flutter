import 'package:flutter/material.dart';
import 'package:rcda_012_tp_flutter/auth/AuthContext.dart';
import 'package:rcda_012_tp_flutter/tweet.dart';
import 'package:sn_progress_dialog/progress_dialog.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class MessagesViewModel with ChangeNotifier {

  // Ma liste de tweets vide par défaut
  List<Tweet> tweets = [];

  /// Appel l'api
  void callApi(BuildContext context) async {
    // Afficher popup chargement
    var pd = ProgressDialog(context: context);

    pd!.show(
        msg: "Récupération des messages en cours",
        barrierColor: Color(0x77000000),
        progressBgColor: Colors.transparent,
        elevation: 10.0
    );

    // FAKE: Simuler un lag de 1 seconde
    await Future.delayed(Duration(seconds: 1));

    // l'url
    var url = Uri.parse("http://127.0.01:3000/v2/comment/all");

    // preparer token a envoyer
    final headers = {
      'Authorization' : 'Bearer ${AuthContext.token}'
    };

    // appeler l'url
    var response = await http.get(url, headers: headers);

    // mapper la reponse en json
    var responseBodyJson = convert.jsonDecode(response.body);

    // Fermer la popup de chargement
    pd!.close();

    // Si erreur
    if (responseBodyJson['code'] != '200'){
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

    // mapper le json en liste de Tweet
    tweets = List<Tweet>.from(responseBodyJson['data'].map((tweetJson) =>Tweet.fromJson(tweetJson)).toList());

    // Notifier les changements
    notifyListeners();
  }
}