import 'package:flutter/material.dart';

class Ads extends StatelessWidget {
  const Ads({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Icon(Icons.cancel_outlined, size: 40),
            ),
            SizedBox(
              height: 50,
            ),
            Image.network(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcReHmdvJHekuLCZoM2pq9b_DGrMmPOwke6F5p-nROKSMLiOgn5ef9AYAxg3DZBnFg7qGAE&usqp=CAU',
              width: 400,
              fit: BoxFit.contain,
            ),
          ],
        ),
      ),
    );
  }
}
