import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:soal_app2/provider/asset_provider.dart';

class HomePage extends StatelessWidget {
  final _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('DiceBear API'),
        ),
        body: Column(
          children: [
            Consumer<AssetProvider>(
              builder: (context, assetProvider, _) => Container(
                height: 200,
                width: 200,
                child: assetProvider.imageUrl.isEmpty
                    ? Container()
                    : SvgPicture.string(assetProvider.imageUrl),
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: _textController,
                      decoration: InputDecoration(
                        hintText: 'Enter text here',
                      ),
                    ),
                  ),
                  SizedBox(width: 16),
                  ElevatedButton(
                    onPressed: () {
                      final assetProvider =
                          Provider.of<AssetProvider>(context, listen: false);
                      assetProvider.fetchImage(_textController.text);
                    },
                    child: Text('Generate'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
