import 'dart:io';

void main(List<String> args) {
  KPK kpk = KPK();
  print('Nilai KPK dari ${kpk.x} dan ${kpk.y} adalah ${kpk.hasil()}');

  FPB fpb = FPB();
  print('Nilai FPB dari ${fpb.x} dan ${fpb.y} adalah ${fpb.hasil()}');
}

class Matematika {
  hasil() {
    print('Ini hasil Matematika');
  }
}

class KPK implements Matematika {
  int x = 30;
  int y = 20;

  @override
  hasil() {
    int result = 0;
    for (int i = 1; i <= y; i++) {
      if ((x * i) % y == 0) {
        result = x * i;
        break;
      }
    }
    return result;
  }
}

class FPB implements Matematika {
  int x = 30;
  int y = 20;

  @override
  hasil() {
    int result = x % y;
    do {
      x = y;
      y = result;
      result = x % y;
    } while (result != 0);
    return y;
  }
}
