// To parse this JSON data, do
//
//     final featuredMedia = featuredMediaFromJson(jsonString);

import 'dart:convert';

List<FeaturedMedia> featuredMediaFromJson(String str) =>
    List<FeaturedMedia>.from(
        json.decode(str).map((x) => FeaturedMedia.fromJson(x)));

String featuredMediaToJson(List<FeaturedMedia> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FeaturedMedia {
  FeaturedMedia({
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
    this.smush,
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

  int id;
  DateTime date;
  DateTime dateGmt;
  Caption guid;
  DateTime modified;
  DateTime modifiedGmt;
  String slug;
  String status;
  String type;
  String link;
  Caption title;
  int author;
  String commentStatus;
  String pingStatus;
  String template;
  List<dynamic> meta;
  Smush smush;
  Caption description;
  Caption caption;
  String altText;
  String mediaType;
  MimeType mimeType;
  MediaDetails mediaDetails;
  int post;
  String sourceUrl;
  Links links;

  factory FeaturedMedia.fromJson(Map<String, dynamic> json) => FeaturedMedia(
        id: json["id"],
        date: DateTime.parse(json["date"]),
        dateGmt: DateTime.parse(json["date_gmt"]),
        guid: Caption.fromJson(json["guid"]),
        modified: DateTime.parse(json["modified"]),
        modifiedGmt: DateTime.parse(json["modified_gmt"]),
        slug: json["slug"],
        status: json["status"],
        type: json["type"],
        link: json["link"],
        title: Caption.fromJson(json["title"]),
        author: json["author"],
        commentStatus: json["comment_status"],
        pingStatus: json["ping_status"],
        template: json["template"],
        meta: List<dynamic>.from(json["meta"].map((x) => x)),
        smush: Smush.fromJson(json["smush"]),
        description: Caption.fromJson(json["description"]),
        caption: Caption.fromJson(json["caption"]),
        altText: json["alt_text"],
        mediaType: json["media_type"],
        mimeType: mimeTypeValues.map[json["mime_type"]],
        mediaDetails: MediaDetails.fromJson(json["media_details"]),
        post: json["post"],
        sourceUrl: json["source_url"],
        links: Links.fromJson(json["_links"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "date": date.toIso8601String(),
        "date_gmt": dateGmt.toIso8601String(),
        "guid": guid.toJson(),
        "modified": modified.toIso8601String(),
        "modified_gmt": modifiedGmt.toIso8601String(),
        "slug": slug,
        "status": status,
        "type": type,
        "link": link,
        "title": title.toJson(),
        "author": author,
        "comment_status": commentStatus,
        "ping_status": pingStatus,
        "template": template,
        "meta": List<dynamic>.from(meta.map((x) => x)),
        "smush": smush.toJson(),
        "description": description.toJson(),
        "caption": caption.toJson(),
        "alt_text": altText,
        "media_type": mediaType,
        "mime_type": mimeTypeValues.reverse[mimeType],
        "media_details": mediaDetails.toJson(),
        "post": post,
        "source_url": sourceUrl,
        "_links": links.toJson(),
      };
}

class Caption {
  Caption({
    this.rendered,
  });

  String rendered;

  factory Caption.fromJson(Map<String, dynamic> json) => Caption(
        rendered: json["rendered"],
      );

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

  List<About> self;
  List<About> collection;
  List<About> about;
  List<Author> author;
  List<Author> replies;

  factory Links.fromJson(Map<String, dynamic> json) => Links(
        self: List<About>.from(json["self"].map((x) => About.fromJson(x))),
        collection:
            List<About>.from(json["collection"].map((x) => About.fromJson(x))),
        about: List<About>.from(json["about"].map((x) => About.fromJson(x))),
        author:
            List<Author>.from(json["author"].map((x) => Author.fromJson(x))),
        replies:
            List<Author>.from(json["replies"].map((x) => Author.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "self": List<dynamic>.from(self.map((x) => x.toJson())),
        "collection": List<dynamic>.from(collection.map((x) => x.toJson())),
        "about": List<dynamic>.from(about.map((x) => x.toJson())),
        "author": List<dynamic>.from(author.map((x) => x.toJson())),
        "replies": List<dynamic>.from(replies.map((x) => x.toJson())),
      };
}

class About {
  About({
    this.href,
  });

  String href;

  factory About.fromJson(Map<String, dynamic> json) => About(
        href: json["href"],
      );

  Map<String, dynamic> toJson() => {
        "href": href,
      };
}

class Author {
  Author({
    this.embeddable,
    this.href,
  });

  bool embeddable;
  String href;

  factory Author.fromJson(Map<String, dynamic> json) => Author(
        embeddable: json["embeddable"],
        href: json["href"],
      );

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
    this.sizes,
    this.imageMeta,
    this.originalImage,
  });

  int width;
  int height;
  String file;
  Map<String, MediaDetailsSize> sizes;
  ImageMeta imageMeta;
  String originalImage;

  factory MediaDetails.fromJson(Map<String, dynamic> json) => MediaDetails(
        width: json["width"],
        height: json["height"],
        file: json["file"],
        sizes: Map.from(json["sizes"]).map((k, v) =>
            MapEntry<String, MediaDetailsSize>(
                k, MediaDetailsSize.fromJson(v))),
        imageMeta: ImageMeta.fromJson(json["image_meta"]),
        originalImage:
            json["original_image"] == null ? null : json["original_image"],
      );

  Map<String, dynamic> toJson() => {
        "width": width,
        "height": height,
        "file": file,
        "sizes": Map.from(sizes)
            .map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
        "image_meta": imageMeta.toJson(),
        "original_image": originalImage == null ? null : originalImage,
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

  String aperture;
  String credit;
  String camera;
  String caption;
  String createdTimestamp;
  String copyright;
  String focalLength;
  String iso;
  String shutterSpeed;
  String title;
  String orientation;
  List<dynamic> keywords;

  factory ImageMeta.fromJson(Map<String, dynamic> json) => ImageMeta(
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
        keywords: List<dynamic>.from(json["keywords"].map((x) => x)),
      );

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
        "keywords": List<dynamic>.from(keywords.map((x) => x)),
      };
}

class MediaDetailsSize {
  MediaDetailsSize({
    this.file,
    this.width,
    this.height,
    this.mimeType,
    this.sourceUrl,
  });

  String file;
  int width;
  int height;
  MimeType mimeType;
  String sourceUrl;

  factory MediaDetailsSize.fromJson(Map<String, dynamic> json) =>
      MediaDetailsSize(
        file: json["file"],
        width: json["width"],
        height: json["height"],
        mimeType: mimeTypeValues.map[json["mime_type"]],
        sourceUrl: json["source_url"],
      );

  Map<String, dynamic> toJson() => {
        "file": file,
        "width": width,
        "height": height,
        "mime_type": mimeTypeValues.reverse[mimeType],
        "source_url": sourceUrl,
      };
}

enum MimeType { IMAGE_JPEG, IMAGE_PNG }

final mimeTypeValues = EnumValues(
    {"image/jpeg": MimeType.IMAGE_JPEG, "image/png": MimeType.IMAGE_PNG});

class Smush {
  Smush({
    this.stats,
    this.sizes,
  });

  Stats stats;
  Map<String, SmushSize> sizes;

  factory Smush.fromJson(Map<String, dynamic> json) => Smush(
        stats: Stats.fromJson(json["stats"]),
        sizes: Map.from(json["sizes"]).map(
            (k, v) => MapEntry<String, SmushSize>(k, SmushSize.fromJson(v))),
      );

  Map<String, dynamic> toJson() => {
        "stats": stats.toJson(),
        "sizes": Map.from(sizes)
            .map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
      };
}

class SmushSize {
  SmushSize({
    this.percent,
    this.bytes,
    this.sizeBefore,
    this.sizeAfter,
    this.time,
  });

  double percent;
  int bytes;
  int sizeBefore;
  int sizeAfter;
  double time;

  factory SmushSize.fromJson(Map<String, dynamic> json) => SmushSize(
        percent: json["percent"].toDouble(),
        bytes: json["bytes"],
        sizeBefore: json["size_before"],
        sizeAfter: json["size_after"],
        time: json["time"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "percent": percent,
        "bytes": bytes,
        "size_before": sizeBefore,
        "size_after": sizeAfter,
        "time": time,
      };
}

class Stats {
  Stats({
    this.percent,
    this.bytes,
    this.sizeBefore,
    this.sizeAfter,
    this.time,
    this.apiVersion,
    this.lossy,
    this.keepExif,
  });

  double percent;
  int bytes;
  int sizeBefore;
  int sizeAfter;
  double time;
  String apiVersion;
  bool lossy;
  int keepExif;

  factory Stats.fromJson(Map<String, dynamic> json) => Stats(
        percent: json["percent"].toDouble(),
        bytes: json["bytes"],
        sizeBefore: json["size_before"],
        sizeAfter: json["size_after"],
        time: json["time"].toDouble(),
        apiVersion: json["api_version"],
        lossy: json["lossy"],
        keepExif: json["keep_exif"],
      );

  Map<String, dynamic> toJson() => {
        "percent": percent,
        "bytes": bytes,
        "size_before": sizeBefore,
        "size_after": sizeAfter,
        "time": time,
        "api_version": apiVersion,
        "lossy": lossy,
        "keep_exif": keepExif,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
