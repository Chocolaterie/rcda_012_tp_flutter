import 'package:flutter/material.dart';

class MessageButton extends StatelessWidget {
  String imgPath;

  MessageButton(this.imgPath);

  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: () {}, icon: Image.asset(this.imgPath, width: 24,));
  }
}

class MessageCard extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.network(
                    "https://avatar.iran.liara.run/public",
                    width: 96,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "shiba@gmail.com",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text("56s")
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5.0),
                            child: Text(
                              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 3,
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    MessageButton("reply.png"),
                    MessageButton("retweet.png"),
                    MessageButton("favorite.png")
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}