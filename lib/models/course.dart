class Course {
  final String id;
  final String name;
  final String description;
  final String professorId;
  final DateTime createdAt;
  final List<Beacon> beacons;

  Course({
    required this.id,
    required this.name,
    required this.description,
    required this.professorId,
    required this.createdAt,
    this.beacons = const [],
  });

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      professorId: json['professorId'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      beacons:
          (json['beacons'] as List<dynamic>?)
              ?.map((e) => Beacon.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'professorId': professorId,
      'createdAt': createdAt.toIso8601String(),
      'beacons': beacons.map((e) => e.toJson()).toList(),
    };
  }
}

class Beacon {
  final String id;
  final String courseId;
  final String qrCodeData;
  final double? latitude;
  final double? longitude;
  final String? photoPath;
  final int order;

  Beacon({
    required this.id,
    required this.courseId,
    required this.qrCodeData,
    this.latitude,
    this.longitude,
    this.photoPath,
    required this.order,
  });

  factory Beacon.fromJson(Map<String, dynamic> json) {
    return Beacon(
      id: json['id'] as String,
      courseId: json['courseId'] as String,
      qrCodeData: json['qrCodeData'] as String,
      latitude: json['latitude'] as double?,
      longitude: json['longitude'] as double?,
      photoPath: json['photoPath'] as String?,
      order: json['order'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'courseId': courseId,
      'qrCodeData': qrCodeData,
      'latitude': latitude,
      'longitude': longitude,
      'photoPath': photoPath,
      'order': order,
    };
  }
}
