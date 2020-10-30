import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tv24africa/PodcastPages/podcast_now_template.dart';
import 'package:tv24africa/models/radio.dart';
import 'package:tv24africa/services/player_provider.dart';
// import 'package:tv24africa/utilities/hex_color.dart';

import 'now_playing_podcast.dart';


class RadioPage extends StatefulWidget {
  final bool isFavouriteOnly;
  RadioPage({Key key, this.isFavouriteOnly}) : super(key: key);

  @override
  _RadioPageState createState() => _RadioPageState();
}

class _RadioPageState extends State<RadioPage> {
  final _searchQuery = new TextEditingController();
  Timer _debounce;
  AudioPlayer _audioPlayer;

  @override
  void initState() {
    super.initState();
    var playerProvider = Provider.of<PlayerProvider>(context, listen: false);

    playerProvider.initAudioPlugin();    
    playerProvider.resetStreams();
    playerProvider.fetchAllRadios(isFavouriteOnly: this.widget.isFavouriteOnly);

    _searchQuery.addListener(_onSearchChanged);    
  }


  _onSearchChanged() {
    var radiosBloc = Provider.of<PlayerProvider>(context, listen: false);

    if (_debounce?.isActive ?? false) _debounce.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      radiosBloc.fetchAllRadios(
        isFavouriteOnly: this.widget.isFavouriteOnly,
        searchQuery: _searchQuery.text,
      );
    });
  }

  RadioModel radioModel = new RadioModel(
    id: 1,
    radioName: "Test Radio 1",
    radioDesc: "Test Radio Desc",
    radioPic: "http://isharpeners.com/sc_logo.png",
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [/*_appLogo(),*/ /*_searchBar(),*/ _radiosList(), _nowPlaying()],
      ),
    );
  }


  Widget _noData() {
    String noDataTxt = "";
    bool showTextMessage = false;

    if (this.widget.isFavouriteOnly ||
        (this.widget.isFavouriteOnly && _searchQuery.text.isNotEmpty)) {
      noDataTxt = "No Favorites";
      showTextMessage = true;
    } else if (_searchQuery.text.isNotEmpty) {
      noDataTxt = "No Radio Found";
      showTextMessage = true;
    }

    return Column(
      children: [
        new Expanded(
          child: Center(
            child: showTextMessage
                ? new Text(
                    noDataTxt,
                    textScaleFactor: 1,
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                : CircularProgressIndicator(),
          ),
        ),
      ],
    );
  }

  Widget _radiosList() {
    return Consumer<PlayerProvider>(
      builder: (context, radioModel, child) {
        if (radioModel.totalRecords > 0) {
          return new Expanded(
            child: Padding(
              child: ListView(
                children: <Widget>[
                  ListView.separated(
                      itemCount: radioModel.totalRecords,
                      physics: ScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return RadioRowTemplate(
                          radioModel: radioModel.allRadio[index],
                          isFavouriteOnlyRadios: this.widget.isFavouriteOnly,                          
                        );
                      },
                      separatorBuilder: (context, index) {
                        return Divider();
                      })
                ],
              ),
              padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
            ),
          );
        }

        if (radioModel.totalRecords == 0) {
          return new Expanded(
            child: _noData(),
          );
        }

        return CircularProgressIndicator();
      },
    );
  }

  Widget _nowPlaying() {
    var playerProvider = Provider.of<PlayerProvider>(context, listen: true);

    return Visibility(
      visible: playerProvider.getPlayerState() == RadioPlayerState.PLAYING,
      child: NowPlayingTemplate(
        radioTitle: playerProvider.currentRadio.radioName,
        radioImageURL: playerProvider.currentRadio.radioPic,
      ),
    );
  }

  
}
