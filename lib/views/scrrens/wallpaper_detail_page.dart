import 'package:flutter/material.dart';

class WallPaperDetailedPage extends StatefulWidget {
  const WallPaperDetailedPage({super.key});

  @override
  State<WallPaperDetailedPage> createState() => _WallPaperDetailedPageState();
}

class _WallPaperDetailedPageState extends State<WallPaperDetailedPage> {
  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    Map data = ModalRoute.of(context)!.settings.arguments as Map;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: s.height * 0.8,
              width: s.width * 0.9,
              decoration: BoxDecoration(),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.network(
                    data['largeImageURL'],
                    fit: BoxFit.fitHeight,
                    height: double.infinity,
                  ),
                  Image.network(
                    "https://o.remove.bg/downloads/28a8fdd7-58d8-4360-9733-3673300a7d09/Untitled__1_-removebg-preview.png",
                    fit: BoxFit.fill,
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
