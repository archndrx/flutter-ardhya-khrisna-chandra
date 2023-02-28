import 'dart:io';

void main(List<String> args) {
  stdout.write('Masukkan kata : ');
  String kata = stdin.readLineSync()!;

  List<String> listKata = kata.split(',');
  Map<String, int> frekuensi = {};

  for (String item in listKata) {
    if (frekuensi.containsKey(item)) {
      frekuensi[item] = frekuensi[item]! + 1;
    } else {
      frekuensi[item] = 1;
    }
  }

  String hasil = '';
  for (String key in frekuensi.keys) {
    hasil += "$key: ${frekuensi[key]}, ";
  }

  print(hasil);
}
