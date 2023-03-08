import 'dart:io';

void main(List<String> args) {
  var kubus = Kubus();
  print('Volume kubus adalah : ${kubus.volume()}');

  var balok = Balok();
  print('Volume balok adalah : ${balok.volume()}');
}

class BangunRuang {
  double panjang = 2;
  double lebar = 3;
  double tinggi = 4;

  volume() {
    print('Ini volume bangun ruang');
  }
}

class Kubus extends BangunRuang {
  double sisi = 5;

  @override
  volume() {
    return sisi * sisi * sisi;
  }
}

class Balok extends BangunRuang {
  @override
  volume() {
    return panjang * lebar * tinggi;
  }
}
