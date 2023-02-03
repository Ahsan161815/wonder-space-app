// To parse this JSON data, do
//
//     final mri = mriFromJson(jsonString);

import 'dart:convert';

// mars rover images model calss
Mri mriFromJson(String str) => Mri.fromJson(json.decode(str));

String mriToJson(Mri data) => json.encode(data.toJson());

class Mri {
  Mri({
    required this.photos,
  });

  final List<Photo> photos;

  factory Mri.fromJson(Map<String, dynamic> json) => Mri(
        photos: List<Photo>.from(json["photos"].map((x) => Photo.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "photos": List<dynamic>.from(photos.map((x) => x.toJson())),
      };
}

class Photo {
  Photo({
    required this.id,
    required this.sol,
    required this.camera,
    required this.imgSrc,
    required this.earthDate,
    required this.rover,
  });

  final int id;
  final int sol;
  final Camera camera;
  final String imgSrc;
  final DateTime earthDate;
  final Rover rover;

  factory Photo.fromJson(Map<String, dynamic> json) => Photo(
        id: json["id"],
        sol: json["sol"],
        camera: Camera.fromJson(json["camera"]),
        imgSrc: json["img_src"],
        earthDate: DateTime.parse(json["earth_date"]),
        rover: Rover.fromJson(json["rover"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "sol": sol,
        "camera": camera.toJson(),
        "img_src": imgSrc,
        "earth_date":
            "${earthDate.year.toString().padLeft(4, '0')}-${earthDate.month.toString().padLeft(2, '0')}-${earthDate.day.toString().padLeft(2, '0')}",
        "rover": rover.toJson(),
      };
}

class Camera {
  Camera({
    required this.id,
    required this.name,
    required this.roverId,
    required this.fullName,
  });

  final int id;
  final CameraName? name;
  final int roverId;
  final FullName? fullName;

  factory Camera.fromJson(Map<String, dynamic> json) => Camera(
        id: json["id"],
        name: cameraNameValues.map[json["name"]],
        roverId: json["rover_id"],
        fullName: fullNameValues.map[json["full_name"]],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": cameraNameValues.reverse[name],
        "rover_id": roverId,
        "full_name": fullNameValues.reverse[fullName],
      };
}

enum FullName {
  FRONT_HAZARD_AVOIDANCE_CAMERA,
  REAR_HAZARD_AVOIDANCE_CAMERA,
  MAST_CAMERA,
  CHEMISTRY_AND_CAMERA_COMPLEX,
  NAVIGATION_CAMERA
}

final fullNameValues = EnumValues({
  "Chemistry and Camera Complex": FullName.CHEMISTRY_AND_CAMERA_COMPLEX,
  "Front Hazard Avoidance Camera": FullName.FRONT_HAZARD_AVOIDANCE_CAMERA,
  "Mast Camera": FullName.MAST_CAMERA,
  "Navigation Camera": FullName.NAVIGATION_CAMERA,
  "Rear Hazard Avoidance Camera": FullName.REAR_HAZARD_AVOIDANCE_CAMERA
});

enum CameraName { FHAZ, RHAZ, MAST, CHEMCAM, NAVCAM }

final cameraNameValues = EnumValues({
  "CHEMCAM": CameraName.CHEMCAM,
  "FHAZ": CameraName.FHAZ,
  "MAST": CameraName.MAST,
  "NAVCAM": CameraName.NAVCAM,
  "RHAZ": CameraName.RHAZ
});

class Rover {
  Rover({
    required this.id,
    required this.name,
    required this.landingDate,
    required this.launchDate,
    required this.status,
  });

  final int id;
  final RoverName? name;
  final DateTime landingDate;
  final DateTime launchDate;
  final Status? status;

  factory Rover.fromJson(Map<String, dynamic> json) => Rover(
        id: json["id"],
        name: roverNameValues.map[json["name"]],
        landingDate: DateTime.parse(json["landing_date"]),
        launchDate: DateTime.parse(json["launch_date"]),
        status: statusValues.map[json["status"]],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": roverNameValues.reverse[name],
        "landing_date":
            "${landingDate.year.toString().padLeft(4, '0')}-${landingDate.month.toString().padLeft(2, '0')}-${landingDate.day.toString().padLeft(2, '0')}",
        "launch_date":
            "${launchDate.year.toString().padLeft(4, '0')}-${launchDate.month.toString().padLeft(2, '0')}-${launchDate.day.toString().padLeft(2, '0')}",
        "status": statusValues.reverse[status],
      };
}

enum RoverName { CURIOSITY }

final roverNameValues = EnumValues({"Curiosity": RoverName.CURIOSITY});

enum Status { ACTIVE }

final statusValues = EnumValues({"active": Status.ACTIVE});

class EnumValues<T> {
  late Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
