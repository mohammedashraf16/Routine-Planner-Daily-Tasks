import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
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

  static Future<void> addTask(TaskModel model) async {
    var collection = getTasksCollection();
    var docRef = collection.doc();
    model.id = docRef.id;
    docRef.set(model);
  }

  static Stream<QuerySnapshot<TaskModel>> getTasks(DateTime date) {
    var collection = getTasksCollection();
    return collection
        .where(
          "date",
          isEqualTo: DateUtils.dateOnly(date).millisecondsSinceEpoch,
        )
        .snapshots();
  }

  static Future<void> deleteTasks(String id) {
    return getTasksCollection().doc(id).delete();
  }

  static Future<void> updateTasks(TaskModel taskModel) {
    return getTasksCollection().doc(taskModel.id).update(taskModel.toJson());
  }

  static signInWithEmailAndPassword(String emailAddress, String password) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: emailAddress, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  static createUserWithEmailAndPassword(String email, String password) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      credential.user?.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }
}
