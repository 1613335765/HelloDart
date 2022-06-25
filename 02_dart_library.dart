void main(List<String> args) {
  var anObject = 'I drink tea.';
  var tea = 'black tea';
  print(anObject);
  print('I drink $tea.');
  assert(int.parse('42') == 42);
  assert(int.parse('0x42') == 66);
  assert(double.parse('0.50') == 0.5);
}
