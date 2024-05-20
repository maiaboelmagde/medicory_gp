import 'package:flutter/material.dart';
import 'package:medicory_gp/widgets/custom_button.dart';

class SearchForPatientPage extends StatelessWidget {
  const SearchForPatientPage({super.key});
  static const String id = 'SearchForPatientPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search a Patient'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TextField(
                  onSubmitted: (value) async {
                    // var getWeatherCubit = BlocProvider.of<WeatherCubit>(context);
                    // getWeatherCubit.getWeatherCubit(cityName: value);
                    // Navigator.pop(context);
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter patient code',
                    suffixIcon: Icon(Icons.search),
                    labelText: 'Search',
                  ),
                )),
                CustomButton(title: 'Search', onPressed: (){}),
          ],
        ),
      ),
    );
  }
}