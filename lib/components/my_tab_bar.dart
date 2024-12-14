import 'package:feastease/Model/food.dart';
import 'package:flutter/material.dart';

class MyTabBar extends StatelessWidget {
  final TabController tabController;

  const MyTabBar({super.key, required this.tabController});

  // A method to build your category tabs with icons
  List<Tab> _buildCategoryTabs() {
    return FoodCategory.values.map((category) {
      return Tab(
        icon: Icon(
          Icons.fastfood, // You can change this to a category-specific icon
          color: Colors.orange,
        ),
        text: category.toString().split('.').last,
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black, // Black background for the TabBar
        borderRadius: BorderRadius.circular(16), // Rounded corners (optional)
      ),
      child: TabBar(
        controller: tabController,
        tabs: _buildCategoryTabs(),
        labelColor: Colors.orange, // Active tab text color
        unselectedLabelColor: Colors.white, // Inactive tab text color
        indicatorColor: Colors.orange, // Orange indicator for the selected tab
        indicatorWeight: 3.0, // Thicker indicator line
        indicatorPadding:
            EdgeInsets.symmetric(horizontal: 8.0), // Padding for indicator
      ),
    );
  }
}
