class HistoryModel {

  HistoryModel(String dateParam, String resultParam, String cubeParam) {
    date = dateParam;
    result = resultParam;
    cubeVariant = cubeParam;
  }

  String date;
  String result;
  String cubeVariant;

  String toString() {
    return '$date;$result;$cubeVariant';
  }

  HistoryModel.fromString(String data) {
    var list = data.split(';');
    date = list[0];
    result = list[1];
    cubeVariant = list[2];
  }

}