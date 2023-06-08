import 'package:firebase_chat_app/core/utils/icons.dart';
import 'package:firebase_chat_app/core/utils/navigators.dart';
import 'package:firebase_chat_app/core/utils/styles.dart';
import 'package:firebase_chat_app/core/widgets/defult_button.dart';
import 'package:firebase_chat_app/features/auth/presentation/views/singin_view.dart';
import 'package:firebase_chat_app/features/auth/presentation/views/singup_view.dart';
import 'package:flutter/material.dart';

class WelcomeToAppView extends StatelessWidget {
  const WelcomeToAppView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [appIcon(size: 150),
                      const Text("Welcome To iMessage" , style: Styles.textStyle20,),],
                  ),
                ),
                // const Spacer(),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Expanded(child: DefaultButton(onPressed: () {
                        replaceTo(context, const SingInView());
                      } , innerText: "Sign in")),
                      const SizedBox(width: 10,),
                      Expanded(child: DefaultButton(onPressed: (){
                        replaceTo(context, const SingUpView());

                      } , innerText: "Sign up")),

                    ],
                  ),
                )
              ],
            ),
          )
      ),
    );
  }
}
