import 'package:flutter/widgets.dart';
import 'package:example_project/repo/fake_repo.dart';
import 'package:provider/provider.dart';

class BaseCommand {
  static late BuildContext rootContext;
  static late FakeRepo db;

  static void initialize(BuildContext rootContext, FakeRepo db) {
    BaseCommand.rootContext = rootContext;
    BaseCommand.db = db;
  }

  static T dependOn<T>() => rootContext.read();
}
