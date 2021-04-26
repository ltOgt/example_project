class FakeRepo {
  int _count = 0;

  FakeRepo();

  void updateCount() => _count++;
  int selectCount() => _count;
}
