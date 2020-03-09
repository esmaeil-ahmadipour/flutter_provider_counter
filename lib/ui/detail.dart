import 'package:flutter/material.dart';
import 'package:flutter_provider_counter/models/counter_model.dart';
import 'package:flutter_provider_counter/resources/custom_string.dart';
import 'package:flutter_provider_counter/resources/custom_theme.dart';
import 'package:flutter_provider_counter/resources/custom_widget.dart';

class ProviderDetail extends StatelessWidget {
  final CounterModel counterBloc;

  ProviderDetail({this.counterBloc});

  final ThemeData _customTheme = CustomTheme.getInstance().customTheme;
  final String _title =
      "${CustomString.getInstance().providerBtnTitle} ${CustomString.getInstance().detailTitle} ";

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: _title,
      theme: _customTheme,
      home: Scaffold(
        appBar: CustomWidget.getInstance().secondaryAppBarWidget(context,_title,_customTheme),
        body: Center(
          child: Text(
            '${counterBloc.counter}',
            style: TextStyle(fontSize: 80.0),
          ),
        ),
      ),
    );
  }
}
