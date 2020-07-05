import '../constants.dart';
import 'networking.dart';

class NewsHelper {
  Future getDataForHome() async {
    NetworkHelper networkHelper = NetworkHelper(
        '$kBaseUrl&show-fields=thumbnail%2CbodyText&api-key=$kApiKey');
    var response = await networkHelper.getResponse();
    return response;
  }

  Future getDataForHealth() async {
    NetworkHelper networkHelper = NetworkHelper(
        '$kBaseUrl&show-fields=thumbnail%2CbodyText&q=health&api-key=$kApiKey');
    var response = await networkHelper.getResponse();
    return response;
  }

  Future getDataForSport() async {
    NetworkHelper networkHelper = NetworkHelper(
        '$kBaseUrl&show-fields=thumbnail%2CbodyText&q=sport&api-key=$kApiKey');
    var response = await networkHelper.getResponse();
    return response;
  }

  Future getDataForEconomy() async {
    NetworkHelper networkHelper = NetworkHelper(
        '$kBaseUrl&show-fields=thumbnail%2CbodyText&q=economy&api-key=$kApiKey');
    var response = await networkHelper.getResponse();
    return response;
  }

  Future getDataForPolitics() async {
    NetworkHelper networkHelper = NetworkHelper(
        '$kBaseUrl&show-fields=thumbnail%2CbodyText&q=politics&api-key=$kApiKey');
    var response = await networkHelper.getResponse();
    return response;
  }
}
