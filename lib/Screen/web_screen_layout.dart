import 'package:flutter/material.dart';
import 'package:whatsapp/colors.dart';
import 'package:whatsapp/widgets/contacts_list.dart';

import '../widgets/chat_list.dart';
import '../widgets/web_chat_appbar.dart';
import '../widgets/web_profile_bar.dart';
import '../widgets/web_search_bar.dart';

class WebScreenLayout extends StatelessWidget {
  const WebScreenLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: const [
                  //WEB PROFILEBAR
                  WebProfileBar(),

                  //  WEB SEARCHBAR
                  WebSearchBar(),

                  ContactList(),
                ],
              ),
            ),
          ),

          // WEB SCREEN

          Container(
            width: MediaQuery.of(context).size.width * 0.75,
            decoration: const BoxDecoration(
                image: DecorationImage(
              image: AssetImage("assets/backgroundImage.png"),
              fit: BoxFit.cover,
            )),
            child: Column(
              children: [
                // CHAT APP BAR
                WebChatAppbar(),

                // CHAT LIST
                Expanded(child: ChatList()),

                //MESSAGE INPUT BOX
                Container(
                  height: MediaQuery.of(context).size.height * 0.07,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: dividerColor,
                      ),
                    ),
                    color: chatBarMessage,
                  ),
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: () {}, icon: Icon(Icons.emoji_emotions, color: Colors.grey,),
                      ),
                      IconButton(
                        onPressed: () {}, icon: Icon(Icons.attach_file, color: Colors.grey,),
                      ),
                      Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 10,
                              right: 15,
                            ),
                            child: TextField(
                              decoration: InputDecoration(
                                fillColor: searchBarColor,
                                filled: true,
                                hintText: 'Type a message',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: const BorderSide(
                                    width: 0,
                                    style: BorderStyle.none,
                                  ),
                                ),
                                contentPadding: const EdgeInsets.only(left: 20),
                              ),
                            ),
                          )
                      ),
                      IconButton(onPressed: () {}, icon: Icon(Icons.mic, color: Colors.grey,))
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
