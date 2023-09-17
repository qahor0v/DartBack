void toTry(Future<void> Function() function) async {
  try {
    await function();
  } catch (e) {
    print(e);
  }
}
