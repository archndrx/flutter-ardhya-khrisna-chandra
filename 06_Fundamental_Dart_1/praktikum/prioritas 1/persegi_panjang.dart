import 'dart:io';

void main() {
  stdout.write('Masukan nilai panjang : ');
  int panjang = int.parse(stdin.readLineSync()!);

  // int nama_variabel = int.parse(stdin.readLineSync()!);

  stdout.write('Masukan nilai lebar : ');
  int lebar = int.parse(stdin.readLineSync()!);

  int keliling = 2 * (panjang + lebar);
  int luas = panjang * lebar;

  print('Keliling persegi panjang adalah $keliling');
  print('Luas persegi panjang adalah $luas');
}
