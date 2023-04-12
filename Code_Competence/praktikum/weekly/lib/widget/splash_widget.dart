import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashItem extends StatelessWidget {
  String title;
  String description;
  IconData iconData;

  SplashItem(this.title, this.description, this.iconData);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      child: Card(
        color: Color.fromARGB(255, 0, 134, 244).withOpacity(0.4),
        elevation: 3,
        margin: EdgeInsets.all(8),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Icon(iconData, size: 30),
              SizedBox(
                width: 20,
              ),
              Text(
                title,
                style: TextStyle(
                  //fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontFamily: 'Poppins',
                ),
              ),
              Spacer(),
              Text(
                description,
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Poppins',
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
