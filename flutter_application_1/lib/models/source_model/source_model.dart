

// to convert json to dart(object)

//{} class

class SourceModel {
  // بعمل بتاع error
  String? status;
  String? code;
  String? message;
  List<Source>? sources;

  SourceModel({this.status, this.code, this.message, this.sources});

  factory SourceModel.fromJson(Map<String, dynamic> json) {
    return SourceModel(
      code: json['code'] ?? "",
      message: json['message'] ?? "",
      status: json['status'], // مش هعمل شكل اللي فوق علشان في الحالاتين هترجع
      sources: List<Source>.from(
        json['sources'].map((x) => Source.fromJson(x)),
      ), //convert list to object
      // one object في كل مره هتبعت
    );
  }
}

class Source {
  String? id;
  String? name;
  String? description;
  String? url;
  String? category;
  Source({this.category, this.description, this.id, this.name, this.url});



  factory Source.fromJson(Map<String, dynamic> json) {
    return Source(
        category: json['category'],
        description: json['description'],
        id: json['id'],
        name: json['name'],
        url: json['url']);
  }

// الاتنين نفس الحاجه
  /*
   Source.formJson(Map<String, dynamic> json)
      : this(
            category: json['category'],
            description: json['description'],
            id: json['id'],
            name: json['name'],
            url: json['url']);
  */

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['description'] = description;
    map['url'] = url;
    map['category'] = category;
    return map;
  }

}

