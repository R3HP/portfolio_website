import 'dart:convert';

import 'package:flutter/foundation.dart';

class Project {
  final int id;
  final String name;
  final String desc;
  final List<String> keyPoints;
  final String gitHubUrl;
  final String imageUrl;
  final String platform;
  
  const Project({
    required this.id,
    required this.name,
    required this.desc,
    required this.keyPoints,
    required this.gitHubUrl,
    required this.imageUrl,
    required this.platform,
  });

  Project copyWith({
    int? id,
    String? name,
    String? desc,
    List<String>? keyPoints,
    String? gitHubUrl,
    String? imageUrl,
    String? platform,
  }) {
    return Project(
      id: id ?? this.id,
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
      'id': id,
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
      id: map['id']?.toInt() ?? 0,
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
    return 'Project(id: $id, name: $name, desc: $desc, keyPoints: $keyPoints, gitHubUrl: $gitHubUrl, imageUrl: $imageUrl, platform: $platform)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Project &&
      other.id == id &&
      other.name == name &&
      other.desc == desc &&
      listEquals(other.keyPoints, keyPoints) &&
      other.gitHubUrl == gitHubUrl &&
      other.imageUrl == imageUrl &&
      other.platform == platform;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      desc.hashCode ^
      keyPoints.hashCode ^
      gitHubUrl.hashCode ^
      imageUrl.hashCode ^
      platform.hashCode;
  }

  static const projects = [
                    Project(
                      id: 1,
                        name: 'Security Check In App',
                        desc:
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                        keyPoints: [''],
                        gitHubUrl: '',
                        imageUrl: '',
                        platform: 'Flutter'),
                    Project(
                      id: 2,
                        name: 'Chat App With Video Calling',
                        desc:
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                        keyPoints: [''],
                        gitHubUrl: '',
                        imageUrl: '',
                        platform: 'Flutter'),
                    Project(
                      id: 3,
                        name: 'Food Ordering App',
                        desc: 'Lorem ipsum dolor sit amet',
                        keyPoints: [''],
                        gitHubUrl: '',
                        imageUrl: '',
                        platform: 'Flutter'),
                    Project(
                      id: 4,
                        name: 'Shop Api',
                        desc:
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                        keyPoints: [''],
                        gitHubUrl: '',
                        imageUrl: '',
                        platform: 'NodeJs'),
                  ];
}
