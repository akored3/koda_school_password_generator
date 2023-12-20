import 'package:bloc/bloc.dart';
import 'package:password_generator/bloc/password_event.dart';
import 'package:password_generator/bloc/password_state.dart';
import 'package:password_generator/service/password_generator.dart';

class PasswordGeneratorBloc
    extends Bloc<PasswordEvent, PasswordGeneratorState> {
  PasswordGeneratorBloc(PasswordGenerator provider)
      : super(const PasswordGeneratorInitialState()) {
    on<EventInitial>((event, emit) {
      emit(const PasswordGeneratorInitialState());
    });

    on<EventStartPasswordGenerator>((event, emit) {
      emit(const PasswordGeneratorOnState());
    });

    on<EventGenerateColdPassword>((event, emit) {
      provider.generateWeakPassword();
      emit(const GeneratedPasswordState());
    });

    on<EventGenerateWarmPassword>((event, emit) {
      provider.generateMediumPassword();
      emit(const GeneratedPasswordState());
    });

    on<EventGenerateHotPassword>((event, emit) {
      provider.generateStrongPassword();
      emit(const GeneratedPasswordState());
    });
  }
}
