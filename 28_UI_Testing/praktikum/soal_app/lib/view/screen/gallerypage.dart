import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soal_app/model/images_model.dart';

import 'package:soal_app/view/screen/imagepage.dart';

class GalleryPage extends StatelessWidget {
  Images gambar = Images();

  @override
  Widget build(BuildContext context) {
    final currentRouteName = ModalRoute.of(context)!.settings.name;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("My Gallery"),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pushNamed(context, '/');
            },
          ),
        ),
        body: GridView.builder(
            padding: EdgeInsets.all(16),
            itemCount: gambar.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
            ),
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                child: Image.asset(
                  gambar.imageList[index],
                  fit: BoxFit.cover,
                ),
                onTap: () {
                  showModalBottomSheet(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      context: context,
                      builder: (BuildContext context) {
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              padding: EdgeInsets.all(16),
                              width: MediaQuery.of(context).size.width * 0.5,
                              child: Image.asset(
                                gambar.imageList[index],
                              ),
                            ),
                            ListTile(
                              leading: Icon(Icons.image),
                              title: Text('View Image'),
                              trailing: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text("No"),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                      showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              title: Text("View Image"),
                                              content: Image.asset(
                                                  gambar.imageList[index]),
                                              actions: [
                                                TextButton(
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: Text("No"),
                                                ),
                                                TextButton(
                                                  onPressed: () {
                                                    Navigator
                                                        .pushNamedAndRemoveUntil(
                                                            context,
                                                            '/image',
                                                            ModalRoute.withName(
                                                                '/gallery'),
                                                            arguments: {
                                                          'imageUrl': gambar
                                                              .imageList[index]
                                                        });
                                                  },
                                                  child: Text("Yes"),
                                                ),
                                              ],
                                            );
                                          });
                                    },
                                    child: Text("Yes"),
                                  ),
                                ],
                              ),
                            )
                          ],
                        );
                      });
                },
              );
            }),
      ),
    );
  }
}
