import 'package:firebase_chat_app/core/utils/constants.dart';
import 'package:firebase_chat_app/core/utils/navigators.dart';
import 'package:firebase_chat_app/core/utils/styles.dart';
import 'package:firebase_chat_app/core/widgets/defualt_icon_button.dart';
import 'package:firebase_chat_app/core/widgets/getter_bubble.dart';
import 'package:firebase_chat_app/core/widgets/sender_bubble.dart';
import 'package:firebase_chat_app/features/chat/data/model/message_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatView extends StatelessWidget {
  ChatView({Key? key}) : super(key: key);

  final CollectionReference messages = FirebaseFirestore.instance.collection("messages");

  final TextEditingController messageTextFieldController = TextEditingController();

  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: messages.orderBy('createdAt' , descending: true).snapshots(),
        builder: (context , snapshot){
          // print(snapshot.data!.docs[0]['message']);
          if(snapshot.hasData){

            List<MessageModel> messageList = [] ;

            for(int i = 0 ; i < snapshot.data!.docs.length ; i++){
              messageList.add(MessageModel.fromJson(snapshot.data!.docs[i]));
            }

            return  SafeArea(
              child: Scaffold(
                appBar: PreferredSize(
                  preferredSize: const Size(double.infinity, 50),

                  child: Container(
                    height: double.infinity,
                    decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: myGrey,
                            width: 0.2,
                          ),

                        )),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        DefaultIconButton(onPressed: (){
                          back(context);
                        }, icon: const Icon(Icons.arrow_back_ios))
                        ,const Text("To : ALL ", style: Styles.textStyle18,)
                      ],
                    ),
                  ) ,
                ),
                body: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                            controller: _scrollController,
                            reverse : true ,
                            itemCount: messageList.length,
                            itemBuilder: (context , index){
                              return (FirebaseAuth.instance.currentUser!.email != messageList[index].email) ? GetterBubble(userMessage: messageList[index] ) : SenderBubble(userMessage: messageList[index] );
                            },
                        )
                      ),
                      TextFormField(
                        controller: messageTextFieldController,
                        onFieldSubmitted: (value){
                          _scrollController.animateTo(0, duration: const Duration(seconds: 1), curve: Curves.fastOutSlowIn);
                          messages.add({
                            'message' : messageTextFieldController.text ,
                            'createdAt' : DateTime.now().toString() ,
                            'email' : FirebaseAuth.instance.currentUser!.email,
                          });
                          messageTextFieldController.clear();
                        },
                        decoration: InputDecoration(

                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(width: 1, color: myGrey),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(width: 1, color: myGrey),
                          ),
                          disabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(width: 1, color: myGrey),
                          ),
                          errorBorder: UnderlineInputBorder(
                            borderSide: BorderSide(width: 1, color: myGrey),
                          ),
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(width: 1, color: myGrey),
                          ),


                          hintText: "Send A Message...",
                          suffixIcon: DefaultIconButton(icon: const Icon(Icons.send ,  color: Colors.blue,), onPressed: (){
                            messages.add({
                              'message' : messageTextFieldController.text ,
                              'createdAt' : DateTime.now().toString() ,
                              'email' : FirebaseAuth.instance.currentUser!.email,
                            });
                            _scrollController.animateTo(0, duration: const Duration(seconds: 1), curve: Curves.fastOutSlowIn);

                            messageTextFieldController.clear();
                          },),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          }else{
            return const Scaffold(body: Center(child: Text("Loading..."),));
          }
        }
    );
  }
}
