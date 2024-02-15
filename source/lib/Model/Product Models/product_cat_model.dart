class ProductCatModel {
  ProductCatModel({
    this.id,
    this.count,
    this.description,
    this.link,
    this.name,
    this.slug,
    this.taxonomy,
    this.parent,
    this.meta,
    this.links,
  });

  int? id;
  int? count;
  String? description;
  String? link;
  String? name;
  String? slug;
  String? taxonomy;
  int? parent;
  List<dynamic>? meta;
  Links? links;

  factory ProductCatModel.fromJson(Map<String, dynamic> json) {
    return ProductCatModel(
      id: json["id"],
      count: json["count"],
      description: json["description"],
      link: json["link"],
      name: json["name"],
      slug: json["slug"],
      taxonomy: json["taxonomy"],
      parent: json["parent"],
      meta: json["meta"] == null
          ? []
          : List<dynamic>.from(json["meta"]!?.map((x) => x)),
      links: json["_links"] == null ? null : Links.fromJson(json["_links"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "count": count,
        "description": description,
        "link": link,
        "name": name,
        "slug": slug,
        "taxonomy": taxonomy,
        "parent": parent,
        "meta": meta?.map((x) => x).toList(),
        "_links": links?.toJson(),
      };
}

class Links {
  Links({
    this.self,
    this.collection,
    this.about,
    this.up,
    this.wpPostType,
    this.curies,
  });

  List<About>? self;
  List<About>? collection;
  List<About>? about;
  List<Up>? up;
  List<About>? wpPostType;
  List<Cury>? curies;

  factory Links.fromJson(Map<String, dynamic> json) {
    return Links(
      self: json["self"] == null
          ? []
          : List<About>.from(json["self"]!?.map((x) => About.fromJson(x))),
      collection: json["collection"] == null
          ? []
          : List<About>.from(
              json["collection"]!?.map((x) => About.fromJson(x))),
      about: json["about"] == null
          ? []
          : List<About>.from(json["about"]!?.map((x) => About.fromJson(x))),
      up: json["up"] == null
          ? []
          : List<Up>.from(json["up"]!?.map((x) => Up.fromJson(x))),
      wpPostType: json["wp:post_type"] == null
          ? []
          : List<About>.from(
              json["wp:post_type"]!?.map((x) => About.fromJson(x))),
      curies: json["curies"] == null
          ? []
          : List<Cury>.from(json["curies"]!?.map((x) => Cury.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "self": self?.map((x) => x.toJson()).toList(),
        "collection": collection?.map((x) => x.toJson()).toList(),
        "about": about?.map((x) => x.toJson()).toList(),
        "up": up?.map((x) => x.toJson()).toList(),
        "wp:post_type": wpPostType?.map((x) => x.toJson()).toList(),
        "curies": curies?.map((x) => x.toJson()).toList(),
      };
}

class About {
  About({
    this.href,
  });

  String? href;

  factory About.fromJson(Map<String, dynamic> json) {
    return About(
      href: json["href"],
    );
  }

  Map<String, dynamic> toJson() => {
        "href": href,
      };
}

class Cury {
  Cury({
    this.name,
    this.href,
    this.templated,
  });

  String? name;
  String? href;
  bool? templated;

  factory Cury.fromJson(Map<String, dynamic> json) {
    return Cury(
      name: json["name"],
      href: json["href"],
      templated: json["templated"],
    );
  }

  Map<String, dynamic> toJson() => {
        "name": name,
        "href": href,
        "templated": templated,
      };
}

class Up {
  Up({
    this.embeddable,
    this.href,
  });

  bool? embeddable;
  String? href;

  factory Up.fromJson(Map<String, dynamic> json) {
    return Up(
      embeddable: json["embeddable"],
      href: json["href"],
    );
  }

  Map<String, dynamic> toJson() => {
        "embeddable": embeddable,
        "href": href,
      };
}
