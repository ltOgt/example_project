import 'package:flutter/widgets.dart';

import 'stateful_model.dart';

class CounterModel extends StatefulModel {
  static CounterModel read(BuildContext context) => StatefulModel.read(context);
  static CounterModel watch(BuildContext context) => StatefulModel.watch(context);

  // -----------------------------------------------------------
  // State -----------------------------------------------------
  // -1 indicates that no data has been loaded yet
  int _count = -1;

  // -----------------------------------------------------------
  // Getters ---------------------------------------------------
  int get count => _count;

  // -----------------------------------------------------------
  // Utility ---------------------------------------------------

  // -----------------------------------------------------------
  // Manipulation ----------------------------------------------
  void setCount(int c) => setState(() {
        // See [StatefulModel.setState] to understand how the model informs its listeners
        this._count = c;
      });

  // -----------------------------------------------------------
  // Internal Helpers ------------------------------------------

}
