import 'dart:io';

void main(List<String> args) {
  stdout.write('Masukkan bilangan: ');
  int bilangan = int.parse(stdin.readLineSync()!);
  int hasil = faktorial(bilangan);
  print('Faktorial dari $bilangan adalah $hasil');
}

int faktorial(int angka) {
  if (angka == 0) {
    return angka = 1;
  } else {
    return angka * faktorial(angka - 1);
  }
}
