import 'package:flutter/material.dart';
import 'package:tv24africa/PodcastPages/podcastPage.dart';


class FavRadiosPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new RadioPage(isFavouriteOnly: true);
  }
}

