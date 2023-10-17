import 'dart:convert';

class ListPicResponse {
    String? id;
    String? author;
    int? width;
    int? height;
    String? url;
    String? downloadUrl;

    ListPicResponse({
        this.id,
        this.author,
        this.width,
        this.height,
        this.url,
        this.downloadUrl,
    });

    ListPicResponse copyWith({
        String? id,
        String? author,
        int? width,
        int? height,
        String? url,
        String? downloadUrl,
    }) => 
        ListPicResponse(
            id: id ?? this.id,
            author: author ?? this.author,
            width: width ?? this.width,
            height: height ?? this.height,
            url: url ?? this.url,
            downloadUrl: downloadUrl ?? this.downloadUrl,
        );

    factory ListPicResponse.fromJson(String str) => ListPicResponse.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory ListPicResponse.fromMap(Map<String, dynamic> json) => ListPicResponse(
        id: json["id"],
        author: json["author"],
        width: json["width"],
        height: json["height"],
        url: json["url"],
        downloadUrl: json["download_url"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "author": author,
        "width": width,
        "height": height,
        "url": url,
        "download_url": downloadUrl,
    };
}
