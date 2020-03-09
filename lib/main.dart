import 'package:flutter/material.dart';
import 'package:flutter_provider_counter/models/counter_model.dart';
import 'package:flutter_provider_counter/ui/home_page.dart';
import 'package:provider/provider.dart';

void main() => runApp(MainPage());

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CounterModel>.value(
          value: CounterModel(),
        ),
      ],
      child: MaterialApp(
        home: CounterPage(),
      ),
    );
  }
}
