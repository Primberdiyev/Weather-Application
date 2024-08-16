import 'package:weather_application/search_country_page/county_model.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart';

class GetCountry {
  Future<List<CountyModel>> getCountries() async {
    final response =
        await http.get(Uri.parse('https://world-weather.ru/pogoda/'));
    final document = parse(response.body);
    final content = document.getElementById("content");
    final blockCitiesCounty = content?.getElementsByClassName("block-cities");
    final List<CountyModel> countries = [];
    blockCitiesCounty?.forEach((e) {
      e.getElementsByClassName("country-block").forEach((element) {
        final tag = element.getElementsByTagName("a").first;
        countries.add(
            CountyModel(name: tag.innerHtml, link: tag.attributes['href']!));
      });
    });
    return countries;
  }
}
