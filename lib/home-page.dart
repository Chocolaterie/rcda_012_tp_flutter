import 'package:flutter/material.dart';
import 'package:rcda_012_tp_flutter/footer.dart';
import 'package:rcda_012_tp_flutter/header.dart';
import 'package:rcda_012_tp_flutter/message-card.dart';
import 'package:rcda_012_tp_flutter/tweet.dart';

class MyHomePage extends StatelessWidget {
  // Ma liste de tweets en dur
  var tweets = [
    Tweet("denis@gmail.com", "Lui c'est un guignol"),
    Tweet("mathis@gmail.com", "J'ai des questions"),
    Tweet("isaac@gmail.com", "Je parle trop vite assez souvent quand même"),
  ];

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
              children: [
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
