import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:talky/services/database.dart';
import 'package:talky/widgets/widgets.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchText = new TextEditingController();
  DatabaseMethods databaseMethods = DatabaseMethods();
// _JsonQuerySnapshot
  // _JsonQuerySnapshot snapshot;
  QuerySnapshot searchSnapshot;

  initiateSearch() {
    databaseMethods.getUser(searchText.text).then((val) {
      // print(val.toString());
      // searchSnapshot = val;
      setState(() {
        searchSnapshot = val;
      });
    });
  }

  createChatroomAndStartConversation(String userName) {
    // List<String> users=[userName,myName];
    // databaseMethods.createChatRoom(chatRoomId, chatRoomMap)
  }

  Widget searchList() {
    return searchSnapshot != null
        ? ListView.builder(
            shrinkWrap: true,
            itemCount: searchSnapshot.docs.length,
            itemBuilder: (BuildContext context, int index) {
              return SearchTile(
                userName: searchSnapshot.docs[index].get("name"),
                userEmail: searchSnapshot.docs[index].get("email"),
              );
            },
          )
        : Container();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarMain(context),
      body: Container(
          child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            color: Color(0x54FFFFFF),
            child: Row(
              children: [
                Expanded(
                    child: TextField(
                  controller: searchText,
                  style: TextStyle(color: Colors.white54),
                  decoration: InputDecoration(
                    hintText: "search username..",
                    hintStyle: TextStyle(color: Colors.white54),
                    border: InputBorder.none,
                  ),
                )),
                GestureDetector(
                  onTap: () {
                    initiateSearch();

                    // print(val.toString());
                  },
                  child: Container(
                      height: 40,
                      width: 40,
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Color(0x36FFFFFF), Color(0x0FFFFFFF)],
                          ),
                          borderRadius: BorderRadius.circular(40)),
                      child: Image.asset("assets/images/search_white.png")),
                )
              ],
            ),
          ),
          searchList(),
        ],
      )),
    );
  }
}

class SearchTile extends StatelessWidget {
  final String userName;
  final String userEmail;
  SearchTile({this.userName, this.userEmail});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 24,
        horizontal: 16,
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(userName, style: mediumTextStyle()),
              Text(userEmail, style: mediumTextStyle()),
            ],
          ),
          Spacer(),
          // button(context, "Message"),
          GestureDetector(
            onTap: () {},
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    // const Color(0xff00735c),
                    const Color(0xff00695c),
                    const Color(0xff003d33),
                  ],
                ),
                borderRadius: BorderRadius.circular(30.0),
              ),
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Text(
                "Message",
                style: mediumTextStyle(),
              ),
            ),
          )
        ],
      ),
    );
  }
}
