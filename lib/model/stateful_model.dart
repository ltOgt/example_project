import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class StatefulModel extends ChangeNotifier {
  void setState([VoidCallback? action]) {
    action?.call();
    // A function exposed by [ChangeNotifer] which implements the notification of all Listeners
    notifyListeners();
  }

  static T watch<T>(BuildContext context, [bool listen = false]) => Provider.of<T>(context, listen: true);
  static T read<T>(BuildContext context, [bool listen = false]) => Provider.of<T>(context, listen: false);
}
