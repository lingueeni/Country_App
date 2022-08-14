// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter_svg/flutter_svg.dart';

// ignore: must_be_immutable, use_key_in_widget_constructors
class Country extends StatelessWidget {
  final Map country;
  // ignore: use_key_in_widget_constructors
  const Country(this.country);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 204, 153, 222),
        title: Text(country['name']),
      ),
      body: Container(
        padding: const EdgeInsets.all(5),
        child: GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          children: <Widget>[
            FlipCard(
              direction: FlipDirection.VERTICAL,
              front: const CountryCard(
                title: 'Capital',
                colour: Color.fromARGB(255, 243, 187, 33),
              ),
              back: BackCard(
                title: country['capital'],
                colour: const Color.fromARGB(255, 53, 48, 32),
              ),
            ),
            FlipCard(
              direction: FlipDirection.HORIZONTAL,
              front: const CountryCard(
                title: 'Population',
                colour: Color.fromARGB(255, 66, 64, 165),
              ),
              back: BackCard(
                title: country['population'].toString(),
                colour: const Color.fromARGB(255, 23, 17, 58),
              ),
            ),
            FlipCard(
              direction: FlipDirection.VERTICAL,
              front: const CountryCard(
                title: 'Flag',
                colour: Color.fromARGB(255, 73, 219, 134),
              ),
              back: Card(
                elevation: 10,
                color: const Color.fromARGB(255, 255, 255, 255),
                child: Center(
                    child: SvgPicture.network(
                      country['flag'],
                      width: 200,
                    )),
              ),
            ),
            FlipCard(
              direction: FlipDirection.HORIZONTAL,
              front: const CountryCard(
                title: 'Currency',
                colour: Color.fromARGB(255, 179, 114, 88),
              ),
              back: BackCard(
                title: country['currencies'][0]['name'],
                colour: const Color.fromARGB(255, 136, 50, 24),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CountryCard extends StatelessWidget {
  final String title;
  // ignore: prefer_typing_uninitialized_variables
  final colour;
  const CountryCard({Key? key, required this.title, required this.colour})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 30,
      color: colour,
      child: Center(
          child: Text(
            title,
            style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          )),
    );
  }
}

class BackCard extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final colour;
  final String title;
  const BackCard({Key? key, required this.title, required this.colour})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      color: colour,
      child: Center(
          child: Text(
            title,
            style: const TextStyle(color: Colors.white, fontSize: 25),
          )),
    );
  }
}
