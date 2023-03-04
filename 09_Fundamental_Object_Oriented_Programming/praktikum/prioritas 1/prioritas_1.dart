import 'dart:io';

void main(List<String> args) {
  Hewan kucing = Hewan(3.5);
  Hewan anjing = Hewan(10.0);
  Hewan sapi = Hewan(350.0);
  Hewan kambing = Hewan(150);

  Mobil mobil = Mobil(500);
  mobil.tambahMuatan(kucing);
  mobil.tambahMuatan(anjing);
  mobil.tambahMuatan(sapi);
  mobil.tambahMuatan(kambing);
}

class Hewan {
  double berat;

  Hewan(this.berat);
}

class Mobil {
  double kapasitas;
  List muatan = [];

  Mobil(this.kapasitas);

  void tambahMuatan(Hewan hewan) {
    if (hitungBerat() + hewan.berat <= kapasitas) {
      muatan.add(hewan);
      print(
          "Berat hewan ${hewan.berat} kg berhasil ditambahkan ke dalam muatan");
    } else {
      print(
          "Kapasitas mobil tidak cukup untuk menambahkan hewan berat ${hewan.berat} kg");
    }
  }

  double hitungBerat() {
    double totalBerat = 0.0;
    for (var hewan in muatan) {
      totalBerat += hewan.berat;
    }
    return totalBerat;
  }
}
