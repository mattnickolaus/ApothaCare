import '/flutter_flow/flutter_flow_util.dart';
import 'medication_widget.dart' show MedicationWidget;
import 'package:flutter/material.dart';

class MedicationModel extends FlutterFlowModel<MedicationWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
