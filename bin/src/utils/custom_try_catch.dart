void toTry(void Function() function) {
  try {
    function;
  } catch (e) {
    print(e);
  }
}
