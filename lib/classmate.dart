

class Classmate {
  final String name;
  final String vision;
  final String photoUrl;

  Classmate({
    required this.name,
    required this.vision,
    required this.photoUrl,
  });

  factory Classmate.fromMap(Map<String, dynamic> map) {
    return Classmate(
      name: map['name'] as String,
      vision: map['vision'] as String,
      photoUrl: map['photoUrl'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'vision': vision,
      'photoUrl': photoUrl,
    };
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Classmate &&
        other.name == name &&
        other.vision == vision &&
        other.photoUrl == photoUrl;
  }

  @override
  int get hashCode => Object.hash(name, vision, photoUrl);

  @override
  String toString() {
    return 'Classmate(name: $name, vision: $vision, photoUrl: $photoUrl)';
  }
}