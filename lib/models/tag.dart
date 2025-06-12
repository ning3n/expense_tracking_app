class Tag{
  final String id;
  final String name;

  Tag({
    required this.id,
    required this.name,
  });

  //Added FROM JSON METHOD
  factory Tag.fromJson(Map<String, dynamic> json){
    return Tag(
      id: json['id'],
      name: json['name'],
    );
  }
  //Added TO JSON METHOD
  Map<String, dynamic> toJson(){
    return {
      'id': id,
      'name': name,
    };
  }
}