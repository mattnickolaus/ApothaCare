import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/add_medication_widget.dart';
import '/components/medication_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'medication_tasks_model.dart';
export 'medication_tasks_model.dart';

class MedicationTasksWidget extends StatefulWidget {
  const MedicationTasksWidget({super.key});

  @override
  State<MedicationTasksWidget> createState() => _MedicationTasksWidgetState();
}

class _MedicationTasksWidgetState extends State<MedicationTasksWidget> {
  late MedicationTasksModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MedicationTasksModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            await showModalBottomSheet(
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              context: context,
              builder: (context) {
                return GestureDetector(
                  onTap: () => _model.unfocusNode.canRequestFocus
                      ? FocusScope.of(context).requestFocus(_model.unfocusNode)
                      : FocusScope.of(context).unfocus(),
                  child: Padding(
                    padding: MediaQuery.viewInsetsOf(context),
                    child: const AddMedicationWidget(),
                  ),
                );
              },
            ).then((value) => safeSetState(() {}));
          },
          backgroundColor: FlutterFlowTheme.of(context).primary,
          elevation: 0.0,
          child: Icon(
            Icons.add,
            color: FlutterFlowTheme.of(context).info,
            size: 30.0,
          ),
        ),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 24.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(24.0, 24.0, 0.0, 0.0),
                  child: Text(
                    'Medications',
                    style: FlutterFlowTheme.of(context).headlineLarge.override(
                          fontFamily: 'Inter',
                          fontSize: 20.0,
                          letterSpacing: 0.0,
                        ),
                  ),
                ),
                Expanded(
                  child: StreamBuilder<List<DrugsRecord>>(
                    stream: queryDrugsRecord(
                      queryBuilder: (drugsRecord) => drugsRecord.where(
                        'user',
                        isEqualTo: currentUserReference,
                      ),
                    ),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return Center(
                          child: SizedBox(
                            width: 50.0,
                            height: 50.0,
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                FlutterFlowTheme.of(context).primary,
                              ),
                            ),
                          ),
                        );
                      }
                      List<DrugsRecord> listViewDrugsRecordList =
                          snapshot.data!;

                      return ListView.separated(
                        padding: EdgeInsets.zero,
                        scrollDirection: Axis.vertical,
                        itemCount: listViewDrugsRecordList.length,
                        separatorBuilder: (_, __) => const SizedBox(height: 12.0),
                        itemBuilder: (context, listViewIndex) {
                          final listViewDrugsRecord =
                              listViewDrugsRecordList[listViewIndex];
                          return Align(
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            child: wrapWithModel(
                              model: _model.medicationModels.getModel(
                                listViewDrugsRecord.user!.id,
                                listViewIndex,
                              ),
                              updateCallback: () => setState(() {}),
                              child: MedicationWidget(
                                key: Key(
                                  'Keykps_${listViewDrugsRecord.user!.id}',
                                ),
                                drugName: valueOrDefault<String>(
                                  listViewDrugsRecord.drugName,
                                  'drug',
                                ),
                                dosage: valueOrDefault<int>(
                                  listViewDrugsRecord.dosage,
                                  0,
                                ),
                                numberOfPills: valueOrDefault<int>(
                                  listViewDrugsRecord.numberOfPills,
                                  0,
                                ),
                                details: valueOrDefault<String>(
                                  listViewDrugsRecord.details,
                                  'N/A',
                                ),
                                wasTaken: listViewDrugsRecord.wasTaken,
                                scheduledTime:
                                    listViewDrugsRecord.scheduledTime!,
                                timeTaken: listViewDrugsRecord.timeTaken,
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
                FFButtonWidget(
                  onPressed: () async {
                    GoRouter.of(context).prepareAuthEvent();
                    await authManager.signOut();
                    GoRouter.of(context).clearRedirectLocation();

                    context.goNamedAuth('login', context.mounted);
                  },
                  text: 'logout',
                  options: FFButtonOptions(
                    height: 40.0,
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                    iconPadding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).primary,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Inter',
                          color: Colors.white,
                          letterSpacing: 0.0,
                        ),
                    elevation: 3.0,
                    borderSide: const BorderSide(
                      color: Colors.transparent,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ].divide(const SizedBox(height: 12.0)),
            ),
          ),
        ),
      ),
    );
  }
}
