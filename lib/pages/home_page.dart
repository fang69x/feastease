import 'package:feastease/Model/Restaurant.dart';
import 'package:feastease/Model/cartItem.dart';
import 'package:feastease/Model/food.dart';
import 'package:feastease/components/drawer.dart';
import 'package:feastease/components/myFoodTile.dart';
import 'package:feastease/components/my_current_location.dart';
import 'package:feastease/components/my_description_box.dart';
import 'package:feastease/components/my_silver_app_bar.dart';
import 'package:feastease/components/my_tab_bar.dart';
import 'package:feastease/pages/cartpage.dart';
import 'package:feastease/pages/food_page.dart';
import 'package:feastease/pages/profile_page.dart';
import 'package:feastease/pages/search_page.dart';
import 'package:flutter/material.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _currentIndex = 0;

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
      backgroundColor: Colors.black, // Set the background color to black
      drawer: const MyDrawer(),
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
                const MyCurrentLocation(),
                const SizedBox(height: 10), // Add spacing
                // Description box
                const MyDescriptionBox(),
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
      bottomNavigationBar: BottomNavyBar(
        backgroundColor: Colors.black, // Black background for the bottom bar
        selectedIndex: _currentIndex,
        showElevation: true, // Add shadow effect for elevation
        itemCornerRadius: 30,
        onItemSelected: (index) {
          setState(() {
            _currentIndex = index;
          });
          // Navigate to different pages based on the selected index
          if (index == 0) {
            // Navigate to Home
          } else if (index == 1) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const SearchPage()));
          } else if (index == 2) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const CartPage()));
          } else if (index == 3) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const ProfilePage()));
          }
        },
        items: [
          BottomNavyBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
            activeColor: Colors.orange, // Orange color when selected
            inactiveColor: Colors.white, // White color when not selected
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.search),
            title: Text('Search'),
            activeColor: Colors.orange,
            inactiveColor: Colors.white,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.shopping_cart),
            title: Text('Cart'),
            activeColor: Colors.orange,
            inactiveColor: Colors.white,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.account_circle),
            title: Text('Profile'),
            activeColor: Colors.orange,
            inactiveColor: Colors.white,
          ),
        ],
      ),
    );
  }
}
