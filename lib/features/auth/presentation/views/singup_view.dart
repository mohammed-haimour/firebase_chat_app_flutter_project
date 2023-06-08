import 'package:firebase_chat_app/core/utils/icons.dart';
import 'package:firebase_chat_app/core/utils/navigators.dart';
import 'package:firebase_chat_app/core/utils/styles.dart';
import 'package:firebase_chat_app/core/widgets/defult_button.dart';
import 'package:firebase_chat_app/core/widgets/defult_text_form_field.dart';
import 'package:firebase_chat_app/features/auth/data/firebase_create_account_auth_operation_impl.dart';
import 'package:firebase_chat_app/features/auth/presentation/views/singin_view.dart';
import 'package:firebase_chat_app/features/chat/presentation/views/chat_view.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

class SingUpView extends StatefulWidget {
  const SingUpView({super.key});

  @override
  State<SingUpView> createState() => _SingUpViewState();
}

class _SingUpViewState extends State<SingUpView> {

  bool isLoading = false ;

  bool _isSecretOne  = true  ;

  final TextEditingController _emailTextFieldController = TextEditingController() ;
  final TextEditingController _passwordTextFieldController = TextEditingController() ;

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailTextFieldController.dispose();
    _passwordTextFieldController.dispose();
    // ignore: avoid_print
    print('Dispose used');
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height - 10,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [

                  SizedBox(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,

                      children: [
                        appIcon(size: 80),
                        const Text("Welcome To iMessage" , style: Styles.textStyle20),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Text("Create Your Account " , style: Styles.textStyle30.copyWith(fontWeight: FontWeight.bold),),
                  const SizedBox(height: 20,),
                  SizedBox(
                      width: double.infinity,
                      child : Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            const SizedBox(height: 10,),
                            DefaultTextFormField(
                              validator: (val){
                                final bool isValidEmail = EmailValidator.validate(val);
                                if(!isValidEmail){
                                  return "Please Enter a Valid Email";
                                }else{
                                  return null;
                                }
                              },
                              controller: _emailTextFieldController,
                                inputType: TextInputType.emailAddress, innerText: "Your Email Address ", prefixIcon: const Icon(Icons.email))
                            ,const SizedBox(height: 20,),
                            DefaultTextFormField(
                              validator: (val){
                                if(val.toString().length < 5){
                                  return "Please Enter a Valid Password";
                                }else{
                                  return null;
                                }
                              },
                              controller: _passwordTextFieldController,
                              inputType: TextInputType.text, innerText: "Your Password 🛂", prefixIcon: const Icon(Icons.password) , suffixIcon: IconButton(
                              onPressed: (){
                                setState(() {
                                  if(_isSecretOne == false ){
                                    _isSecretOne = true ;
                                  }else{
                                    _isSecretOne = false ;
                                  }
                                });
                              },
                              icon: (_isSecretOne == false ) ? const Icon(Icons.visibility) : const Icon(Icons.visibility_off),
                            ) , obscure: _isSecretOne,),
                            const SizedBox(height: 10,),
                          ],
                        ),
                      )),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center
                          ,
                          children: [
                            const Text("Do You Have An Account ?"),
                            TextButton(onPressed: (){replaceTo(context, const SingInView());}, child: const Text("Sing In !"))
                          ],
                        ),

                         const Divider()

                        ,const SizedBox(height: 5,),

                        SizedBox(
                            width: double.infinity,
                            child: DefaultButton(onPressed: (){
                              if(_formKey.currentState!.validate() && isLoading == false){
                                setState(() {
                                  isLoading = true ;
                                });
                                firebaseCreateAccountAuthOperationImpl(context , emailAddress: _emailTextFieldController.text , password: _passwordTextFieldController.text).then((value) {
                                  setState(() {
                                    isLoading = false ;
                                  });
                                  replaceTo(context, ChatView());

                                });
                              }else{
                              }
                            },innerText: (isLoading) ? "Please Wait..." : "Go!!"  ) )

                        ,const SizedBox(height: 50,),

                      ],
                    ),
                  )

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
