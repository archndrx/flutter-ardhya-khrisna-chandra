import 'dart:io';

void main(List<String> args) {
  TokoBuku tokoBuku = TokoBuku();

  Buku buku1 = Buku(1, "Belajar Dart", "Alta.id", "Komputer", 75000);
  tokoBuku.addBuku(buku1);
  Buku buku2 = Buku(2, "Si Kancil", 'Legenda Indo', 'Fiksi', 50000);
  tokoBuku.addBuku(buku2);
  Buku buku3 =
      Buku(3, "Undang Undang Dasar", 'Politisi Bersama', 'Hukum', 125000);
  tokoBuku.addBuku(buku3);

  List semuaBuku = tokoBuku.getAllBuku();
  print("Daftar Buku:");
  semuaBuku.forEach((book) {
    print(
        "${book.id}. ${book.judul} - ${book.penerbit} - ${book.kategori} - Rp${book.harga}");
  });

  stdout.write('\nMasukkan id buku yang ingin dihapus : ');
  int hapusId = int.parse(stdin.readLineSync()!);
  tokoBuku.removeBuku(hapusId);
  print("Buku dengan ID $hapusId telah dihapus.");

  print("\nDaftar Buku:");
  semuaBuku.forEach((book) {
    print(
        "${book.id}. ${book.judul} - ${book.penerbit} - ${book.kategori} - Rp${book.harga}");
  });
}

class Buku {
  int id;
  String judul, penerbit, kategori;
  double harga;

  Buku(this.id, this.judul, this.penerbit, this.kategori, this.harga);
}

class TokoBuku {
  List<Buku> listBuku = [];

  void addBuku(Buku buku) {
    listBuku.add(buku);
  }

  List<Buku> getAllBuku() {
    return listBuku;
  }

  void removeBuku(int id) {
    listBuku.removeWhere((book) => book.id == id);
  }
}
