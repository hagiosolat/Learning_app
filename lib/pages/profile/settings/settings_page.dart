import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:u_learning/common/values/constant.dart';
import 'package:u_learning/pages/application/bloc/application_blocs.dart';
import 'package:u_learning/pages/application/bloc/application_events.dart';
import 'package:u_learning/pages/profile/settings/bloc/settings_blocs.dart';
import 'package:u_learning/pages/profile/settings/bloc/settings_states.dart';
import 'package:u_learning/pages/profile/settings/widgets/setting_widgets.dart';

import '../../../common/routes/names.dart';
import '../../../global.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  void removeUserData() {
    context.read<AppBlocs>().add(TriggerAppEvent(0));
    Global.storageService.remove(AppConstants.STORAGE_USER_TOKEN_KEY);
    Navigator.of(context)
        .pushNamedAndRemoveUntil(AppRoutes.SIGN_IN, (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: SingleChildScrollView(
          child: BlocBuilder<SettingsBlocs, SettingStates>(
        builder: (context, state) {
          return Container(
            child: Column(children: [settingsButton(context, removeUserData)]),
          );
        },
      )),
    );
  }
}
