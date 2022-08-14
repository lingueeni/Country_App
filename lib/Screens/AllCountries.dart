// ignore_for_file: file_names

import 'package:contry_app/Screens/Country.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class AllCountries extends StatefulWidget {
  const AllCountries({Key? key}) : super(key: key);

  @override
  State<AllCountries> createState() => _AllCountriesState();
}

class _AllCountriesState extends State<AllCountries> {
  Future<List>? countries;
  bool isSearching = false;

  Future<List> getCountries() async {
    var response = await Dio().get('https://restcountries.com/v2/all');
    return response.data;
  }

  @override
  void initState() {
    countries = getCountries();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 33, 108, 14),
        title: const Text('All Countries'),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: FutureBuilder<List>(
          future: countries, // a previously-obtained Future<String> or null
          builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Country(snapshot.data![index])),
                        );
                      },
                      child: Card(
                        elevation: 50,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 20),
                          child: Text(
                            snapshot.data![index]['name'],
                            style: const TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
                    );
                  });
            }
            return const Text("No widget to build");
          },
        ),
      ),
    );
  }
}
