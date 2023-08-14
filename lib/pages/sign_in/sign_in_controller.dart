import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:u_learning/common/values/constant.dart';
import 'package:u_learning/common/widget/flutter_toast.dart';
import 'package:u_learning/pages/sign_in/bloc/signin_bloc.dart';

import '../../global.dart';

class SignInController {
  final BuildContext context;
  const SignInController({required this.context});

  Future<void> handleSignIn(String type) async {
    try {
      if (type == "email") {
        //BlocProvider.of<SignInbloc>(cotext).state
        final state = context.read<SignInBloc>().state;
        String emailAddress = state.email;
        String password = state.password;
        if (emailAddress.isEmpty) {
          //
          toastInfo(msg: 'You need to fill email address');
          return;
        }
        if (password.isEmpty) {
          //
          toastInfo(msg: 'You need to fill in Password');
          return;
        }
        try {
          final credential = await FirebaseAuth.instance
              .signInWithEmailAndPassword(
                  email: emailAddress, password: password);
          if (credential.user == null) {
            toastInfo(msg: "You don't exist");
            return;
          }
          if (!credential.user!.emailVerified) {
            ///
            toastInfo(msg: "You need to verify your eamil account");
            return;
          }

          var user = credential.user;
          if (user != null) {
            //we got verified from the firebase
            print("user exist");
            Global.storageService
                .setString(AppConstants.STORAGE_USER_TOKEN_KEY , "12345678");
            Navigator.of(context)
                .pushNamedAndRemoveUntil("/application", (route) => false);
          } else {
            //we have error getting user from firebase
            toastInfo(msg: "Currently you are not a user of this app");
            return;
          }
        } on FirebaseAuthException catch (e) {
          if (e.code == 'user-not-found') {
            print('No user found for that email.');
            toastInfo(msg: "No user found for this eamail");
          } else if (e.code == 'wrong-password') {
            print('Wrong password provided for that user');
            toastInfo(msg: "Wrong password provided for that user");
          } else if (e.code == 'invalid-email') {
            print('Your email format is wrong');
            toastInfo(msg: "Your email address format is wrong");
          }
        }
      }
    } catch (e) {}
  }
}
