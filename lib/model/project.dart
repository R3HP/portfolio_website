import 'dart:convert';

import 'package:flutter/foundation.dart';

class Project {
  final String name;
  final String desc;
  final List<String> keyPoints;
  final String gitHubUrl;
  final String imageUrl;
  final String platform;
  
  Project({
    required this.name,
    required this.desc,
    required this.keyPoints,
    required this.gitHubUrl,
    required this.imageUrl,
    required this.platform,
  });

  Project copyWith({
    String? name,
    String? desc,
    List<String>? keyPoints,
    String? gitHubUrl,
    String? imageUrl,
    String? platform,
  }) {
    return Project(
      name: name ?? this.name,
      desc: desc ?? this.desc,
      keyPoints: keyPoints ?? this.keyPoints,
      gitHubUrl: gitHubUrl ?? this.gitHubUrl,
      imageUrl: imageUrl ?? this.imageUrl,
      platform: platform ?? this.platform,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'desc': desc,
      'keyPoints': keyPoints,
      'gitHubUrl': gitHubUrl,
      'imageUrl': imageUrl,
      'platform': platform,
    };
  }

  factory Project.fromMap(Map<String, dynamic> map) {
    return Project(
      name: map['name'] ?? '',
      desc: map['desc'] ?? '',
      keyPoints: List<String>.from(map['keyPoints']),
      gitHubUrl: map['gitHubUrl'] ?? '',
      imageUrl: map['imageUrl'] ?? '',
      platform: map['platform'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Project.fromJson(String source) => Project.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Project(name: $name, desc: $desc, keyPoints: $keyPoints, gitHubUrl: $gitHubUrl, imageUrl: $imageUrl, platform: $platform)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Project &&
      other.name == name &&
      other.desc == desc &&
      listEquals(other.keyPoints, keyPoints) &&
      other.gitHubUrl == gitHubUrl &&
      other.imageUrl == imageUrl &&
      other.platform == platform;
  }

  @override
  int get hashCode {
    return name.hashCode ^
      desc.hashCode ^
      keyPoints.hashCode ^
      gitHubUrl.hashCode ^
      imageUrl.hashCode ^
      platform.hashCode;
  }
}
