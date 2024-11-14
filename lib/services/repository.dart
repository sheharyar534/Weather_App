import 'package:http/http.dart' as http;
import 'package:weather1_app/services/history_modal.dart';

class HistoryRepository {
  var token =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzMwODk5NjQ3LCJpYXQiOjE3MjgzMDc2NDcsImp0aSI6IjRhMzNjN2U3MmM5ZTQ5OTVhOGQ1MDJmOTk0YzE0YTE0IiwidXNlcl9pZCI6ImFmM2VjZDA2LTMwNDAtNDZmOC04YjEyLTgwYTg4OTg1ODdkYyJ9.VbIJIq5AcRouLqWSnwFNpk6lSooBAhvJZljIK-KMsds';

  Future<List<HistoryDataModel>> getHistory() async {
    // try {
    final response = await http.get(
        Uri.parse('http://103.245.193.89:8084/ride/trip-history/'),
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        });

    if (response.statusCode == 200) {
      var data = response.body;

      List<HistoryDataModel> historyList = [];

      historyList.addAll(historyModelFromJson(data).data);

      return historyList;
    } else {
      print("Error : ${response.statusCode}");
      return [
        HistoryDataModel(
          pickupLocation: 'pickupLocation erro',
          dropLocation: 'dropLocation erro',
          farePrice: 404.404,
        )
      ];
    }
  }
}
