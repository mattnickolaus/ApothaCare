import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DrugsRecord extends FirestoreRecord {
  DrugsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "drug_name" field.
  String? _drugName;
  String get drugName => _drugName ?? '';
  bool hasDrugName() => _drugName != null;

  // "scheduled_time" field.
  DateTime? _scheduledTime;
  DateTime? get scheduledTime => _scheduledTime;
  bool hasScheduledTime() => _scheduledTime != null;

  // "dosage" field.
  int? _dosage;
  int get dosage => _dosage ?? 0;
  bool hasDosage() => _dosage != null;

  // "details" field.
  String? _details;
  String get details => _details ?? '';
  bool hasDetails() => _details != null;

  // "was_taken" field.
  bool? _wasTaken;
  bool get wasTaken => _wasTaken ?? false;
  bool hasWasTaken() => _wasTaken != null;

  // "time_taken" field.
  DateTime? _timeTaken;
  DateTime? get timeTaken => _timeTaken;
  bool hasTimeTaken() => _timeTaken != null;

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "created" field.
  DateTime? _created;
  DateTime? get created => _created;
  bool hasCreated() => _created != null;

  // "number_of_pills" field.
  int? _numberOfPills;
  int get numberOfPills => _numberOfPills ?? 0;
  bool hasNumberOfPills() => _numberOfPills != null;

  void _initializeFields() {
    _drugName = snapshotData['drug_name'] as String?;
    _scheduledTime = snapshotData['scheduled_time'] as DateTime?;
    _dosage = castToType<int>(snapshotData['dosage']);
    _details = snapshotData['details'] as String?;
    _wasTaken = snapshotData['was_taken'] as bool?;
    _timeTaken = snapshotData['time_taken'] as DateTime?;
    _user = snapshotData['user'] as DocumentReference?;
    _created = snapshotData['created'] as DateTime?;
    _numberOfPills = castToType<int>(snapshotData['number_of_pills']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('drugs');

  static Stream<DrugsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DrugsRecord.fromSnapshot(s));

  static Future<DrugsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => DrugsRecord.fromSnapshot(s));

  static DrugsRecord fromSnapshot(DocumentSnapshot snapshot) => DrugsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DrugsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DrugsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DrugsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DrugsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDrugsRecordData({
  String? drugName,
  DateTime? scheduledTime,
  int? dosage,
  String? details,
  bool? wasTaken,
  DateTime? timeTaken,
  DocumentReference? user,
  DateTime? created,
  int? numberOfPills,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'drug_name': drugName,
      'scheduled_time': scheduledTime,
      'dosage': dosage,
      'details': details,
      'was_taken': wasTaken,
      'time_taken': timeTaken,
      'user': user,
      'created': created,
      'number_of_pills': numberOfPills,
    }.withoutNulls,
  );

  return firestoreData;
}

class DrugsRecordDocumentEquality implements Equality<DrugsRecord> {
  const DrugsRecordDocumentEquality();

  @override
  bool equals(DrugsRecord? e1, DrugsRecord? e2) {
    return e1?.drugName == e2?.drugName &&
        e1?.scheduledTime == e2?.scheduledTime &&
        e1?.dosage == e2?.dosage &&
        e1?.details == e2?.details &&
        e1?.wasTaken == e2?.wasTaken &&
        e1?.timeTaken == e2?.timeTaken &&
        e1?.user == e2?.user &&
        e1?.created == e2?.created &&
        e1?.numberOfPills == e2?.numberOfPills;
  }

  @override
  int hash(DrugsRecord? e) => const ListEquality().hash([
        e?.drugName,
        e?.scheduledTime,
        e?.dosage,
        e?.details,
        e?.wasTaken,
        e?.timeTaken,
        e?.user,
        e?.created,
        e?.numberOfPills
      ]);

  @override
  bool isValidKey(Object? o) => o is DrugsRecord;
}
