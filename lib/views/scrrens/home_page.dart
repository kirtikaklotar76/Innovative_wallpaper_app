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
        title: const Text("Api Page"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Consumer<ApiControllers>(
          builder: (context, provider, _) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                decoration: InputDecoration(border: OutlineInputBorder()),
                onFieldSubmitted: (val) {
                  APiHelper.apiHelper.getId(num: int.parse(val));
                  Provider.of<ApiControllers>(context, listen: false).getData();
                  setState(() {});
                },
              ),
              provider.post != null
                  ? Center(
                      child: ListTile(
                        title: Text(provider.post!.title),
                        leading: Text(provider.post!.id.toString()),
                      ),
                    )
                  : CircularProgressIndicator(),
            ],
          ),
        ),
      ),
    );
  }
}
