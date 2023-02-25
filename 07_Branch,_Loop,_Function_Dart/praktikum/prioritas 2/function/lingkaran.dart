import 'dart:io';
import 'dart:math';

void main(List<String> args) {
  luasLingkaran();
}

void luasLingkaran() {
  stdout.write('Masukan nilai jari - jari : ');
  int jari = int.parse(stdin.readLineSync()!);
  double pi = 3.14;

  num volume = pi * pow(jari, 2);
  print(volume);
}
