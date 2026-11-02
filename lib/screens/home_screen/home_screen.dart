import 'package:event_app/provider/userProvider.dart';
import 'package:event_app/screens/home_screen/tabs/home_tab/home_tab.dart';
import 'package:event_app/screens/home_screen/tabs/love_tab/love_tab.dart';
import 'package:event_app/screens/home_screen/tabs/map_tab/map_tab.dart';
import 'package:event_app/screens/home_screen/tabs/profile_tab/profile_tab.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class  HomeScreen extends StatefulWidget {
  const  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex=0;
  int indexOnNaviagtionBar=0;
  @override
  void initState() {
    super.initState();
    Provider.of<Userprovider>(context,listen: false).getUser();
  }
  @override
  Widget build(BuildContext context) {
    List<Widget>tabs=[
      HomeTab(),
      MapTab(),
      LoveTab(),
      ProfileTab()
    ];
    Provider.of<Userprovider>(context,listen: true);

    var userId=(FirebaseAuth.instance.currentUser!.uid);
    return Scaffold(floatingActionButtonLocation:FloatingActionButtonLocation.centerDocked ,
      floatingActionButton: FloatingActionButton(

      onPressed: () {  },
      child: Icon(Icons.add),

    ),
        bottomNavigationBar: BottomNavigationBar(
          onTap: (value) {
            indexOnNaviagtionBar=value;
            if (value == 2) return;
            if(value==3){
              selectedIndex=value-1;
            }
             else if  (value==4) {
              selectedIndex = value - 1;
            }
             else{
               selectedIndex=value;
            }
            setState(() {

            });
             print(selectedIndex);
          },
          currentIndex: indexOnNaviagtionBar,
          backgroundColor: Theme.of(context).colorScheme.primary,

          selectedItemColor: Theme.of(context).colorScheme.onPrimary,
          unselectedItemColor: Theme.of(context).colorScheme.onPrimary,

          selectedLabelStyle: TextStyle(
            color: Theme.of(context).colorScheme.onPrimary,
          ),

          unselectedLabelStyle: TextStyle(
            color: Theme.of(context).colorScheme.onPrimary,
          ),

          items: [
            BottomNavigationBarItem(

              icon: Icon(Icons.home_outlined),
              activeIcon: Icon(Icons.home_filled),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.location_on_outlined),
              activeIcon: Icon(Icons.location_on),
              label: "Map",
            ),
            BottomNavigationBarItem(
              icon: SizedBox(),
              label: " "
            ),

            BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border),
              activeIcon: Icon(Icons.favorite),
              label: "Love",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outlined),
              activeIcon: Icon(Icons.person),
              label: "Profile",
            ),
          ],
        ),
      body: tabs[selectedIndex],

    );
  }
}
