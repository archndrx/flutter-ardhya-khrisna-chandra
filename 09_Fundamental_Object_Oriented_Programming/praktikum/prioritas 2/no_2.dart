void main() {
  Course matik = Course(
      title: "Matematika",
      description: 'Pembelajaran ini membahasa tentang perhitungan');
  Course oop = Course(
      title: "Pemrograman",
      description: "Pembelajaran ini membahas tentang pemrograman");

  Student dodi = Student(nama: 'Dodi', kelas: '12B');

  dodi.tambahCourse(matik);
  dodi.tambahCourse(oop);

  dodi.lihatDaftarCourse();

  dodi.hapusCourse(matik);

  dodi.lihatDaftarCourse();
}

class Course {
  String title;
  String description;

  Course({required this.title, required this.description});
}

class Student {
  String nama;
  String kelas;
  List<Course> daftarCourse = [];

  Student({required this.nama, required this.kelas});

  void tambahCourse(Course course) {
    daftarCourse.add(course);
  }

  void hapusCourse(Course course) {
    daftarCourse.remove(course);
  }

  void lihatDaftarCourse() {
    if (daftarCourse.isEmpty) {
      print("Belum ada Course yang ditambahkan");
    } else {
      print("Daftar Course $nama : ");
      for (int i = 0; i < daftarCourse.length; i++) {
        print("${i + 1}. ${daftarCourse[i].title}");
        print("   ${daftarCourse[i].description}");
      }
      print('============================');
    }
  }
}
