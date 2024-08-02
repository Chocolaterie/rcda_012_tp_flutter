import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rcda_012_tp_flutter/home/footer.dart';
import 'package:rcda_012_tp_flutter/home/header.dart';
import 'package:rcda_012_tp_flutter/home/message-card.dart';
import 'package:rcda_012_tp_flutter/home/messages-view-model.dart';

class MyHomePage extends StatelessWidget {

  MessagesViewModel viewModel = MessagesViewModel();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Scaffold(
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
                  ElevatedButton(onPressed: () { viewModel.callApi(context); }, child: Text("Je Climatiseur")),
                  Expanded(
                      child: Consumer<MessagesViewModel>(
                        builder: (context, viewModel, child) {
                          return ListView.builder(
                            itemCount: viewModel.tweets.length,
                            itemBuilder: (BuildContext context, int index) {
                              // Récupérer la donnée Tweet dans la liste
                              var tweet = viewModel.tweets[index];
                              // Retourner/Afficher la carte tweet en envoyer le modèle Tweet dans la carte
                              return MessageCard(tweet);
                            });},
                      ))
                ],
              ),
            )),
            FooterWidget()
          ],
        ),
      ),
    );
  }
}
