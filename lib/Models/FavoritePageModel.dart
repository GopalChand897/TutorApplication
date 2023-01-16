

// import 'package:flutter/cupertino.dart';
// import 'package:testproject/Models/PostModel.dart';

// class FavoritePageModel extends ChangeNotifier{
//  late Post _favoritelist;
 
//  final List<int> _itemIds = [];

//  Post get favoritelist => _favoritelist;

//  set favoritelist(Post newList){
//   _favoritelist = newList;

//   notifyListeners();
//  }

// // List<Item> get items =>
// // _itemIds.map((uid) => _favoritelist.getUserModelById(uid)).toList();


// }

// provider/movie_provider.dart
import 'package:flutter/material.dart';
import 'package:testproject/Models/PostModel.dart';
import 'dart:math';

// A list of movies
final List<Post> initialData = List.generate(
    50,
    (index) => Post(
        name: "Moview $index",
        description: "${Random().nextInt(100) + 60} minutes",
         datePublished: DateTime.now(), 
         selectedValue: '', uid: ''
        ));

class PostProvider with ChangeNotifier {
  // All movies (that will be displayed on the Home screen)
  final List<Post> _posts = initialData;
  
  // Retrieve all movies
  List<Post> get posts => _posts;

  // Favorite movies (that will be shown on the MyList screen)
  final List<Post> _myList = [];

  // Retrieve favorite movies
  List<Post> get myList => _myList;

  // Adding a movie to the favorites list
  void addToList(Post post) {
    _myList.add(post);
    notifyListeners();
  }

  // Removing a movie from the favorites list
  void removeFromList(Post post) {
    _myList.remove(post);
    notifyListeners();
  }
}