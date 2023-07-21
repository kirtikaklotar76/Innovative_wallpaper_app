import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controllers/api_provider.dart';
import '../../controllers/helpers/api_helper.dart';

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
        title: const Text("Innovative wallpapers"),
        centerTitle: true,
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
                    suffixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Expanded(
                  child: GridView.builder(
                    itemCount: provider.data.length,
                    itemBuilder: (context, index) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.network(
                          provider.data[index]['largeImageURL'],
                          fit: BoxFit.cover,
                        ),
                      );
                    },
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
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
    );
  }
}
