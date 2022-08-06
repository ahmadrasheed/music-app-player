import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:music_player/constants.dart';
import 'package:music_player/controllers/songs.dart';
import 'controllers/songApi.dart';
import 'controllers/songs.dart';
import 'controllers/songs.dart';

class Playlist2 extends StatefulWidget {
  const Playlist2({Key? key}) : super(key: key);

  @override
  State<Playlist2> createState() => _Playlist2State();
}

class _Playlist2State extends State<Playlist2> {
  late Future<List<S>> songs;

  @override
  void initState() {
    songs = ReadJsonData();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: null,
      backgroundColor: HexColor('ffffffff'),
      body: SafeArea(
        child: Container(
            height: height,
            width: double.infinity,
            decoration: BoxDecoration(),
            child: FutureBuilder<List<S>>(
              future: ReadJsonData(),
              builder: (context, data) {
                if (data.hasError) {
                  return Center(child: Text("${data.error}"));
                } else if (data.hasData) {
                  var items = data.data as List<S>;
                  return ListView.builder(
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        print("8888888888888899 $items.length");
                        return SongWidget(items[index].title!,
                            items[index].artist!, items[index].length!);
                      });
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            )),
      ),
    );
  }
}

Widget SongWidget(String songName, String artistName, String songDuration) {
  return Padding(
    padding: const EdgeInsets.only(left: 50, right: 60, top: 30),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          // margin: EdgeInsets.only(
          //     left: 30, top: 100, right: 30, bottom: 50),
          height: 65,
          width: 65,
          decoration: BoxDecoration(
            color: Colors.purple,
            borderRadius: BorderRadius.circular(50),
            boxShadow: [
              BoxShadow(
                color: Colors.black,
                spreadRadius: 2,
                blurRadius: 0.5,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Icon(
            Icons.multitrack_audio,
            color: Colors.white,
            size: 35,
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('$songName',
                style: GoogleFonts.rakkas(
                    textStyle:
                        TextStyle(fontSize: 30, color: HexColor('ff551560')))),
            Text(
              'الفنان: $artistName',
              style: GoogleFonts.jomhuria(
                  textStyle: TextStyle(fontSize: 14, color: Colors.black54)),
            ),
          ],
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          '$songDuration',
          style: TextStyle(color: Colors.black54, fontWeight: FontWeight.bold),
        ),
      ],
    ),
  );
}

/*
Song('ياردلــي', 'منير صبحي', '6:21'),
Song('سعاد ما ماتت', 'محمد فخري', '5:03'),
Song('ليال الموصل', 'محمد فخري', '2:03'),
Song('هوى دجلة', 'محمد فخري', '3:03'),
*/
