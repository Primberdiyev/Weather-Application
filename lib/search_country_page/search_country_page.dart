import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_application/providers/country_provider.dart';
import 'package:weather_application/search_country_page/widgets/country_button.dart';
import 'package:weather_application/search_country_page/widgets/search_widget.dart';

class SearchCountryPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SearchCountryPageState();
}

class _SearchCountryPageState extends State<SearchCountryPage> {
  @override
  void initState() {
    super.initState();
    Provider.of<CountryProvider>(context, listen: false).fetchCountries();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFEE3BC),
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFFFEE3BC),
                Color(0xFFF39876),
              ],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
          child: Consumer<CountryProvider>(
            builder: (context, countryProvider, child) {
              final filteredCountries = countryProvider.filteredCountries;
              if (filteredCountries.isEmpty) {
                return const Center(child: CircularProgressIndicator());
              }
              return Column(
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: const Icon(Icons.arrow_back),
                      ),
                      const SizedBox(width: 100),
                      const Text(
                        'Search',
                        style:
                            TextStyle(color: Color(0xFF313341), fontSize: 20),
                      )
                    ],
                  ),
                  SearchWidget(
                    onChanged: countryProvider.onsearchanged,
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: filteredCountries.length,
                      itemBuilder: (context, index) {
                        final country = filteredCountries[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 20),
                          child: CountryButton(CountryName: country.name),
                        );
                      },
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
