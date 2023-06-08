import 'package:firebase_chat_app/core/widgets/defult_snackbar.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<void> firebaseCreateAccountAuthOperationImpl(context , { required String emailAddress,  required String password }) async{
   try {

    // ignore: unused_local_variable
    final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: emailAddress,
      password: password,
    ).then((value) => showSnackBar(context, "Your Account Has Been Created Successfully"));
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      showSnackBar(context,"Please Enter Strong Password");
    } else if (e.code == 'email-already-in-use') {
      showSnackBar(context,"Email Already In Use");
    }else{
      showSnackBar(context,"Oops Something Went Wrong (Please Try Again Later...)");
    }
  } catch (e) {
     showSnackBar(context,"Oops Something Went Wrong (Please Try Again Later...)");
   }
}