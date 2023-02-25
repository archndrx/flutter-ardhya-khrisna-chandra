import 'dart:io';

void main(List<String> args) {
  stdout.write('Masukkan angka : ');
  int angka = int.parse(stdin.readLineSync()!);

  if (angka > 70) {
    print('$angka adalah nilai A');
  }
  if (angka > 40) {
    print('$angka adalah nilai B');
  }
  if (angka > 20) {
    print('$angka adalah nilai C');
  } else {
    print('');
  }
}
