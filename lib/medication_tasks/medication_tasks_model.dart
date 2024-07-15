import '/components/medication_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'medication_tasks_widget.dart' show MedicationTasksWidget;
import 'package:flutter/material.dart';

class MedicationTasksModel extends FlutterFlowModel<MedicationTasksWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Models for medication dynamic component.
  late FlutterFlowDynamicModels<MedicationModel> medicationModels;

  @override
  void initState(BuildContext context) {
    medicationModels = FlutterFlowDynamicModels(() => MedicationModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    medicationModels.dispose();
  }
}
