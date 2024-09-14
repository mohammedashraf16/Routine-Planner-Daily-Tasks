import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo_app/core/base/base.dart';
import 'package:todo_app/features/auth/presentation/views/sign_in/sign_in_connector.dart';

class SignInViewModel extends BaseViewModel<SignInConnector>{
  SignInConnector? signInConnector ;
  void signInWithEmailAndPassword(String emailAddress, String password,) async {
    try {
      connector!.showLoading();
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: emailAddress, password: password);
      connector!.hideLoading();
      if (credential.user?.emailVerified == true) {
       connector!.goToHome();
      }
    } on FirebaseAuthException catch (e) {
      connector!.showErrorDialog(e.toString());
      connector!.hideLoading();
    }
  }
}