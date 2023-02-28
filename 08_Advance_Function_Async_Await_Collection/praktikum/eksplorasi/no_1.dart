import 'dart:io';

void main(List<String> args) {
  stdout.write('Masukkan nilai atau data : ');
  String nilai = stdin.readLineSync()!;

  List<String> input = nilai.split(',');
  List<String> output = [];

  for (String value in input) {
    if (!output.contains(value)) {
      output.add(value);
    }
  }
  print('Nilai awal : $input');
  print('Hasil akhir : $output');
}
