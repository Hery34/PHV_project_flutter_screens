import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_proxigo_v1/screens/profile.dart';
import '../screens/home.dart';

// Define a BottomNavigationBloc class that extends Bloc<void, List<String>>
class BottomNavigationBloc extends Bloc<void, List<String>> {
  // Constructor for BottomNavigationBloc, initializing the state to a list of strings
  BottomNavigationBloc()
      : super(const ['Accueil', 'Profil', 'Historique', 'FAQ']);

  // Define a method to update the page based on the given page and context
  void updatePage(String page, BuildContext context) {
    // Check if the page is "Accueil" and navigate to the Home screen using MaterialPageRoute
    if (page == 'Accueil') {
      final route = MaterialPageRoute(builder: (context) => Home());
      Navigator.of(context).push(route);
    }
    // Check if the page is "Profil" and navigate to the Profile screen using MaterialPageRoute
    else if (page == 'Profil') {
      final route = MaterialPageRoute(builder: (context) => Profile());
      Navigator.of(context).push(route);
      // } else if (page == 'Historique') {
      //   final route = MaterialPageRoute(builder: (context) => History());
      //   Navigator.of(context).push(route);
      // } else if (page == 'FAQ') {
      //   final route = MaterialPageRoute(builder: (context) => FAQ());
      //   Navigator.of(context).push(route);
    }
  }
}
