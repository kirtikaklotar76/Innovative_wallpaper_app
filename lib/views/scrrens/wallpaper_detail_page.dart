import 'package:async_wallpaper/async_wallpaper.dart';
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
      appBar: AppBar(
        title: const Text(
          "Preview",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.transparent,
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
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
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.network(
                    data['largeImageURL'],
                    fit: BoxFit.fitHeight,
                    height: double.infinity,
                  ),
                  Image.asset(
                    "assets/images/preview.png",
                    fit: BoxFit.fill,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () async {
                Container(
                  height: s.height * 0.30,
                  width: s.width * 0.40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  child: await showDialog(
                    useSafeArea: true,
                    context: context,
                    builder: (context) => Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Where You Want to Apply?",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Column(
                          children: [
                            Card(
                              color: Colors.white,
                              child: TextButton(
                                onPressed: () {
                                  AsyncWallpaper.setWallpaper(
                                    url: data['largeImageURL'],
                                    goToHome: true,
                                    wallpaperLocation:
                                        AsyncWallpaper.HOME_SCREEN,
                                    errorToastDetails: ToastDetails.error(),
                                    toastDetails: ToastDetails.success(),
                                  );
                                },
                                child: const Text(
                                  "Home Screens",
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                            ),
                            Card(
                              color: Colors.white,
                              child: TextButton(
                                onPressed: () {
                                  AsyncWallpaper.setWallpaper(
                                    url: data['largeImageURL'],
                                    goToHome: true,
                                    wallpaperLocation:
                                        AsyncWallpaper.LOCK_SCREEN,
                                    errorToastDetails: ToastDetails.error(),
                                    toastDetails: ToastDetails.success(),
                                  );
                                },
                                child: const Text(
                                  "Lock Screens",
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                            ),
                            Card(
                              color: Colors.white,
                              child: TextButton(
                                onPressed: () {
                                  AsyncWallpaper.setWallpaper(
                                    url: data['largeImageURL'],
                                    goToHome: true,
                                    wallpaperLocation:
                                        AsyncWallpaper.BOTH_SCREENS,
                                    errorToastDetails: ToastDetails.error(),
                                    toastDetails: ToastDetails.success(),
                                  );
                                },
                                child: const Text(
                                  "Both Screens",
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
              child: const Text("Set as Wallpaper"),
            ),
          ],
        ),
      ),
      backgroundColor: Color(0XFF09324B),
    );
  }
}
