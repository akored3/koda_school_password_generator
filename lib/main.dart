import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:password_generator/bloc/password_bloc.dart';
import 'package:password_generator/bloc/password_state.dart';
import 'package:password_generator/service/password_generator.dart';
import 'package:password_generator/views/password_generator_view.dart';
import 'package:password_generator/views/welcome_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Password Generator',
    home: BlocProvider<PasswordGeneratorBloc>(
      create: (context) => PasswordGeneratorBloc(PasswordGenerator()),
      child: const HomePage(),
    ),
  ));
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PasswordGeneratorBloc, PasswordGeneratorState>(
      builder: (context, state) {
        if (state is PasswordGeneratorInitialState) {
          return const Welcome();
        } else if (state is PasswordGeneratorOnState) {
          return const PasswordGeneratorView();
        } else {
          return const Scaffold(
            body: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
