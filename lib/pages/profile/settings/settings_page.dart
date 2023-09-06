import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:u_learning/pages/profile/settings/bloc/settings_blocs.dart';
import 'package:u_learning/pages/profile/settings/bloc/settings_states.dart';
import 'package:u_learning/pages/profile/settings/widgets/setting_widgets.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: SingleChildScrollView(
          child: BlocBuilder<SettingsBlocs, SettingStates>(
        builder: (context, state) {
          return Container(
            child: Column(children: [
              GestureDetector(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text("Confirm Logout"),
                          content: const Text("Confirm Logout"),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text("Cancel")),
                                 TextButton(
                                onPressed: () {
                                  
                                },
                                child: const Text("Confirm")),
                          ],
                        );
                      });
                },
                child: Container(
                  width: 100.w,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.fitHeight,
                          image: AssetImage("assets/icons/Logout.png"))),
                ),
              )
            ]),
          );
        },
      )),
    );
  }
}