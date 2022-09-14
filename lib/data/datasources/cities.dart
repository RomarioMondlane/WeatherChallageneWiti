import '../models/city.dart';

class Cities {
  List<City> getCities() {
    List<City> cities = [];
    cities.add(City(
        name: "Lisboa", countryCode: "PT", lat: 38.736946, long: -9.142685));
    cities.add(City(
        name: " Madrid", countryCode: "ES", lat: 40.416775, long: -3.703790));
    cities.add(City(
        name: " Paris", countryCode: "FR", lat: 48.864716, long: 2.349014));
    cities.add(City(
        name: " Berlim", countryCode: "DE", lat: 52.520008, long: 13.404954));
    cities.add(
        City(name: "Berna", countryCode: "CH", lat: 46.947456, long: 7.451123));
    cities.add(
        City(name: "Roma", countryCode: "IT", lat: 41.902782, long: 12.496366));
    cities.add(City(
        name: "Londres", countryCode: "GB", lat: 51.509865, long: -0.118092));
    cities.add(City(
        name: "Dublin", countryCode: "IE", lat: 53.342686, long: -6.267118));
    cities.add(City(
        name: "Praga", countryCode: "CZ", lat: 50.073658, long: 14.418540));
    cities.add(City(
        name: "Viena", countryCode: "AT", lat: 48.210033, long: 16.363449));

    return cities;
  }
}
