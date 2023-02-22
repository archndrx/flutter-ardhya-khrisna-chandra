import 'dart:io';
import 'dart:math';

void main() {
  stdout.write('Masukan nilai jari - jari : ');
  int jari = int.parse(stdin.readLineSync()!);

  stdout.write('Masukan nilai tinggi : ');
  int tinggi = int.parse(stdin.readLineSync()!);

  double pi = 3.14;

  num volume = pi * pow(jari, 2) * tinggi;
  print(volume);
}
