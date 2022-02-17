import 'package:bloc_test/Pages/PostList.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Bloc Test")),
      body: Container(
        child: Center(
          child: ElevatedButton(
            child: Text("Posts"),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PostList()),
              );
            },
          ),
        ),
      ),
    );
  }
}
