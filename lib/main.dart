import 'package:flutter/material.dart';

// SmartDevice base class
abstract class SmartDevice {
  String name;
  String location;
  bool isOn;

  SmartDevice(this.name, this.location, [this.isOn = false]);

  void turnOn() {
    isOn = true;
    print('$name in $location is now ON.');
  }

  void turnOff() {
    isOn = false;
    print('$name in $location is now OFF.');
  }

  void status() {
    print('$name in $location is ${isOn ? 'ON' : 'OFF'}.');
  }
}

// Schedulable Interface
abstract class Schedulable {
  void scheduleOn(String time);
  void scheduleOff(String time);
}

// Light subclass
class Light extends SmartDevice implements Schedulable {
  Light(String name, String location) : super(name, location);

  @override
  void scheduleOn(String time) {
    print('$name scheduled to turn ON at $time.');
  }

  @override
  void scheduleOff(String time) {
    print('$name scheduled to turn OFF at $time.');
  }
}

// Thermostat subclass
class Thermostat extends SmartDevice implements Schedulable {
  double temperature = 22.0;

  Thermostat(String name, String location) : super(name, location);

  void setTemperature(double temp) {
    temperature = temp;
    print('$name set to $temperature°C.');
  }

  @override
  void scheduleOn(String time) {
    print('$name scheduled to turn ON at $time.');
  }

  @override
  void scheduleOff(String time) {
    print('$name scheduled to turn OFF at $time.');
  }
}

// SecurityCamera subclass
class SecurityCamera extends SmartDevice {
  SecurityCamera(String name, String location) : super(name, location);

  void startRecording() {
    print('$name in $location started recording.');
  }

  void stopRecording() {
    print('$name in $location stopped recording.');
  }
}

// Factory Pattern to create devices
class DeviceFactory {
  static SmartDevice create(String type, String name, String location) {
    switch (type.toLowerCase()) {
      case 'light':
        return Light(name, location);
      case 'thermostat':
        return Thermostat(name, location);
      case 'camera':
        return SecurityCamera(name, location);
      default:
        throw Exception('Unknown device type: $type');
    }
  }
}

// Room class (Aggregation)
class Room {
  String name;
  List<SmartDevice> devices = [];

  Room(this.name);

  void addDevice(SmartDevice device) {
    devices.add(device);
    print('Added ${device.name} to $name.');
  }

  void removeDevice(String deviceName) {
    devices.removeWhere((d) => d.name == deviceName);
    print('Removed $deviceName from $name.');
  }

  void turnAllOn() {
    for (var d in devices) {
      if (!d.isOn) d.turnOn();
    }
  }

  void turnAllOff() {
    for (var d in devices) {
      if (d.isOn) d.turnOff();
    }
  }

  void showStatus() {
    print('\nStatus for Room: $name');
    for (var d in devices) {
      d.status();
    }
  }
}

// SmartHomeController (Composition)
class SmartHomeController {
  List<Room> rooms = [];

  void addRoom(Room room) {
    rooms.add(room);
    print('Room ${room.name} added to controller.');
  }

  void removeRoom(String roomName) {
    rooms.removeWhere((r) => r.name == roomName);
    print('Room $roomName removed from controller.');
  }

  void showAllStatuses() {
    for (var room in rooms) {
      room.showStatus();
    }
  }

  void turnAllDevicesOn() {
    for (var room in rooms) {
      room.turnAllOn();
    }
  }

  void turnAllDevicesOff() {
    for (var room in rooms) {
      room.turnAllOff();
    }
  }
}

// Main Simulation
void main() {
  SmartHomeController controller = SmartHomeController();

  // Create rooms
  Room livingRoom = Room('Living Room');
  Room bedroom = Room('Bedroom');

  // Create devices using factory
  SmartDevice light1 = DeviceFactory.create('light', 'Ceiling Light', 'Living Room');
  SmartDevice thermo = DeviceFactory.create('thermostat', 'Main Thermostat', 'Living Room');
  SmartDevice cam = DeviceFactory.create('camera', 'Door Camera', 'Bedroom');

  // Add devices to rooms
  livingRoom.addDevice(light1);
  livingRoom.addDevice(thermo);
  bedroom.addDevice(cam);

  // Add rooms to controller
  controller.addRoom(livingRoom);
  controller.addRoom(bedroom);

  // Use device-specific methods
  (thermo as Thermostat).setTemperature(25);
  (cam as SecurityCamera).startRecording();

  // Scheduling
  if (light1 is Schedulable) {
    (light1 as Schedulable).scheduleOn('7:00 PM');
  }

  // Control actions
  controller.turnAllDevicesOn();
  controller.showAllStatuses();

  controller.turnAllDevicesOff();
  controller.showAllStatuses();
}
