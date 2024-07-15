import '/flutter_flow/flutter_flow_util.dart';
import 'add_medication_widget.dart' show AddMedicationWidget;
import 'package:flutter/material.dart';

class AddMedicationModel extends FlutterFlowModel<AddMedicationWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for drug-name widget.
  FocusNode? drugNameFocusNode;
  TextEditingController? drugNameTextController;
  String? Function(BuildContext, String?)? drugNameTextControllerValidator;
  String? _drugNameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for dosageCounter widget.
  int? dosageCounterValue;
  // State field(s) for PillsCounter widget.
  int? pillsCounterValue;
  DateTime? datePicked;
  // State field(s) for MedicationDetails widget.
  FocusNode? medicationDetailsFocusNode;
  TextEditingController? medicationDetailsTextController;
  String? Function(BuildContext, String?)?
      medicationDetailsTextControllerValidator;

  @override
  void initState(BuildContext context) {
    drugNameTextControllerValidator = _drugNameTextControllerValidator;
  }

  @override
  void dispose() {
    drugNameFocusNode?.dispose();
    drugNameTextController?.dispose();

    medicationDetailsFocusNode?.dispose();
    medicationDetailsTextController?.dispose();
  }
}
