import 'dart:io';

Future<int> faktorialAsync(int angka) async {
  if (angka == 0) {
    return angka = 1;
  } else {
    int faktorial = 1;
    for (int i = 1; i <= angka; i++) {
      faktorial *= i;
    }
    await Future.delayed(
      Duration(seconds: 2),
    );
    return faktorial;
  }
}

void main(List<String> args) async {
  stdout.write('Masukkan bilangan: ');
  int bilangan = int.parse(stdin.readLineSync()!);
  print('Faktorial dari $bilangan');

  int hasil = await faktorialAsync(bilangan);
  print('adalah $hasil');
}
