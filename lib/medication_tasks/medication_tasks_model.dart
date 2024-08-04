import '/flutter_flow/flutter_flow_util.dart';
import 'medication_tasks_widget.dart' show MedicationTasksWidget;
import 'package:flutter/material.dart';

class MedicationTasksModel extends FlutterFlowModel<MedicationTasksWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
