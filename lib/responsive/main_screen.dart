import 'package:dicoding_project/presentation/home/home_screen.dart';
import 'package:dicoding_project/presentation/home/web_screen.dart';
import 'package:dicoding_project/presentation/login/login_screen.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text("Anime"),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: IconButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (builder) {
                    return const LoginScreen();
                  }));
                },
                icon: Icon(
                  Icons.login,
                )),
          ),
        ],
      ),
      body: LayoutBuilder(builder: (context, constraints) {
        if (constraints.maxWidth <= 600) {
          return const HomeScreen();
        } else if (constraints.maxWidth <= 1200) {
          return WebScreen(gridCount: 2);
        } else {
          return WebScreen(gridCount: 3);
        }
      }),
    );
  }
}
