// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'leave_request.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LeaveRequestAdapter extends TypeAdapter<LeaveRequest> {
  @override
  final int typeId = 0;

  @override
  LeaveRequest read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LeaveRequest(
      employeeId: fields[0] as String,
      leaveType: fields[1] as String,
      startDate: fields[2] as DateTime,
      endDate: fields[3] as DateTime,
      reason: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, LeaveRequest obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.employeeId)
      ..writeByte(1)
      ..write(obj.leaveType)
      ..writeByte(2)
      ..write(obj.startDate)
      ..writeByte(3)
      ..write(obj.endDate)
      ..writeByte(4)
      ..write(obj.reason);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LeaveRequestAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
