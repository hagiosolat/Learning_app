import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:u_learning/pages/register/bloc/register_blocs.dart';
import 'package:u_learning/pages/sign_in/bloc/signin_bloc.dart';
import 'package:u_learning/pages/welcome/blocs/welcome_blocs.dart';

class AppBlocProviders {
  static get allBlocProviders => [
        BlocProvider(
          create: (context) => WelcomeBloc(),
        ),
        // BlocProvider(create: (context) => AppBlocs()),
        BlocProvider(create: (context) => SignInBloc()),
        BlocProvider(create: (context)=>RegisterBloc())
      ];
}
