import 'package:example_project/model/counter_model.dart';

import 'base_command.dart';

class LoadCmd extends BaseCommand {
  static void run() async {
    var db = BaseCommand.db;
    var model = BaseCommand.dependOn<CounterModel>();

    // Load Data from the fake DB
    int _c = db.selectCount();

    // Update the Model, which will inform its listeners that it has changed
    model.setCount(_c);
  }
}
