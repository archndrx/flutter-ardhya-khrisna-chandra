import 'dart:io';

void main(List<String> args) {
  stdout.write('Masukan nilai sisi : ');
  int sisi = int.parse(stdin.readLineSync()!);

  int keliling = sisi * 4;
  int luas = sisi * sisi;

  print('Keliling persegi adalah $keliling');
  print('Luas persegi adalah $luas');
}
