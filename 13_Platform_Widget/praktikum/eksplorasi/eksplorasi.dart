import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Color(0xFF6200EE),
          title: Text("My Flutter App"),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.search),
            ),
          ],
        ),
        body: ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            Course course = listCourse[index];
            return Card(
              child: ListTile(
                title: Text(
                  'Learn ${course.nama}',
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            );
          },
          itemCount: listCourse.length,
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Color(0xFF6200EE),
          selectedItemColor: Colors.white,
          unselectedItemColor: Color.fromARGB(255, 183, 181, 181),
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Favorites',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.info),
              label: 'Information',
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Color(0xFF03DAC5),
          child: Icon(
            Icons.add,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}

class Course {
  String nama;

  Course(this.nama);
}

var listCourse = [
  Course('Flutter'),
  Course('ReactJS'),
  Course('VueJS'),
  Course('Tailwind CSS'),
  Course('UI/UX'),
  Course('Figma'),
  Course('Digital Marketing'),
];
