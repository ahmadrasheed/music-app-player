class S {
  String? title;
  String? artist;
  String? length;
  String? iconpath;
  String? filepath;
  String? artext;
  String? entext;

  S(
      {this.title,
      this.artist,
      this.length,
      this.iconpath,
      this.filepath,
      this.artext,
      this.entext});

  S.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    artist = json['artist'];
    length = json['length'];
    iconpath = json['iconpath'];
    filepath = json['filepath'];
    artext = json['artext'];
    entext = json['entext'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['artist'] = this.artist;
    data['length'] = this.length;
    data['iconpath'] = this.iconpath;
    data['filepath'] = this.filepath;
    data['artext'] = this.artext;
    data['entext'] = this.entext;
    return data;
  }
}
