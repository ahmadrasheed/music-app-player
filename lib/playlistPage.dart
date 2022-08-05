import 'package:flutter/material.dart';

class PlayListPage extends StatelessWidget {
  const PlayListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 10, right: 5, left: 5),
        child: Stack(
          children: [
            Positioned(
                top: 70,
                left: 10,
                child: Icon(
                  Icons.settings,
                  size: 40,
                  color: Colors.brown,
                ))
          ],
        ),
      ),
    );
  }
}
