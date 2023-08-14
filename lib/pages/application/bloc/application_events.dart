abstract class AppEvent {
  const AppEvent();
}

class TriggerAppEvent extends AppEvent {
  final int index;
  TriggerAppEvent(this.index) : super();
}
