import 'package:feastease/Model/Restaurant.dart';
import 'package:feastease/Model/food.dart';
import 'package:feastease/components/drawer.dart';
import 'package:feastease/components/myFoodTile.dart';
import 'package:feastease/components/my_current_location.dart';
import 'package:feastease/components/my_description_box.dart';
import 'package:feastease/components/my_silver_app_bar.dart';
import 'package:feastease/components/my_tab_bar.dart';
import 'package:feastease/pages/food_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    _tabController =
        TabController(length: FoodCategory.values.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  // Sort out and return a list of food items that belong to a specific category
  List<Food> _filterMenuByCategory(FoodCategory category, List<Food> fullMenu) {
    return fullMenu.where((food) => food.category == category).toList();
  }

  // Return list of foods in given category
  List<Widget> getFoodInThisCategory(List<Food> fullMenu) {
    return FoodCategory.values.map((category) {
      List<Food> categoryMenu = _filterMenuByCategory(category, fullMenu);

      return ListView.builder(
        itemCount: categoryMenu.length,
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          final food = categoryMenu[index];
          return FoodTile(
            food: food,
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => FoodPage(
                  food: food,
                ),
              ),
            ),
          );
        },
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      drawer: MyDrawer(),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          MySilverAppBar(
            title: MyTabBar(tabController: _tabController),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Divider(
                  indent: 25,
                  endIndent: 25,
                  color: theme.colorScheme.secondary,
                ),
                // My current location
                MyCurrentLocation(),
                const SizedBox(height: 10), // Add spacing
                // Description box
                MyDescriptionBox(),
              ],
            ),
          ),
        ],
        body: Consumer<Restaurant>(
          builder: (context, restaurant, child) {
            return TabBarView(
              controller: _tabController,
              children: getFoodInThisCategory(restaurant.menu),
            );
          },
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: theme.colorScheme.secondary,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: BottomAppBar(
          color: theme.colorScheme.secondary,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: Icon(Icons.home, color: theme.colorScheme.onSecondary),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.search, color: theme.colorScheme.onSecondary),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.shopping_cart,
                    color: theme.colorScheme.onSecondary),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.account_circle,
                    color: theme.colorScheme.onSecondary),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
