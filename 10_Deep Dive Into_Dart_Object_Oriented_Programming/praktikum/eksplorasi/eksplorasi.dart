import 'dart:io';
import 'dart:math';

void main(List<String> args) {
  Circle lingkaran = Circle(6);
  print('Luas Lingkaran adalah ${lingkaran.getArea()}');
  print('Keliling Lingkaran adalah ${lingkaran.getPerimeter()}');
  print('=============================');

  Square persegi = Square(4);
  print('Luas Persegi adalah ${persegi.getArea()}');
  print('Keliling Persegi adalah ${persegi.getPerimeter()}');
  print('=============================');

  Rectangle persegiPanjang = Rectangle(2, 3);
  print('Luas Persegi Panjang adalah ${persegiPanjang.getArea()}');
  print('Keliling Persegi Panjang adalah ${persegiPanjang.getPerimeter()}');
  print('=============================');
}

abstract class Shape {
  int getArea();
  int getPerimeter();
}

class Circle implements Shape {
  int radius;

  Circle(this.radius);

  @override
  int getArea() {
    return (3.14 * pow(radius, 2)).toInt();
  }

  @override
  int getPerimeter() {
    return (3.14 * 2 * pi * radius).toInt();
  }
}

class Square implements Shape {
  int side;

  Square(this.side);

  @override
  int getArea() {
    return side * side;
  }

  @override
  int getPerimeter() {
    return 4 * side;
  }
}

class Rectangle implements Shape {
  int width;
  int height;

  Rectangle(this.height, this.width);

  @override
  int getArea() {
    return width * height;
  }

  @override
  int getPerimeter() {
    return 2 * (width + height);
  }
}
