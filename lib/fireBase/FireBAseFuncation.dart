
import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:to_do/Models/UserModel.dart';
import 'package:to_do/modual/TaskMoeal.dart';

class FireBaseFuncation{
  static CollectionReference<TaskModel> GetTaskModelCollection(){
    return FirebaseFirestore.instance.collection("Task ")
        .withConverter<TaskModel>(
        fromFirestore: (snapshot, options) {
          return TaskModel.fromJeson(snapshot.data()!);
        },
        toFirestore: (value, options) {
          return value.toJeson();
        },
    );
  }

 static Future<void> addTaskFirebaseStore(TaskModel taskModel)
  {
    var collection =GetTaskModelCollection();
    var docref=collection.doc();
    taskModel.id=docref.id;
    return docref.set(taskModel);

  }
  static Stream<QuerySnapshot<TaskModel>> GetTAsksFromFireStore(DateTime date){
    var collection=GetTaskModelCollection();
   return collection.where("date",isEqualTo:DateUtils.dateOnly(date).millisecondsSinceEpoch ).snapshots();
  }
  static  Future<void> DeleteTasks(String id ){
    return GetTaskModelCollection().doc(id).delete();
  }
  static  Future<void> updateTasks(String id, TaskModel tasks ){
    return GetTaskModelCollection().doc(id).update(tasks.toJeson());
  }
  static CollectionReference<UserModel> GetUserModelCollection(){
    return FirebaseFirestore.instance.collection(UserModel.ColleciionNAME)
        .withConverter<UserModel>(
      fromFirestore: (snapshot, options) {
        return UserModel.fromJeson(snapshot.data()!);
      },
      toFirestore: (value, options) {
        return value.toJson();
      },
    );
  }
  static Future<void> addUserFirebaseStore(UserModel UserModel) {
    var collection =GetUserModelCollection();
    var docref=collection.doc(UserModel.id);
    
    return docref.set(UserModel);

  }
  static Future<UserModel?> readUser(String id )async{
      DocumentSnapshot<UserModel> UserQuary=
      await GetUserModelCollection().doc(id).get();
      UserModel? usermodel= UserQuary.data();
      return usermodel;


  }
  static void CreatAuthAccount(String email ,String password,String name,String age,Function afterAddfireStor)async{
    try {
      var credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      UserModel userModel =UserModel(
        name: name,
        email: email,
        age: age,
        taskid: [],
        id: credential.user!.uid,);
      addUserFirebaseStore(userModel).then((value) {
        afterAddfireStor();
      });
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
  static void userLogin(String emailAddress,
      String password,Function notfoundUser,Function getUser)async{
    try {
      var credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailAddress,
          password: password
      );
      readUser(credential.user!.uid).then((value) {
        getUser(value);
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        notfoundUser();
      }
      else if (e.code == 'wrong-password') {
        notfoundUser();
      }
    }
  }

}