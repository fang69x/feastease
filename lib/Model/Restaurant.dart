import 'dart:js_interop';
import 'dart:math';

import 'package:collection/collection.dart';
import 'package:feastease/Model/cartItem.dart';
import 'package:feastease/Model/food.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Restaurant extends ChangeNotifier {
  final List<Food> _menu = [
    // burgers
    Food(
      name: 'Classic Cheeseburger',
      description:
          'A juicy chicken patty with melted cheese, tomato, and a hint of onion and pickle',
      imagePath: 'lib/images/bbq_bacon_burger.jpg',
      category: FoodCategory.burgers,
      price: 0.99,
      availableAddons: [
        Addon(name: "Extra Cheese", price: 0.99),
        Addon(name: "Bacon", price: 1.99),
        Addon(name: "Avocado", price: 2.99),
      ],
    ),
    Food(
      name: 'BBQ Bacon Burger',
      description:
          'Grilled chicken patty with BBQ sauce, bacon, cheddar cheese, and crispy onions',
      imagePath: 'lib/images/bbq_bacon_burger.jpg',
      category: FoodCategory.burgers,
      price: 1.99,
      availableAddons: [
        Addon(name: "Extra Bacon", price: 1.99),
        Addon(name: "Onion Rings", price: 0.99),
      ],
    ),
    Food(
      name: 'Veggie Burger',
      description: 'A hearty veggie patty with lettuce, tomato, and vegan mayo',
      imagePath: 'lib/images/veggie_burger.jpg',
      category: FoodCategory.burgers,
      price: 1.49,
      availableAddons: [
        Addon(name: "Guacamole", price: 1.99),
        Addon(name: "Grilled Mushrooms", price: 1.49),
      ],
    ),
    Food(
      name: 'Spicy Chicken Burger',
      description:
          'Spicy chicken patty with pepper jack cheese, jalapenos, and chipotle mayo',
      imagePath: 'lib/images/spicy_chicken_burger.jpg',
      category: FoodCategory.burgers,
      price: 2.49,
      availableAddons: [
        Addon(name: "Extra Jalapenos", price: 0.99),
        Addon(name: "Avocado", price: 2.99),
      ],
    ),
    Food(
      name: 'Mushroom Swiss Burger',
      description:
          'Chicken patty with Swiss cheese, sautéed mushrooms, and garlic aioli',
      imagePath: 'lib/images/mushroom_swiss_burger.jpg',
      category: FoodCategory.burgers,
      price: 2.99,
      availableAddons: [
        Addon(name: "Extra Mushrooms", price: 1.49),
        Addon(name: "Truffle Oil", price: 2.49),
      ],
    ),

    // salads
    Food(
      name: 'Caesar Salad',
      description:
          'Crisp romaine lettuce with Caesar dressing, croutons, and Parmesan cheese',
      imagePath: 'lib/images/caesar_salad.jpg',
      category: FoodCategory.salads,
      price: 1.99,
      availableAddons: [
        Addon(name: "Grilled Chicken", price: 2.99),
        Addon(name: "Extra Croutons", price: 0.99),
      ],
    ),
    Food(
      name: 'Greek Salad',
      description:
          'Mixed greens with olives, feta cheese, tomatoes, cucumbers, and Greek dressing',
      imagePath: 'lib/images/greek_salad.jpg',
      category: FoodCategory.salads,
      price: 2.49,
      availableAddons: [
        Addon(name: "Extra Feta", price: 1.49),
        Addon(name: "Grilled Shrimp", price: 3.99),
      ],
    ),
    Food(
      name: 'Cobb Salad',
      description:
          'Romaine lettuce, avocado, bacon, hard-boiled egg, grilled chicken, and blue cheese dressing',
      imagePath: 'lib/images/cobb_salad.jpg',
      category: FoodCategory.salads,
      price: 2.99,
      availableAddons: [
        Addon(name: "Extra Avocado", price: 1.99),
        Addon(name: "Extra Bacon", price: 1.99),
      ],
    ),
    Food(
      name: 'Asian Chicken Salad',
      description:
          'Mixed greens with grilled chicken, mandarin oranges, almonds, and sesame dressing',
      imagePath: 'lib/images/asian_chicken_salad.jpg',
      category: FoodCategory.salads,
      price: 3.49,
      availableAddons: [
        Addon(name: "Extra Almonds", price: 0.99),
        Addon(name: "Extra Chicken", price: 2.99),
      ],
    ),
    Food(
      name: 'Caprese Salad',
      description: 'Tomatoes, fresh mozzarella, basil, and balsamic glaze',
      imagePath: 'lib/images/caprese_salad.jpg',
      category: FoodCategory.salads,
      price: 3.99,
      availableAddons: [
        Addon(name: "Extra Mozzarella", price: 2.49),
        Addon(name: "Extra Basil", price: 0.99),
      ],
    ),

    // sides
    Food(
      name: 'French Fries',
      description: 'Crispy golden fries',
      imagePath: 'lib/images/french_fries.jpg',
      category: FoodCategory.sides,
      price: 0.99,
      availableAddons: [
        Addon(name: "Cheese Sauce", price: 0.99),
        Addon(name: "Bacon Bits", price: 1.49),
      ],
    ),
    Food(
      name: 'Onion Rings',
      description: 'Crispy battered onion rings',
      imagePath: 'lib/images/onion_rings.jpg',
      category: FoodCategory.sides,
      price: 1.49,
      availableAddons: [
        Addon(name: "Ranch Dip", price: 0.99),
        Addon(name: "BBQ Sauce", price: 0.99),
      ],
    ),
    Food(
      name: 'Sweet Potato Fries',
      description: 'Sweet potato fries with a hint of cinnamon',
      imagePath: 'lib/images/sweet_potato_fries.jpg',
      category: FoodCategory.sides,
      price: 1.99,
      availableAddons: [
        Addon(name: "Honey Dip", price: 0.99),
        Addon(name: "Cinnamon Sugar", price: 0.99),
      ],
    ),
    Food(
      name: 'Mozzarella Sticks',
      description: 'Fried mozzarella cheese sticks',
      imagePath: 'lib/images/mozzarella_sticks.jpg',
      category: FoodCategory.sides,
      price: 2.49,
      availableAddons: [
        Addon(name: "Marinara Sauce", price: 0.99),
        Addon(name: "Ranch Dip", price: 0.99),
      ],
    ),
    Food(
      name: 'Garlic Bread',
      description: 'Toasted garlic bread with herbs',
      imagePath: 'lib/images/garlic_bread.jpg',
      category: FoodCategory.sides,
      price: 2.99,
      availableAddons: [
        Addon(name: "Cheese", price: 0.99),
        Addon(name: "Extra Garlic Butter", price: 0.99),
      ],
    ),

    // desserts
    Food(
      name: 'Chocolate Cake',
      description:
          'Rich and moist chocolate cake with a creamy chocolate frosting',
      imagePath: 'lib/images/chocolate_cake.jpg',
      category: FoodCategory.desserts,
      price: 1.99,
      availableAddons: [
        Addon(name: "Extra Frosting", price: 0.99),
        Addon(name: "Vanilla Ice Cream", price: 1.49),
      ],
    ),
    Food(
      name: 'Cheesecake',
      description:
          'Classic New York style cheesecake with a graham cracker crust',
      imagePath: 'lib/images/cheesecake.jpg',
      category: FoodCategory.desserts,
      price: 2.49,
      availableAddons: [
        Addon(name: "Strawberry Topping", price: 0.99),
        Addon(name: "Whipped Cream", price: 0.99),
      ],
    ),
    Food(
      name: 'Apple Pie',
      description:
          'Traditional apple pie with a flaky crust and spiced apple filling',
      imagePath: 'lib/images/apple_pie.jpg',
      category: FoodCategory.desserts,
      price: 2.99,
      availableAddons: [
        Addon(name: "Vanilla Ice Cream", price: 1.49),
        Addon(name: "Caramel Sauce", price: 0.99),
      ],
    ),
    Food(
      name: 'Brownie Sundae',
      description:
          'Warm brownie topped with vanilla ice cream, chocolate sauce, and whipped cream',
      imagePath: 'lib/images/brownie_sundae.jpg',
      category: FoodCategory.desserts,
      price: 3.49,
      availableAddons: [
        Addon(name: "Extra Brownie", price: 1.99),
        Addon(name: "Sprinkles", price: 0.99),
      ],
    ),
    Food(
      name: 'Tiramisu',
      description:
          'Classic Italian dessert with layers of coffee-soaked ladyfingers and mascarpone cheese',
      imagePath: 'lib/images/tiramisu.jpg',
      category: FoodCategory.desserts,
      price: 3.99,
      availableAddons: [
        Addon(name: "Extra Mascarpone", price: 1.99),
        Addon(name: "Cocoa Powder", price: 0.99),
      ],
    ),

    // drinks
    Food(
      name: 'Cola',
      description: 'Refreshing cola beverage',
      imagePath: 'lib/images/cola.jpg',
      category: FoodCategory.drinks,
      price: 0.99,
      availableAddons: [
        Addon(name: "Lemon Slice", price: 0.49),
        Addon(name: "Ice", price: 0.49),
      ],
    ),
    Food(
      name: 'Lemonade',
      description: 'Freshly squeezed lemonade',
      imagePath: 'lib/images/lemonade.jpg',
      category: FoodCategory.drinks,
      price: 1.49,
      availableAddons: [
        Addon(name: "Mint", price: 0.49),
        Addon(name: "Ice", price: 0.49),
      ],
    ),
    Food(
      name: 'Iced Coffee',
      description: 'Chilled coffee beverage with milk and sugar',
      imagePath: 'lib/images/iced_coffee.jpg',
      category: FoodCategory.drinks,
      price: 1.99,
      availableAddons: [
        Addon(name: "Extra Shot", price: 0.99),
        Addon(name: "Whipped Cream", price: 0.49),
      ],
    ),
    Food(
      name: 'Smoothie',
      description: 'Fruit smoothie with a blend of fresh fruits and yogurt',
      imagePath: 'lib/images/smoothie.jpg',
      category: FoodCategory.drinks,
      price: 2.49,
      availableAddons: [
        Addon(name: "Protein Powder", price: 0.99),
        Addon(name: "Chia Seeds", price: 0.49),
      ],
    ),
    Food(
      name: 'Milkshake',
      description: 'Thick and creamy milkshake in various flavors',
      imagePath: 'lib/images/milkshake.jpg',
      category: FoodCategory.drinks,
      price: 2.99,
      availableAddons: [
        Addon(name: "Whipped Cream", price: 0.49),
        Addon(name: "Cherry", price: 0.49),
      ],
    ),
  ];
  //getters
  List<Food> get menu => _menu;

//OPERATIONS
//user cart
  final List<CartItem> _cart = [];
//add to cart
  void addToCart(Food food, List<Addon> selectedAddons) {
    // see if there is a cart item already with the same food and selected addons
    CartItem? cartItem = _cart.firstWhereOrNull((item) {
      //check if food items are the same
      bool isSameFood = item.food == food;
      //check if the list of selected addons are the same
      bool isSameAddons =
          ListEquality().equals(item.selectedAddons, selectedAddons);
      return isSameFood && isSameAddons;
    });
    //if item already exists , increase it's quantity
    if (cartItem != null) {
      cartItem.quantity++;
    }
    //otherwise, add a new cart item
    else {
      _cart.add(CartItem(food: food, selectedAddons: selectedAddons));
    }
    notifyListeners();
  }

//remove from cart
  void removeFromCart(CartItem cartItem) {
    int cartIndex = _cart.indexOf(cartItem);
    if (cartIndex != -1) {
      if (_cart[cartIndex].quantity > 1) {
        _cart[cartIndex].quantity--;
      } else {
        _cart.removeAt(cartIndex);
      }
    }
    notifyListeners();
  }

//get total price of cart
  double getTotalPrice() {
    double total = 0.0;
    for (CartItem cartItem in _cart) {
      double itemTotal = cartItem.food.price;
      for (Addon addon in cartItem.selectedAddons) {
        itemTotal += addon.price;
      }
      total += itemTotal + cartItem.quantity;
    }
    return total;
  }

// get total number of items in cart
  int getTotalItemCount() {
    int totalItemCount = 0;
    for (CartItem cartItem in _cart) {
      totalItemCount += cartItem.quantity;
    }
    return totalItemCount;
  }

//clear cart
  void clearCart() {
    _cart.clear();
    notifyListeners();
  }
//HELPERS

//generate a receipt

//format double value into money

// format list of addons into a string summary
}
