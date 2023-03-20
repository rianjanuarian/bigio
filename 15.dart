import 'dart:io';
void main() {
  List<String> inputan = [];

 print('Masukkan huruf:');

  while (true) {
    String? input = stdin.readLineSync();
    if (input == null) {

break;
    } else {
      inputan.add(input);

    }
    String output = inputan.join() + inputan.reversed.join();
    print('Output: $output');

  }

}