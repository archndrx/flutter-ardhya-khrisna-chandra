import 'dart:io';

void main() {
  stdout.write('Masukkan angka: ');
  int angka = int.parse(stdin.readLineSync()!);

  //baris
  for (var i = 1; i <= angka; i++) {
    String baris = '';

    //kolom
    for (var j = 1; j <= angka; j++) {
      baris += '${i * j}\t';
    }
    print(baris);
  }
}
