import 'dart:convert';

class StudentModel {
  StudentModel({
    this.success,
    this.data,
  });

  bool? success;
  Data? data;
  String? error;

  StudentModel.withError(String errorMessage) {
    error = errorMessage;
  }

  factory StudentModel.fromJson(dynamic json) => StudentModel(
        success: json["success"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": data?.toJson(),
      };
}

class Data {
  Data({
    this.screenTime,
    this.freeTime,
    this.devices,
  });

  ScreenTime? screenTime;
  FreeTime? freeTime;
  List<Device>? devices;

  factory Data.fromJson(dynamic json) => Data(
        screenTime: ScreenTime.fromJson(json["screenTime"]),
        freeTime: FreeTime.fromJson(json["freeTime"]),
        devices:
            List<Device>.from(json["devices"].map((x) => Device.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "screenTime": screenTime?.toJson(),
        "freeTime": freeTime?.toJson(),
        "devices": List<dynamic>.from(devices!.map((x) => x.toJson())),
      };
}

class Device {
  Device({
    this.name,
    this.usage,
  });

  String? name;
  int? usage;

  factory Device.fromJson(dynamic json) => Device(
        name: json["name"],
        usage: json["usage"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "usage": usage,
      };
}

class FreeTime {
  FreeTime({
    this.limit,
    this.usage,
  });

  int? limit;
  int? usage;

  factory FreeTime.fromJson(dynamic json) => FreeTime(
        limit: json["limit"],
        usage: json["usage"],
      );

  Map<String, dynamic> toJson() => {
        "limit": limit,
        "usage": usage,
      };
}

class ScreenTime {
  ScreenTime({
    this.screenTimeClass,
    this.study,
    this.free,
    this.total,
  });

  int? screenTimeClass;
  int? study;
  int? free;
  int? total;

  factory ScreenTime.fromJson(dynamic json) => ScreenTime(
        screenTimeClass: json["class"],
        study: json["study"],
        free: json["free"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "class": screenTimeClass,
        "study": study,
        "free": free,
        "total": total,
      };
}
