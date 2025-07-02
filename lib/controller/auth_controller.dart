import 'package:flutter_emart/consts/consts.dart';

class AuthController extends GetxController {


  RxBool isLoading = false.obs;

  var emailController = TextEditingController();
  var passwordController = TextEditingController();


  void isloading(bool loading) => isLoading.value=loading;


  Future<UserCredential?> loginMethod({context}) async {
    UserCredential? userCredential;
    try {
      userCredential = await auth.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
    } on FirebaseAuthException catch (error) {
      VxToast.show(context, msg: error.toString());
    }
    return userCredential;
  }

  Future<UserCredential?> signupMethod({context, email, password}) async {
    UserCredential? userCredential;
    try {
      userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (authError) {
      VxToast.show(context, msg: authError.toString());
    }
    return userCredential;
  }

  storeUserData({name,password,email})async{
    DocumentReference store = firestore.collection(usersCollection).doc(currentUser!.uid);
    store.set({'name':name,'password':password,'email':email,'imageUrl':'','id':currentUser!.uid,"cart_count":"00","order_count":"00","wishlist_count":"00"});
  }

  signOutMethod({context})async{
    try{
      await auth.signOut();
    }on FirebaseAuthException catch(firebaseError){
      VxToast.show(context, msg: firebaseError.toString());
    }
  }
}
