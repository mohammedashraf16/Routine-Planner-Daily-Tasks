import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/features/auth/data/model/user_model.dart';
import 'package:todo_app/features/home/model/tasks_model.dart';

class FirebaseFunctions {
  static CollectionReference<TaskModel> getTasksCollection() {
    return FirebaseFirestore.instance
        .collection("Tasks")
        .withConverter<TaskModel>(
      fromFirestore: (snapshot, _) {
        return TaskModel.fromJson(snapshot.data()!);
      },
      toFirestore: (taskModel, _) {
        return taskModel.toJson();
      },
    );
  }

  static CollectionReference<UserModel> getUsersCollection() {
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

  static Future<void> addUser(UserModel userModel)async {
    var collection = getUsersCollection();
    var docRef = collection.doc(userModel.id);
    await docRef.set(userModel);
  }

  static Future<UserModel?> readUser(String id)async{
    var collection = getUsersCollection();
    DocumentSnapshot<UserModel> docRef =await collection.doc(id).get();
   return docRef.data();
  }

  static Future<void> addTask(TaskModel model) async {
    var collection = getTasksCollection();
    var docRef = collection.doc();
    model.id = docRef.id;
    docRef.set(model);
  }

  static Stream<QuerySnapshot<TaskModel>> getTasks(DateTime date) {
    var collection = getTasksCollection();
    return collection.where("userId", isEqualTo: FirebaseAuth.instance.currentUser!.uid).where("date", isEqualTo: DateUtils.dateOnly(date).millisecondsSinceEpoch,).snapshots();
  }

  static Future<void> deleteTasks(String id) {
    return getTasksCollection().doc(id).delete();
  }

  static Future<void> updateTasks(TaskModel taskModel) {
    return getTasksCollection().doc(taskModel.id).update(taskModel.toJson());
  }

  static signInWithEmailAndPassword(String emailAddress, String password,
      {required Function onSuccess, required Function onError}) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: emailAddress, password: password);
      if (credential.user?.emailVerified == true) {
        onSuccess();
      }
    } on FirebaseAuthException catch (e) {
      onError(e.message);
    }
  }
  static signOut(){
    FirebaseAuth.instance.signOut();
  }

  static createUserWithEmailAndPassword(
    String email,
    String password, {
    required Function onSuccess,
    required Function onError,
    required String firstName,
    required String lastName,
  }) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      credential.user?.sendEmailVerification();
      UserModel userModel = UserModel(
        id: credential.user!.uid,
        firstName: firstName,
        lastName: lastName,
        email: email,
      );
      addUser(userModel);
      onSuccess();
    } on FirebaseAuthException catch (e) {
      onError(e.message);
    } catch (e) {
      onError(e.toString());
    }
  }
}
