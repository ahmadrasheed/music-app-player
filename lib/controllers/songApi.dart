import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:music_player/controllers/songs.dart';

Future<List<S>> ReadJsonData() async {
  final jsondata = await rootBundle.loadString('assets/songs.json');
  final list = json.decode(jsondata) as List<dynamic>;
  print("88888888 from ReadjsonData func");
  return list.map((e) => S.fromJson(e)).toList();
}
