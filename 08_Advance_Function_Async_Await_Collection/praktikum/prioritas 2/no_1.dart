import 'dart:io';

List<List> listBio = [
  ['agus', 19],
  ['doni', 26],
  ['budi', 15],
  ['adi', 20]
];

Map<String, dynamic> mapBio = Map.fromEntries(
    listBio.map((item) => MapEntry<String, dynamic>(item[0], item[1])));

void main(List<String> args) {
  print(listBio);
  print(mapBio);
}
