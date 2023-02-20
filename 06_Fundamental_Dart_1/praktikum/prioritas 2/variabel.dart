import 'dart:io';

void main(List<String> args) {
  stdout.write('Masukan variabel pertama : ');
  String var1 = stdin.readLineSync()!;

  stdout.write('Masukan variabel kedua : ');
  String var2 = stdin.readLineSync()!;

  stdout.write('Masukan variabel ketiga : ');
  String var3 = stdin.readLineSync()!;

  String result = var1 + ' ' + var2 + ' ' + var3;
  print(result);
}
