import 'package:feastease/components/drawer.dart';
import 'package:feastease/components/my_current_location.dart';
import 'package:feastease/components/my_description_box.dart';
import 'package:feastease/components/my_silver_app_bar.dart';
import 'package:feastease/components/my_tab_bar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        drawer: MyDrawer(),
        body: NestedScrollView(
            headerSliverBuilder: (context, ineerboxIsScrolled) => [
                  MySilverAppBar(
                      title: MyTabBar(tabController: _tabController),
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
            body: TabBarView(controller: _tabController, children: [
              ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) => Text("first tab")),
              ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) => Text("second tab")),
              ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) => Text("third tab")),
            ])));
  }
}
