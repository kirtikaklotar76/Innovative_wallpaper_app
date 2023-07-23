import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controllers/api_provider.dart';
import '../../modals/my_routes.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Innovative wallpapers",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Color(0XFF0A324B),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Consumer<ApiControllers>(
          builder: (context, provider, _) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  onSubmitted: (val) {
                    provider.search(val: val);
                    print("data : $val");
                  },
                  decoration: InputDecoration(
                    hintText: "search wallpapers",
                    hintStyle: const TextStyle(color: Colors.grey),
                    suffixIcon: const Icon(Icons.search, color: Colors.grey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Expanded(
                  child: GridView.builder(
                    itemCount: provider.data.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed(
                            MyRoutes.WallPaperDetailedPage,
                            arguments: provider.data[index],
                          );
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Container(
                            color: Colors.white,
                            child: Image.network(
                              provider.data[index]['largeImageURL'],
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      );
                    },
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 5,
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
      backgroundColor: Color(0XFF09324B),
    );
  }
}
