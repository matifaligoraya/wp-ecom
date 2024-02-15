class ImageGettingModel {
  int? id;
  String? date;
  String? dateGmt;
  String? slug;
  String? link;
  Guid? title;
  Guid? guid;
  int? author;
  String? sourceUrl;

  ImageGettingModel({
    this.id,
    this.date,
    this.dateGmt,
    this.slug,
    this.link,
    this.title,
    this.author,
    this.guid,
    this.sourceUrl,
  });

  ImageGettingModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    date = json['date'];
    dateGmt = json['date_gmt'];
    guid = json['guid'] != null ? Guid.fromJson(json['guid']) : null;
    slug = json['slug'];
    link = json['link'];
    title = json['title'] != null ? Guid.fromJson(json['title']) : null;
    author = json['author'];
    sourceUrl = json['source_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['date'] = date;
    data['date_gmt'] = dateGmt;
    if (guid != null) {
      data['guid'] = guid!.toJson();
    }
    data['slug'] = slug;
    data['link'] = link;
    if (title != null) {
      data['title'] = title!.toJson();
    }
    data['author'] = author;
    data['source_url'] = sourceUrl;
    return data;
  }
}

class Guid {
  String? rendered;

  Guid({this.rendered});

  Guid.fromJson(Map<String, dynamic> json) {
    rendered = json['rendered'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['rendered'] = rendered;
    return data;
  }
}
