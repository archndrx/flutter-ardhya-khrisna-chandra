import 'dart:io';
import 'dart:math';

void main(List<String> args) {
  List<int> nilai = [];

  stdout.write('Masukkan jumlah nilai : ');
  int jumlahNilai = int.parse(stdin.readLineSync()!);

  for (int i = 0; i < jumlahNilai; i++) {
    stdout.write('Masukkan nilai ke ${i + 1} : ');
    nilai.add(int.parse(stdin.readLineSync()!));
  }

  int totalTambah = 0;

  for (int i = 0; i < nilai.length; i++) {
    totalTambah += nilai[i];
  }

  double rata = totalTambah / nilai.length;
  int result = rata.ceil();

  print('Hasilnya adalah $result');
}
