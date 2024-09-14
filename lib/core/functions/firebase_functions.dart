import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/features/home/domain/model/tasks_model.dart';

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
    return collection.where("userId", isEqualTo: FirebaseAuth.instance.currentUser!.uid).where("date", isEqualTo: DateUtils.dateOnly(date).millisecondsSinceEpoch,).snapshots();
  }

  static Future<void> deleteTasks(String id) {
    return getTasksCollection().doc(id).delete();
  }

  static Future<void> updateTasks(TaskModel taskModel) {
    return getTasksCollection().doc(taskModel.id).update(taskModel.toJson());
  }


  static signOut(){
    FirebaseAuth.instance.signOut();
  }

}
