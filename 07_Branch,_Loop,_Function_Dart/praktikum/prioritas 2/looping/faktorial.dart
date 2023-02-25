import 'dart:io';

void main(List<String> args) {
  stdout.write('Masukkan bilangan: ');
  int bilangan = int.parse(stdin.readLineSync()!);

  stdout.write('Faktor $bilangan adalah: ');
  int i = 1;
  while (i < bilangan) {
    if (bilangan % i == 0) {
      stdout.write('\n$i');
    }
    i++;
  }
}
