import 'dart:io';

void main(List<String> args) {
  stdout.write('Masukkan nilai 1 : ');
  double nilai1 = int.parse(stdin.readLineSync()!).toDouble();

  stdout.write('Masukkan nilai 2 : ');
  double nilai2 = int.parse(stdin.readLineSync()!).toDouble();

  Calculator calculator = Calculator(nilai1, nilai2);

  print("====================");

  print('Hasil penjumlahan adalah : ${calculator.penjumlahan(nilai1, nilai2)}');
  print('Hasil pengurangan adalah : ${calculator.pengurangan(nilai1, nilai2)}');
  print('Hasil perkalian adalah : ${calculator.perkalian(nilai1, nilai2)}');
  print('Hasil pembagian adalah : ${calculator.pembagian(nilai1, nilai2)}');
}

class Calculator {
  double nilai1, nilai2;

  Calculator(this.nilai1, this.nilai2);

  double penjumlahan(nilai1, nilai2) {
    return nilai1 + nilai2;
  }

  double pengurangan(nilai1, nilai2) {
    return nilai1 - nilai2;
  }

  double perkalian(nilai1, nilai2) {
    return nilai1 * nilai2;
  }

  double pembagian(nilai1, nilai2) {
    if (nilai2 == 0) {
      throw Exception('Tidak bisa dibagi dengan 0');
    } else {
      return nilai1 / nilai2;
    }
  }
}
