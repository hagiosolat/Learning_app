import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:u_learning/pages/register/bloc/register_blocs.dart';
import 'package:u_learning/pages/register/bloc/register_events.dart';
import 'package:u_learning/pages/register/bloc/register_states.dart';
import 'package:u_learning/pages/register/register_controller.dart';

import '../common_widget.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterStates>(
      builder: (context, state) {
        return Container(
          color: Colors.white,
          child: SafeArea(
              child: Scaffold(
            backgroundColor: Colors.white,
            appBar: buildAppBar("Sign Up"),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20.h,
                  ),
                  Center(
                      child: reusableText(
                          "Enter your details below & free sign up")),
                  Container(
                    margin: EdgeInsets.only(top: 60.h),
                    padding: EdgeInsets.only(left: 25.w, right: 25.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        reusableText("User name"),
                        buildTextField(
                            "Enter your user name", "username", "user",
                            (value) {
                          context
                              .read<RegisterBloc>()
                              .add(UserNameEvent(value));
                        }),
                        reusableText("Email"),
                        buildTextField(
                            "Enter your email Address", "email", "user",
                            (value) {
                          context.read<RegisterBloc>().add(EmailEvent(value));
                        }),
                        reusableText("Password"),
                        buildTextField(
                            "Enter your password", "password", "lock", (value) {
                          context
                              .read<RegisterBloc>()
                              .add(PasswordEvent(value));
                        }),
                        reusableText("Confirm Password"),
                        buildTextField(
                            "Enter your Confirm Password", "password", "lock",
                            (value) {
                          context
                              .read<RegisterBloc>()
                              .add(RePasswordEvent(value));
                        })
                      ],
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.only(left: 25.w),
                      width: 25.h,
                      child: reusableText(
                          "By creating an account you have to agree with our terms and condition")),
                  buildLoginAndRegButton("Sign Up", "login", () {
                    //Navigator.of(context).pushNamed("register");
                    RegisterController(context:context).handleEmailRegister();
                  }),
                ],
              ),
            ),
          )),
        );
      },
    );
  }
}
