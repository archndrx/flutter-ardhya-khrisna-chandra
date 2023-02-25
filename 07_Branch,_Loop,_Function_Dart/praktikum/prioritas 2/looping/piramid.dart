import 'dart:io';

void main(List<String> args) {
  int baris = 8;
  for (int i = 0; i < baris; i++) {
    for (int j = (baris - i); j > 1; j--) {
      stdout.write(" ");
    }
    for (int j = 0; j <= i; j++) {
      stdout.write("* ");
    }
    stdout.writeln();
  }
}
