import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo_app/core/base/base.dart';
import 'package:todo_app/features/auth/data/model/user_model.dart';
import 'package:todo_app/features/auth/presentation/views/sign_up/sign_up_connector.dart';

class SignUpViewModel extends BaseViewModel<SignUpConnector>{
  SignUpConnector? connector;
   Future<void> addUser(UserModel userModel)async {
    var collection = getUsersCollection();
    var docRef = collection.doc(userModel.id);
    await docRef.set(userModel);
  }
   Future<UserModel?> readUser(String id)async{
    var collection = getUsersCollection();
    DocumentSnapshot<UserModel> docRef =await collection.doc(id).get();
    return docRef.data();
  }
   CollectionReference<UserModel> getUsersCollection() {
    return FirebaseFirestore.instance
        .collection("Users")
        .withConverter<UserModel>(
      fromFirestore: (snapshot, _) {
        return UserModel.fromJson(snapshot.data()!);
      },
      toFirestore: (user, _){
        return user.toJson();
      },
    );
  }

  void createUserWithEmailAndPassword(
      String email,
      String password, {
        required String firstName,
        required String lastName,
      }) async {
    try {
      connector!.showLoading();
      final credential =
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      connector!.hideLoading();
      credential.user?.sendEmailVerification();
      UserModel userModel = UserModel(
        id: credential.user!.uid,
        firstName: firstName,
        lastName: lastName,
        email: email,
      );
      connector!.goToSignIn();
      addUser(userModel);
    } on FirebaseAuthException catch (e) {
      connector!.showErrorDialog(e.toString());
    } catch (e) {
      connector!.showErrorDialog(e.toString());
      connector!.hideLoading();
    }
  }
}