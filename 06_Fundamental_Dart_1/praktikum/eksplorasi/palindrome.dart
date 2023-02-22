import 'dart:io';

void main(List<String> args) {
  stdout.write('Masukkan kata : ');
  String kata = stdin.readLineSync()!;

  if (isPalindrome(kata)) {
    print('$kata adalah palindrome.');
  } else {
    print('$kata bukan palindrome.');
  }
}

bool isPalindrome(String kata) {
  String kebalikan = kata.toLowerCase().split('').reversed.join();
  return kata == kebalikan;
}
