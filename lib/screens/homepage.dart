import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:technicaltest/screens/product_list_page.dart';
import 'package:technicaltest/utils/language_provider.dart';
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
                  Expanded(
                      child:
                          Text('Nyi Nyi Soe', style: TextStyle(fontSize: 20))),
                ]),
              ),
              ListTile(
                leading: const Icon(Icons.category_outlined),
                title: Text(AppLocalizations.of(context)!.categories),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.add_shopping_cart_outlined),
                title: Text(AppLocalizations.of(context)!.cart),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.language_outlined),
                title: Text(AppLocalizations.of(context)!.language),
                onTap: () {
                  _showLanguageOptions(context);
                },
              ),
            ],
          ),
        ),
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.categories),
          backgroundColor: Colors.blue,
          actions: [],
        ),
        body: FutureBuilder(
          future: getCategories(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return ListView.builder(itemBuilder: (context, index) {
                return const ShimmerView();
              });
            } else {
              return Padding(
                padding: const EdgeInsets.all(10),
                child: ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      splashColor: Colors.blue.withAlpha(30),
                      highlightColor: Colors.blue.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(10),
                      onTap: () {
                        // Handle category selection
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return ProductListPage(
                            categoryName: snapshot.data![index].name,
                            url: snapshot.data![index].url,
                          );
                        }));
                      },
                      child: Card(
                        child: ListTile(
                          title: Text(snapshot.data![index].name),
                        ),
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
      return SafeArea(child: Consumer(
        builder: (context, ref, child) {
          final language = ref.read(languageProvider.notifier);
          return Wrap(
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.language),
                title: const Text('English'),
                onTap: () {
                  // Handle language change to English
                  language.state = 'en';
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.language),
                title: const Text('Español'),
                onTap: () {
                  // Handle language change to Spanish
                  language.state = 'es';
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.language),
                title: const Text('Thai'),
                onTap: () {
                  // Handle language change to Spanish
                  language.state = 'th';
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.language),
                title: const Text('Japanese'),
                onTap: () {
                  // Handle language change to Spanish
                  language.state = 'ja';
                  Navigator.pop(context);
                },
              ),
              // Add more languages as needed
            ],
          );
        },
      ));
    },
  );
}
