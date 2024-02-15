class ProductImageModel {
  ProductImageModel({
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
    this.author,
    this.commentStatus,
    this.pingStatus,
    this.template,
    this.meta,
    this.description,
    this.caption,
    this.altText,
    this.mediaType,
    this.mimeType,
    this.mediaDetails,
    this.post,
    this.sourceUrl,
    this.links,
  });

  int? id;
  DateTime? date;
  DateTime? dateGmt;
  Caption? guid;
  DateTime? modified;
  DateTime? modifiedGmt;
  String? slug;
  String? status;
  String? type;
  String? link;
  Caption? title;
  int? author;
  String? commentStatus;
  String? pingStatus;
  String? template;
  List<dynamic>? meta;
  Caption? description;
  Caption? caption;
  String? altText;
  String? mediaType;
  String? mimeType;
  MediaDetails? mediaDetails;
  int? post;
  String? sourceUrl;
  Links? links;

  factory ProductImageModel.fromJson(Map<String, dynamic> json) {
    return ProductImageModel(
      id: json["id"],
      date: DateTime.tryParse(json["date"] ?? ""),
      dateGmt: DateTime.tryParse(json["date_gmt"] ?? ""),
      guid: json["guid"] == null ? null : Caption.fromJson(json["guid"]),
      modified: DateTime.tryParse(json["modified"] ?? ""),
      modifiedGmt: DateTime.tryParse(json["modified_gmt"] ?? ""),
      slug: json["slug"],
      status: json["status"],
      type: json["type"],
      link: json["link"],
      title: json["title"] == null ? null : Caption.fromJson(json["title"]),
      author: json["author"],
      commentStatus: json["comment_status"],
      pingStatus: json["ping_status"],
      template: json["template"],
      meta: json["meta"] == null
          ? []
          : List<dynamic>.from(json["meta"]!.map((x) => x)),
      description: json["description"] == null
          ? null
          : Caption.fromJson(json["description"]),
      caption:
          json["caption"] == null ? null : Caption.fromJson(json["caption"]),
      altText: json["alt_text"],
      mediaType: json["media_type"],
      mimeType: json["mime_type"],
      mediaDetails: json["media_details"] == null
          ? null
          : MediaDetails.fromJson(json["media_details"]),
      post: json["post"],
      sourceUrl: json["source_url"],
      links: json["_links"] == null ? null : Links.fromJson(json["_links"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "date": date?.toIso8601String(),
        "date_gmt": dateGmt?.toIso8601String(),
        "guid": guid?.toJson(),
        "modified": modified?.toIso8601String(),
        "modified_gmt": modifiedGmt?.toIso8601String(),
        "slug": slug,
        "status": status,
        "type": type,
        "link": link,
        "title": title?.toJson(),
        "author": author,
        "comment_status": commentStatus,
        "ping_status": pingStatus,
        "template": template,
        "meta": meta?.map((x) => x).toList(),
        "description": description?.toJson(),
        "caption": caption?.toJson(),
        "alt_text": altText,
        "media_type": mediaType,
        "mime_type": mimeType,
        "media_details": mediaDetails?.toJson(),
        "post": post,
        "source_url": sourceUrl,
        "_links": links?.toJson(),
      };
}

class Caption {
  Caption({
    this.rendered,
  });

  String? rendered;

  factory Caption.fromJson(Map<String, dynamic> json) {
    return Caption(
      rendered: json["rendered"],
    );
  }

  Map<String, dynamic> toJson() => {
        "rendered": rendered,
      };
}

class Links {
  Links({
    this.self,
    this.collection,
    this.about,
    this.author,
    this.replies,
  });

  List<About>? self;
  List<About>? collection;
  List<About>? about;
  List<Author>? author;
  List<Author>? replies;

  factory Links.fromJson(Map<String, dynamic> json) {
    return Links(
      self: json["self"] == null
          ? []
          : List<About>.from(json["self"]!.map((x) => About.fromJson(x))),
      collection: json["collection"] == null
          ? []
          : List<About>.from(json["collection"]!.map((x) => About.fromJson(x))),
      about: json["about"] == null
          ? []
          : List<About>.from(json["about"]!.map((x) => About.fromJson(x))),
      author: json["author"] == null
          ? []
          : List<Author>.from(json["author"]!.map((x) => Author.fromJson(x))),
      replies: json["replies"] == null
          ? []
          : List<Author>.from(json["replies"]!.map((x) => Author.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "self": self?.map((x) => x.toJson()).toList(),
        "collection": collection?.map((x) => x.toJson()).toList(),
        "about": about?.map((x) => x.toJson()).toList(),
        "author": author?.map((x) => x.toJson()).toList(),
        "replies": replies?.map((x) => x.toJson()).toList(),
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

class Author {
  Author({
    this.embeddable,
    this.href,
  });

  bool? embeddable;
  String? href;

  factory Author.fromJson(Map<String, dynamic> json) {
    return Author(
      embeddable: json["embeddable"],
      href: json["href"],
    );
  }

  Map<String, dynamic> toJson() => {
        "embeddable": embeddable,
        "href": href,
      };
}

class MediaDetails {
  MediaDetails({
    this.width,
    this.height,
    this.file,
    this.filesize,
    this.sizes,
    this.imageMeta,
  });

  int? width;
  int? height;
  String? file;
  int? filesize;
  Sizes? sizes;
  ImageMeta? imageMeta;

  factory MediaDetails.fromJson(Map<String, dynamic> json) {
    return MediaDetails(
      width: json["width"],
      height: json["height"],
      file: json["file"],
      filesize: json["filesize"],
      sizes: json["sizes"] == null ? null : Sizes.fromJson(json["sizes"]),
      imageMeta: json["image_meta"] == null
          ? null
          : ImageMeta.fromJson(json["image_meta"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "width": width,
        "height": height,
        "file": file,
        "filesize": filesize,
        "sizes": sizes?.toJson(),
        "image_meta": imageMeta?.toJson(),
      };
}

class ImageMeta {
  ImageMeta({
    this.aperture,
    this.credit,
    this.camera,
    this.caption,
    this.createdTimestamp,
    this.copyright,
    this.focalLength,
    this.iso,
    this.shutterSpeed,
    this.title,
    this.orientation,
    this.keywords,
  });

  String? aperture;
  String? credit;
  String? camera;
  String? caption;
  String? createdTimestamp;
  String? copyright;
  String? focalLength;
  String? iso;
  String? shutterSpeed;
  String? title;
  String? orientation;
  List<dynamic>? keywords;

  factory ImageMeta.fromJson(Map<String, dynamic> json) {
    return ImageMeta(
      aperture: json["aperture"],
      credit: json["credit"],
      camera: json["camera"],
      caption: json["caption"],
      createdTimestamp: json["created_timestamp"],
      copyright: json["copyright"],
      focalLength: json["focal_length"],
      iso: json["iso"],
      shutterSpeed: json["shutter_speed"],
      title: json["title"],
      orientation: json["orientation"],
      keywords: json["keywords"] == null
          ? []
          : List<dynamic>.from(json["keywords"]!.map((x) => x)),
    );
  }

  Map<String, dynamic> toJson() => {
        "aperture": aperture,
        "credit": credit,
        "camera": camera,
        "caption": caption,
        "created_timestamp": createdTimestamp,
        "copyright": copyright,
        "focal_length": focalLength,
        "iso": iso,
        "shutter_speed": shutterSpeed,
        "title": title,
        "orientation": orientation,
        "keywords": keywords?.map((x) => x).toList(),
      };
}

class Sizes {
  Sizes({
    this.woocommerceThumbnail,
    this.woocommerceGalleryThumbnail,
    this.woocommerceSingle,
    this.medium,
    this.thumbnail,
    this.mediumLarge,
    this.martfuryBlogGrid,
    this.martfuryBlogList,
    this.martfuryBlogMasonry,
    this.full,
  });

  Full? woocommerceThumbnail;
  Full? woocommerceGalleryThumbnail;
  Full? woocommerceSingle;
  Full? medium;
  Full? thumbnail;
  Full? mediumLarge;
  Full? martfuryBlogGrid;
  Full? martfuryBlogList;
  Full? martfuryBlogMasonry;
  Full? full;

  factory Sizes.fromJson(Map<String, dynamic> json) {
    return Sizes(
      woocommerceThumbnail: json["woocommerce_thumbnail"] == null
          ? null
          : Full.fromJson(json["woocommerce_thumbnail"]),
      woocommerceGalleryThumbnail: json["woocommerce_gallery_thumbnail"] == null
          ? null
          : Full.fromJson(json["woocommerce_gallery_thumbnail"]),
      woocommerceSingle: json["woocommerce_single"] == null
          ? null
          : Full.fromJson(json["woocommerce_single"]),
      medium: json["medium"] == null ? null : Full.fromJson(json["medium"]),
      thumbnail:
          json["thumbnail"] == null ? null : Full.fromJson(json["thumbnail"]),
      mediumLarge: json["medium_large"] == null
          ? null
          : Full.fromJson(json["medium_large"]),
      martfuryBlogGrid: json["martfury-blog-grid"] == null
          ? null
          : Full.fromJson(json["martfury-blog-grid"]),
      martfuryBlogList: json["martfury-blog-list"] == null
          ? null
          : Full.fromJson(json["martfury-blog-list"]),
      martfuryBlogMasonry: json["martfury-blog-masonry"] == null
          ? null
          : Full.fromJson(json["martfury-blog-masonry"]),
      full: json["full"] == null ? null : Full.fromJson(json["full"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "woocommerce_thumbnail": woocommerceThumbnail?.toJson(),
        "woocommerce_gallery_thumbnail": woocommerceGalleryThumbnail?.toJson(),
        "woocommerce_single": woocommerceSingle?.toJson(),
        "medium": medium?.toJson(),
        "thumbnail": thumbnail?.toJson(),
        "medium_large": mediumLarge?.toJson(),
        "martfury-blog-grid": martfuryBlogGrid?.toJson(),
        "martfury-blog-list": martfuryBlogList?.toJson(),
        "martfury-blog-masonry": martfuryBlogMasonry?.toJson(),
        "full": full?.toJson(),
      };
}

class Full {
  Full({
    this.file,
    this.width,
    this.height,
    this.mimeType,
    this.sourceUrl,
    this.filesize,
    this.uncropped,
  });

  String? file;
  int? width;
  int? height;
  String? mimeType;
  String? sourceUrl;
  int? filesize;
  bool? uncropped;

  factory Full.fromJson(Map<String, dynamic> json) {
    return Full(
      file: json["file"],
      width: json["width"],
      height: json["height"],
      mimeType: json["mime_type"],
      sourceUrl: json["source_url"],
      filesize: json["filesize"],
      uncropped: json["uncropped"],
    );
  }

  Map<String, dynamic> toJson() => {
        "file": file,
        "width": width,
        "height": height,
        "mime_type": mimeType,
        "source_url": sourceUrl,
        "filesize": filesize,
        "uncropped": uncropped,
      };
}
