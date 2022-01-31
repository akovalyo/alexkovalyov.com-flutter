import '../navigation/routes.dart';

String? currentRoot() {
  String? curr;
  navKey.currentState?.popUntil((route) {
    curr = route.settings.name;
    return true;
  });

  return curr;
}
