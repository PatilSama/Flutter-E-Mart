
import 'package:flutter_emart/consts/consts.dart';

class FireStoreServices{

  // Get User Data.
  static getUser(uid){
    return firestore.collection(usersCollection).where('id',isEqualTo: uid).snapshots();
  }

  static getProduct(category){
    return firestore.collection(productsCollection).where('p_category',isEqualTo:  category).snapshots();
  }
}