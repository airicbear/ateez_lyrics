import 'package:ateez_lyrics/widgets/keep_alive_future_builder_widget.dart';
import 'package:flutter/material.dart';

class KeepAliveFutureBuilderWidgetState
    extends State<KeepAliveFutureBuilderWidget>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return FutureBuilder(
      future: widget.future,
      builder: widget.builder,
    );
  }

  @override
  bool get wantKeepAlive => true;
}
