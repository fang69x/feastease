import 'package:feastease/components/drawer.dart';
import 'package:feastease/components/my_current_location.dart';
import 'package:feastease/components/my_description_box.dart';
import 'package:feastease/components/my_silver_app_bar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      body: NestedScrollView(
          headerSliverBuilder: (context, ineerboxIsScrolled) => [
                MySilverAppBar(
                    title: Text('title'),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Divider(
                          indent: 25,
                          endIndent: 25,
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                        // my current location
                        MyCurrentLocation(),

                        // description box
                        MyDescriptionBox(),
                      ],
                    )),
              ],
          body: Container(
            color: Colors.blue,
          )),
    );
  }
}
