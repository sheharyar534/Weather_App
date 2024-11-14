import 'dart:convert';

HistoryModel historyModelFromJson(String str) {
  return HistoryModel.fromJson(json.decode(str));
}

String historyModelToJson(HistoryModel data) => json.encode(data.toJson());

class HistoryModel {
  final int status;
  final bool success;
  final List<HistoryDataModel> data;
  final String message;
  HistoryModel({
    required this.status,
    required this.success,
    required this.data,
    required this.message,
  }); 

  factory HistoryModel.fromJson(Map<String, dynamic> json) => HistoryModel(
        status: json["status"],
        success: json["success"],
        data: List<HistoryDataModel>.from( json["data"].map((x) => HistoryDataModel.fromJson(x))),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "success": success, 
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "message": message,
      };
}

class HistoryDataModel {
  final String pickupLocation;
  final String dropLocation;
  final double farePrice;
  // final int status;

  HistoryDataModel({
    // required this.status,
    required this.pickupLocation,
    required this.dropLocation,
    required this.farePrice,
  });

  factory HistoryDataModel.fromJson(Map<String, dynamic> json) =>
      HistoryDataModel(
        pickupLocation: json["pickup_location"],
        dropLocation: json["drop_location"],
        farePrice: json["fare_price"],
      );

  Map<String, dynamic> toJson() => {
        "pickup_location": pickupLocation,
        "drop_location": dropLocation,
        "fare_price": farePrice,
      };
}
