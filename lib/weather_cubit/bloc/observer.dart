import 'package:bloc/bloc.dart';

class StateObserver extends BlocObserver{

  @override
  void onEvent(Bloc bloc, Object event) {
    print('onEvent $event');
    super.onEvent(bloc, event);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    print('onEvent $transition');
    super.onTransition(bloc, transition);
  }
}