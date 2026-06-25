import 'package:flutter/material.dart';

class AppProvider extends ChangeNotifier {
  // Add state management for favorites, notifications, etc.
  List<String> favorites = [];

  void toggleFavorite(String activityId) {
    if (favorites.contains(activityId)) {
      favorites.remove(activityId);
    } else {
      favorites.add(activityId);
    }
    notifyListeners();
  }
}
