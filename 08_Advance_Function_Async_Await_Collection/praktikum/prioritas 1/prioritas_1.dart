Future<List> soal(List data, int multiplier) async {
  List listBaru = [];
  for (int num in data) {
    listBaru.add(num * multiplier);
  }
  await Future.delayed(
    Duration(seconds: 2),
  );
  return listBaru;
}

void main(List<String> args) async {
  List nilai = [2, 9, 7, 4, 8];
  int pengali = 2;
  print('Nilai awal adalah : $nilai');

  List hasil = await soal(nilai, pengali);
  print('Nilai setelah dilakukan proses : $hasil');
}
