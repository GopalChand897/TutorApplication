import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:testproject/Models/PostModel.dart';

import 'package:testproject/screen/Dashboard.dart';

class Favorites extends StatefulWidget {
  const Favorites({Key? key}) : super(key: key);

  @override
  State<Favorites> createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
           //   backgroundColor: mobileBackgroundColor,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
           //     onPressed: clearImage,
                                 onPressed: () {
    Navigator.pop(context);
    //                                 Navigator.push(
    // context,
    // MaterialPageRoute(builder: (context) =>  Dashboard()));
                    },
              ),
              title: const Text(
                'Favorites',
              ),
              centerTitle: false,
            ),
            // body: Container(
            //   color: Colors.white,
            //   child: Column(
            //     children: [
            //       Expanded(
            //         child: Padding(
            //         padding: EdgeInsets.all(8),
            //         child: _FavoritesPageList(),
            //       )
            //       ),
            //     ],
            //   ),
            // ),
    );
  }
}

class _FavoritesPageList extends StatelessWidget {
  // const _FavoritesPageList({Key? key}) : super(key: key);
// var itemNameStyle = Theme.of(context).textTheme.headline6;
// var favoritepage = context.watch<Post>();

  @override
  Widget build(BuildContext context) {
    // return Container();
// return ListView.builder(
  // itemCount: favoritepage.items.length,
  // itemCount: ,
  // itemBuilder: (context, index) => 
 return ListTile(
    // leading: Image.asset(favoritepage.items[index].image),
    trailing: IconButton(icon: Icon(Icons.delete), 
    onPressed: () {
// favoritepage.items[index].name;
// style: itemNameStyle;
      },
      ),
  );
  // );

  }
}