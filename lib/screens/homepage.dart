import 'package:flutter/material.dart';
import 'package:technicaltest/utils/shimmer_view.dart';

import '../utils/load_category.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: Drawer(
          child: ListView(
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Column(children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(
                        'https://www.w3schools.com/w3images/avatar2.png'),
                  ),
                  Text('Nyi Nyi Soe', style: TextStyle(fontSize: 20)),
                ]),
              ),
              ListTile(
                title: const Text('Home'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('Categories'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('Languages'),
                onTap: () {
                  _showLanguageOptions(context);
                },
              ),
              ListTile(
                title: const Text('Logout'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
        appBar: AppBar(
          title: const Text('C a t e g o r i e s'),
          backgroundColor: Colors.blue,
          actions: [],
        ),
        body: FutureBuilder(
          future: getCategories(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return ListView.builder(itemBuilder: (context, index) {
                return const ShimmerView();
              })  ;
            } else {
              return Padding(
                padding: const EdgeInsets.all(10),
                child: ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        title: Text(snapshot.data![index].name),
                      ),
                    );
                  },
                ),
              );
            }
          },
        ),
      ),
    );
  }
}

void _showLanguageOptions(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return SafeArea(
        child: Wrap(
          children: <Widget>[
            ListTile(
              leading: const Icon(Icons.language),
              title: const Text('English'),
              onTap: () {
                // Handle language change to English
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.language),
              title: const Text('Español'),
              onTap: () {
                // Handle language change to Spanish
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.language),
              title: const Text('Thai'),
              onTap: () {
                // Handle language change to Spanish
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.language),
              title: const Text('Japanese'),
              onTap: () {
                // Handle language change to Spanish
                Navigator.pop(context);
              },
            ),
            // Add more languages as needed
          ],
        ),
      );
    },
  );
}
