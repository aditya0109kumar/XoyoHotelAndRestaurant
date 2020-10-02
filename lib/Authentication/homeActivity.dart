import 'package:e_shop/Authentication/authenication.dart';
import 'package:e_shop/Store/Search.dart';
import 'package:e_shop/Widgets/searchBox.dart';
import 'package:flutter/material.dart';
import 'LoginPageOtp.dart';
import 'login.dart';
import '../main_drawer.dart';
import 'register.dart';
import 'package:e_shop/Config/config.dart';

/* class AuthenticScreen extends StatefulWidget {
  @override
  _AuthenticScreenState createState() => _AuthenticScreenState();
}

class _AuthenticScreenState extends State<AuthenticScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    );
  }
}

*/

import 'dart:async';

import 'package:e_shop/main_drawer.dart';
import 'package:flutter/material.dart';

class HomeActivity extends StatefulWidget {
  @override
  _HomeActivityState createState() => _HomeActivityState();
}

class _HomeActivityState extends State<HomeActivity> {
  int _currentIndex = 0;
  PageController pageController = PageController();
  int pageCount = 3;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer.periodic(Duration(seconds: 3), (timer) {
      print("page ${pageController.page}");
      if (pageController.page >= pageCount - 1) {
        pageController.animateToPage(0,
            duration: Duration(microseconds: 1000),
            curve: Curves.fastLinearToSlowEaseIn);
      } else {
        pageController.nextPage(
            duration: Duration(microseconds: 1000),
            curve: Curves.fastLinearToSlowEaseIn);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        backgroundColor: Colors.red,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                showSearch(context: context, delegate: DataSearch());
              })
        ],
      ),
      drawer: MainDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Home'),
              backgroundColor: Colors.white),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              title: Text('Fav'),
              backgroundColor: Colors.white),
          BottomNavigationBarItem(
              icon: Icon(Icons.bookmark),
              title: Text('Booking'),
              backgroundColor: Colors.white),
          BottomNavigationBarItem(
              icon: Icon(Icons.attach_money),
              title: Text('Share & Earn'),
              backgroundColor: Colors.white),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            Route route = MaterialPageRoute(builder: (c) => AuthenticScreen());
              Navigator.pushReplacement(context, route);
          });
        },
      ),
      body: ListView(
        children: [
         // SliverPersistentHeader(pinned: true, delegate: SearchBoxDelegate()),
          LimitedBox(
            maxHeight: 250,
            child: PageView(
              controller: pageController,
              children: [
                AdsSlideCard(
                  slideImage:
                      'https://image.freepik.com/free-photo/hammocks-with-palm-trees_1203-201.jpg',
                ),
                AdsSlideCard(
                  slideImage:
                      'https://image.freepik.com/free-photo/night-city-dusseldorf-hotel-hyatt-germany_146671-4855.jpg',
                ),
                AdsSlideCard(
                  slideImage:
                      'https://image.freepik.com/free-photo/beautiful-luxury-outdoor-swimming-pool-hotel-resort_74190-7433.jpg',
                )
              ],
            ),
          ),
          Container(
            color: Colors.grey[200],
            height: 8,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Trending Card",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: LimitedBox(
              maxHeight: 220,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [TrendingCard1(), TrendingCard2(), TrendingCard3()],
              ),
            ),
          ),
          Container(
            color: Colors.grey[200],
            height: 8,
          ),
          PromoteShopCard(
            images:
                'https://image.freepik.com/free-photo/3d-rendering-modern-luxury-bedroom-suite-night-with-cozy-design_105762-577.jpg',
          ),
          PromoteShopCard(
            images:
                'https://static.dribbble.com/users/1520130/screenshots/10969873/media/dd9dec110bed14329ce31291f682e090.jpg',
          ),
          Container(
            color: Colors.grey[200],
            height: 8,
          )
        ],
      ),
    );
  }
}

class TrendingCard1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Container(
        height: 200,
        width: 200,
        child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              "https://image.freepik.com/free-photo/modern-studio-apartment-design-with-bedroom-living-space_1262-12375.jpg",
              fit: BoxFit.cover,
            )),
      ),
    );
  }
}

class TrendingCard2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Container(
        height: 200,
        width: 200,
        child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              "https://image.freepik.com/free-photo/home-house-exterior-design-showing-tropical-pool-villa-with-sun-bed_41487-564.jpg",
              fit: BoxFit.cover,
            )),
      ),
    );
  }
}
class TrendingCard3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Container(
        height: 200,
        width: 200,
        child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              "https://image.freepik.com/free-photo/interior-modern-comfortable-hotel-room_1232-1822.jpg",
              fit: BoxFit.cover,
            )),
      ),
    );
  }
}
class PromoteShopCard extends StatelessWidget {
  final String images;
  PromoteShopCard({this.images});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.width -
            MediaQuery.of(context).size.width / 2,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.network(
            images,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

class AdsSlideCard extends StatelessWidget {
  final String slideImage;
  AdsSlideCard({this.slideImage});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Container(
          height: 200,
          child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                slideImage,
                fit: BoxFit.cover,
              )),
        ),
      ),
    );
  }
}

class DataSearch extends SearchDelegate<String> {
  final cities = ["lucknow", "Kanpur"];

  final recentCities = ["Lucknow", "Kanpur"];

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = "";
          })
    ];

    // TODO: implement buildActions
    throw UnimplementedError();
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ),
        onPressed: () {
          close(context, null);
        });

    // TODO: implement buildLeading
    throw UnimplementedError();
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty ? recentCities : cities;
    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        leading: Icon(Icons.location_city),
        title: Text(suggestionList[index]),
      ),
      itemCount: suggestionList.length,
    );

    // TODO: implement buildSuggestions
    throw UnimplementedError();
  }
}
