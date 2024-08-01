import 'package:flutter/material.dart';
import 'package:rcda_012_tp_flutter/footer.dart';
import 'package:rcda_012_tp_flutter/header.dart';
import 'package:rcda_012_tp_flutter/message-card.dart';
import 'package:rcda_012_tp_flutter/tweet.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Ma liste de tweets vide par défaut
  List<Tweet> tweets = [];

  /// Appel l'api
  void callApi(BuildContext context) async {
    // l'url
    var url = Uri.parse("https://raw.githubusercontent.com/Chocolaterie/EniWebService/main/api/tweets.json");

    // appeler l'url
    var response = await http.get(url);

    // mapper la reponse en json
    var responseBodyJson = convert.jsonDecode(response.body);

    // mapper le json en liste de Tweet
    tweets = List<Tweet>.from(responseBodyJson.map((tweetJson) =>Tweet.fromJson(tweetJson)).toList());

    // Rafraichir l'écran
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Message"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          HeaderWidget(),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ElevatedButton(onPressed: () { callApi(context); }, child: Text("Je Climatiseur")),
                Expanded(
                    child: ListView.builder(
                        itemCount: tweets.length,
                        itemBuilder: (BuildContext context, int index) {
                          // Récupérer la donnée Tweet dans la liste
                          var tweet = tweets[index];
                          // Retourner/Afficher la carte tweet en envoyer le modèle Tweet dans la carte
                          return MessageCard(tweet);
                        }))
              ],
            ),
          )),
          FooterWidget()
        ],
      ),
    );
  }
}
