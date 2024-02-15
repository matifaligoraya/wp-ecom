class Product {
  int? id;
  String? date;
  String? dateGmt;
  Guid? guid;
  String? modified;
  String? modifiedGmt;
  String? slug;
  String? status;
  String? type;
  String? link;
  Guid? title;
  Content? content;
  Content? excerpt;
  int? featuredMedia;
  String? commentStatus;
  String? pingStatus;
  String? template;
  List<int>? productCat;
  List<int>? productTag;
  Links? lLinks;

  Product({
    this.id,
    this.date,
    this.dateGmt,
    this.guid,
    this.modified,
    this.modifiedGmt,
    this.slug,
    this.status,
    this.type,
    this.link,
    this.title,
    this.content,
    this.excerpt,
    this.featuredMedia,
    this.commentStatus,
    this.pingStatus,
    this.template,
    this.productCat,
    this.productTag,
    this.lLinks,
  });

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    date = json['date'];
    dateGmt = json['date_gmt'];
    guid = json['guid'] != null ? Guid.fromJson(json['guid']) : null;
    modified = json['modified'];
    modifiedGmt = json['modified_gmt'];
    slug = json['slug'];
    status = json['status'];
    type = json['type'];
    link = json['link'];
    title = json['title'] != null ? Guid.fromJson(json['title']) : null;
    content = json['content'] != null ? Content.fromJson(json['content']) : null;
    excerpt = json['excerpt'] != null ? Content.fromJson(json['excerpt']) : null;
    featuredMedia = json['featured_media'];
    commentStatus = json['comment_status'];
    pingStatus = json['ping_status'];
    template = json['template'];
    productCat = json['product_cat'] != null ? List<int>.from(json['product_cat']) : [];
    productTag = json['product_tag'] != null ? List<int>.from(json['product_tag']) : [];
    lLinks = json['_links'] != null ? Links.fromJson(json['_links']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['date'] = date;
    data['date_gmt'] = dateGmt;
    if (guid != null) {
      data['guid'] = guid!.toJson();
    }
    data['modified'] = modified;
    data['modified_gmt'] = modifiedGmt;
    data['slug'] = slug;
    data['status'] = status;
    data['type'] = type;
    data['link'] = link;
    if (title != null) {
      data['title'] = title!.toJson();
    }
    if (content != null) {
      data['content'] = content!.toJson();
    }
    if (excerpt != null) {
      data['excerpt'] = excerpt!.toJson();
    }
    data['featured_media'] = featuredMedia;
    data['comment_status'] = commentStatus;
    data['ping_status'] = pingStatus;
    data['template'] = template;
    data['product_cat'] = productCat;
    data['product_tag'] = productTag;
    if (lLinks != null) {
      data['_links'] = lLinks!.toJson();
    }
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

class Content {
  String? rendered;
  bool? protected;

  Content({this.rendered, this.protected});

  Content.fromJson(Map<String, dynamic> json) {
    rendered = json['rendered'];
    protected = json['protected'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['rendered'] = rendered;
    data['protected'] = protected;
    return data;
  }
}

class Links {
  List<Self>? self;
  List<Collection>? collection;
  List<About>? about;
  List<Replies>? replies;
  List<WpFeaturedmedia>? wpFeaturedmedia;
  List<WpAttachment>? wpAttachment;
  List<WpTerm>? wpTerm;
  List<Curies>? curies;

  Links({
    this.self,
    this.collection,
    this.about,
    this.replies,
    this.wpFeaturedmedia,
    this.wpAttachment,
    this.wpTerm,
    this.curies,
  });

  Links.fromJson(Map<String, dynamic> json) {
    self = json['self'] != null ? List<Self>.from(json['self'].map((v) => Self.fromJson(v))) : [];
    collection = json['collection'] != null ? List<Collection>.from(json['collection'].map((v) => Collection.fromJson(v))) : [];
    about = json['about'] != null ? List<About>.from(json['about'].map((v) => About.fromJson(v))) : [];
    replies = json['replies'] != null ? List<Replies>.from(json['replies'].map((v) => Replies.fromJson(v))) : [];
    wpFeaturedmedia = json['wp:featuredmedia'] != null ? List<WpFeaturedmedia>.from(json['wp:featuredmedia'].map((v) => WpFeaturedmedia.fromJson(v))) : [];
    wpAttachment = json['wp:attachment'] != null ? List<WpAttachment>.from(json['wp:attachment'].map((v) => WpAttachment.fromJson(v))) : [];
    wpTerm = json['wp:term'] != null ? List<WpTerm>.from(json['wp:term'].map((v) => WpTerm.fromJson(v))) : [];
    curies = json['curies'] != null ? List<Curies>.from(json['curies'].map((v) => Curies.fromJson(v))) : [];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (self != null) {
      data['self'] = self!.map((v) => v.toJson()).toList();
    }
    if (collection != null) {
      data['collection'] = collection!.map((v) => v.toJson()).toList();
    }
    if (about != null) {
      data['about'] = about!.map((v) => v.toJson()).toList();
    }
    if (replies != null) {
      data['replies'] = replies!.map((v) => v.toJson()).toList();
    }
    if (wpFeaturedmedia != null) {
      data['wp:featuredmedia'] = wpFeaturedmedia!.map((v) => v.toJson()).toList();
    }
    if (wpAttachment != null) {
      data['wp:attachment'] = wpAttachment!.map((v) => v.toJson()).toList();
    }
    if (wpTerm != null) {
      data['wp:term'] = wpTerm!.map((v) => v.toJson()).toList();
    }
    if (curies != null) {
      data['curies'] = curies!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Self {
  String? href;

  Self({this.href});

  Self.fromJson(Map<String, dynamic> json) {
    href = json['href'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['href'] = href;
    return data;
  }
}

class Collection {
  String? href;

  Collection({this.href});

  Collection.fromJson(Map<String, dynamic> json) {
    href = json['href'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['href'] = href;
    return data;
  }
}

class About {
  String? href;

  About({this.href});

  About.fromJson(Map<String, dynamic> json) {
    href = json['href'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['href'] = href;
    return data;
  }
}

class Replies {
  bool? embeddable;
  String? href;

  Replies({this.embeddable, this.href});

  Replies.fromJson(Map<String, dynamic> json) {
    embeddable = json['embeddable'];
    href = json['href'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['embeddable'] = embeddable;
    data['href'] = href;
    return data;
  }
}

class WpFeaturedmedia {
  bool? embeddable;
  String? href;

  WpFeaturedmedia({this.embeddable, this.href});

  WpFeaturedmedia.fromJson(Map<String, dynamic> json) {
    embeddable = json['embeddable'];
    href = json['href'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['embeddable'] = embeddable;
    data['href'] = href;
    return data;
  }
}

class WpAttachment {
  String? href;

  WpAttachment({this.href});

  WpAttachment.fromJson(Map<String, dynamic> json) {
    href = json['href'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['href'] = href;
    return data;
  }
}

class WpTerm {
  String? taxonomy;
  bool? embeddable;
  String? href;

  WpTerm({this.taxonomy, this.embeddable, this.href});

  WpTerm.fromJson(Map<String, dynamic> json) {
    taxonomy = json['taxonomy'];
    embeddable = json['embeddable'];
    href = json['href'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['taxonomy'] = taxonomy;
    data['embeddable'] = embeddable;
    data['href'] = href;
    return data;
  }
}

class Curies {
  String? name;
  String? href;
  bool? templated;

  Curies({this.name, this.href, this.templated});

  Curies.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    href = json['href'];
    templated = json['templated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['href'] = href;
    data['templated'] = templated;
    return data;
  }
}
