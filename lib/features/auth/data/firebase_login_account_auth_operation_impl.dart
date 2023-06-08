import 'package:firebase_chat_app/core/widgets/defult_snackbar.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<void> firebaseLoginAccountAuthOperationImpl(context , { required String emailAddress,  required String password }) async{
   try {
    // ignore: unused_local_variable
    final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailAddress,
      password: password,
    ).then((value) => showSnackBar(context, "Your Account Has Been Logged In Successfully"));
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      showSnackBar(context,"No User Available For That Email");
    } else if (e.code == 'wrong-password') {
      showSnackBar(context,"You Have Entered A Wrong Password");
    }else{
      showSnackBar(context,"Oops Something Went Wrong (Please Try Again Later...)");
    }
  } catch (e) {
     showSnackBar(context,"Oops Something Went Wrong (Please Try Again Later...)");
   }
}