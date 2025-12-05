class Session {
  final String id;
  final String courseId;
  final String className;
  final String professorId;
  final DateTime createdAt;
  final DateTime? startedAt;
  final DateTime? endedAt;
  final SessionStatus status;
  final List<Participant> participants;

  Session({
    required this.id,
    required this.courseId,
    required this.className,
    required this.professorId,
    required this.createdAt,
    this.startedAt,
    this.endedAt,
    required this.status,
    this.participants = const [],
  });

  factory Session.fromJson(Map<String, dynamic> json) {
    return Session(
      id: json['id'] as String,
      courseId: json['courseId'] as String,
      className: json['className'] as String,
      professorId: json['professorId'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      startedAt: json['startedAt'] != null
          ? DateTime.parse(json['startedAt'] as String)
          : null,
      endedAt: json['endedAt'] != null
          ? DateTime.parse(json['endedAt'] as String)
          : null,
      status: SessionStatus.values.firstWhere(
        (e) => e.toString() == 'SessionStatus.${json['status']}',
        orElse: () => SessionStatus.pending,
      ),
      participants:
          (json['participants'] as List<dynamic>?)
              ?.map((e) => Participant.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'courseId': courseId,
      'className': className,
      'professorId': professorId,
      'createdAt': createdAt.toIso8601String(),
      'startedAt': startedAt?.toIso8601String(),
      'endedAt': endedAt?.toIso8601String(),
      'status': status.toString().split('.').last,
      'participants': participants.map((e) => e.toJson()).toList(),
    };
  }
}

enum SessionStatus { pending, active, completed }

class Participant {
  final String id;
  final String sessionId;
  final String pseudo;
  final DateTime joinedAt;
  final List<String> completedBeaconIds;

  Participant({
    required this.id,
    required this.sessionId,
    required this.pseudo,
    required this.joinedAt,
    this.completedBeaconIds = const [],
  });

  factory Participant.fromJson(Map<String, dynamic> json) {
    return Participant(
      id: json['id'] as String,
      sessionId: json['sessionId'] as String,
      pseudo: json['pseudo'] as String,
      joinedAt: DateTime.parse(json['joinedAt'] as String),
      completedBeaconIds: List<String>.from(
        json['completedBeaconIds'] as List? ?? [],
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'sessionId': sessionId,
      'pseudo': pseudo,
      'joinedAt': joinedAt.toIso8601String(),
      'completedBeaconIds': completedBeaconIds,
    };
  }
}
