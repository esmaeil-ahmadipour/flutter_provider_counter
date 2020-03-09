import 'package:flutter/material.dart';
import 'package:flutter_provider_counter/models/counter_model.dart';
import 'package:flutter_provider_counter/resources/custom_string.dart';
import 'package:flutter_provider_counter/resources/custom_theme.dart';
import 'package:flutter_provider_counter/resources/custom_widget.dart';
import 'package:flutter_provider_counter/ui/confirm.dart';
import 'package:provider/provider.dart';

class CounterPage extends StatelessWidget {
  final ThemeData _customTheme = CustomTheme.getInstance().customTheme;
  final String _title = CustomString.getInstance().providerBtnTitle;

  @override
  Widget build(BuildContext context) {
    final CounterModel counterBloc = Provider.of<CounterModel>(context);

    return MaterialApp(
      title: _title,
      theme: _customTheme,
      home: Scaffold(
        appBar: CustomWidget.getInstance().mainAppBarWidget(_title,_customTheme),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'You have pushed the button this many times:',
              ),

                Text(
                '${counterBloc.counter.toString()}',
                  style: Theme.of(context).textTheme.display1,
                ),

              SizedBox(height: 10.0),
              RaisedButton(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Submit'),
                  onPressed: ()
                  {
                    navigatorPages(context, counterBloc);
                  }
                  ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  children: <Widget>[
                    RaisedButton(
                      onPressed: () {
                        counterBloc.increment();
                      }, //increment
                      child: Icon(Icons.add),
                    ),
                    Spacer(),
                    RaisedButton(
                      onPressed: () {
                        counterBloc.decrement();
                      }, //decrement
                      child: Icon(Icons.remove),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future navigatorPages(BuildContext context, CounterModel counter) async {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ProviderConfirm(
              counterModel: counter,
            )));
  }
}
