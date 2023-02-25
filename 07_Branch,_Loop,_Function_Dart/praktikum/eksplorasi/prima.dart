import 'dart:io';

void main() {
  int angka;
  bool isPrime = true;

  stdout.write("Masukkan angka: ");
  angka = int.parse(stdin.readLineSync()!);

  if (angka == 0 || angka == 1) {
    isPrime = false;
    print("$angka bukan bilangan prima.");
  } else {
    for (int i = 2; i <= angka / 2; i++) {
      if (angka % i == 1) {
        print("$angka adalah bilangan prima.");
        break;
      } else if (angka % i == 0) {
        isPrime = false;
        print("$angka bukan bilangan prima.");
        break;
      }
      ;
    }
  }
}
