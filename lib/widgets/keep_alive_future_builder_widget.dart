import 'package:ateez_lyrics/states/keep_alive_future_builder_widget_state.dart';
import 'package:flutter/material.dart';

class KeepAliveFutureBuilderWidget extends StatefulWidget {
  final Future future;
  final AsyncWidgetBuilder builder;

  const KeepAliveFutureBuilderWidget({
    super.key,
    required this.future,
    required this.builder,
  });

  @override
  State<KeepAliveFutureBuilderWidget> createState() =>
      KeepAliveFutureBuilderWidgetState();
}
