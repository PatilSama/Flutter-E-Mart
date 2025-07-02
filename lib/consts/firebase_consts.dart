import 'package:flutter_emart/consts/consts.dart';

FirebaseAuth auth = FirebaseAuth.instance;
FirebaseFirestore firestore = FirebaseFirestore.instance;
User? currentUser = auth.currentUser;

const usersCollection = "users";

const productsCollection = "products";