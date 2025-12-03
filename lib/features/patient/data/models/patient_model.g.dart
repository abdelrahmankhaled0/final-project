// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patient_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PatientRequestAdapter extends TypeAdapter<PatientRequest> {
  @override
  final int typeId = 0;

  @override
  PatientRequest read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PatientRequest(
      id: fields[0] as String,
      patientName: fields[1] as String,
      requestType: fields[2] as String,
      priority: fields[3] as String,
      details: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, PatientRequest obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.patientName)
      ..writeByte(2)
      ..write(obj.requestType)
      ..writeByte(3)
      ..write(obj.priority)
      ..writeByte(4)
      ..write(obj.details);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PatientRequestAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
