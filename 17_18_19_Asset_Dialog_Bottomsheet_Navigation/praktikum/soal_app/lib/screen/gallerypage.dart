import 'package:flutter/material.dart';
import 'package:soal_app/model/images_model.dart';
import 'package:soal_app/screen/imagepage.dart';

class GalleryPage extends StatelessWidget {
  Images gambar = Images();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("My Gallery"),
          centerTitle: true,
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
                      context: context,
                      builder: (BuildContext context) {
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              padding: EdgeInsets.all(16),
                              //height: MediaQuery.of(context).size.height * 0.5,
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

                                                    // Navigator.pop(context);
                                                    // Navigator.push(context,
                                                    //     MaterialPageRoute(
                                                    //         builder: (context) {
                                                    //   return ImagePage(
                                                    //       imageUrl:
                                                    //           gambar.imageList[
                                                    //               index]);
                                                    // }));
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