import 'package:flutter/material.dart';
import 'package:flutter_provider_counter/models/counter_model.dart';
import 'package:flutter_provider_counter/resources/custom_string.dart';
import 'package:flutter_provider_counter/resources/custom_theme.dart';
import 'package:flutter_provider_counter/resources/custom_widget.dart';
import 'package:flutter_provider_counter/ui/detail.dart';

class ProviderConfirm extends StatelessWidget {
  final CounterModel counterModel;
  ProviderConfirm({this.counterModel});

  final ThemeData _customTheme = CustomTheme.getInstance().customTheme;
  final String _title =
      "${CustomString.getInstance().providerBtnTitle} ${CustomString.getInstance().confirmTitle} ";

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: _title,
      theme: _customTheme,
      home: Scaffold(
        appBar: CustomWidget.getInstance().secondaryAppBarWidget(context,_title,_customTheme),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Your counter value is: ${counterModel.counter}',
                style: TextStyle(fontSize: 18.0),
              ),
              RaisedButton(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Confirm'),
                  onPressed: () {
                    navigatorPages(context, counterModel);
                  }),
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
            builder: (context) => ProviderDetail(
              counterBloc: counter,
                )));
  }
}
