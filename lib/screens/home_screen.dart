import 'package:flutter/material.dart';
import '../widgets/widget.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('Peliculas en Cines')),
          elevation: 0,
          actions: [
            IconButton(
                onPressed: () {}, icon: const Icon(Icons.search_outlined))
          ],
        ),

        ///Permite hacer Scroll
        body: SingleChildScrollView(
          child: Column(children: [
            CardSwiper(),
            MovieSlider(),
          ]),
        ));
  }
}
