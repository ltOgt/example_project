import 'load_cmd.dart';
import 'base_command.dart';

class IncrementCmd extends BaseCommand {
  static void run() async {
    var db = BaseCommand.db;

    // Update Data in the fake db
    db.updateCount();

    // Use the LoadCmd to load data and update the model
    LoadCmd.run();
  }
}
