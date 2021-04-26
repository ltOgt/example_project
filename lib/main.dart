import 'package:example_project/command/load_cmd.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'command/base_command.dart';
import 'model/counter_model.dart';
import 'command/increment_cmd.dart';
import 'repo/fake_repo.dart';

void main() {
  // Start/Initialize Database
  FakeRepo db = FakeRepo();

  runApp(
    MultiProvider(
      providers: [
        // Inject Models into Context
        ChangeNotifierProvider(create: (_) => CounterModel()),
      ],
      child: Builder(builder: (context) {
        // Initialize BaseCommand
        BaseCommand.initialize(context, db);

        // Launch app
        return MyApp();
      }),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Listen to changes in CounterModel
    CounterModel model = CounterModel.watch(context);

    // Negative One indicates that data has not yet been loaded from database
    if (model.count == -1) {
      // Run LoadCommand to load Data from DB <<AFTER>> the frame has been build
      WidgetsBinding.instance?.addPostFrameCallback((timeStamp) => LoadCmd.run());
      return Container();
    }

    // Build UI
    return MaterialApp(
      title: 'Example Project',
      theme: ThemeData.dark(),
      home: Scaffold(
        body: Center(
          child: Text("Counter: ${model.count}"),
        ),
        floatingActionButton: FloatingActionButton(
          // Call Command from UI
          // Main Reason to not modify model directly is e.g. that a Database has to be consulted
          onPressed: () => IncrementCmd.run(),
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
