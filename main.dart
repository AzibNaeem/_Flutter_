abstract class SmartDevice {
  String name;
  String location;
  bool isOn = false;

  SmartDevice(this.name, this.location);

  void turnOn() {
    isOn = true;
    print('$name in $location is now ON.');
  }

  void turnOff() {
    isOn = false;
    print('$name in $location is now OFF.');
  }

  String status() => '$name (${this.runtimeType}) in $location is ${isOn ? 'ON' : 'OFF'}';
}

// schedulable devices
abstract class Schedulable {
  void scheduleOn(String time);
  void scheduleOff(String time);
}

// Subclass: Light
class Light extends SmartDevice implements Schedulable {
  Light(String name, String location) : super(name, location);

  @override
  void scheduleOn(String time) {
    print('$name scheduled to turn ON at $time');
  }

  @override
  void scheduleOff(String time) {
    print('$name scheduled to turn OFF at $time');
  }
}

// Subclass: Thermostat
class Thermostat extends SmartDevice implements Schedulable {
  double temperature = 24.0;

  Thermostat(String name, String location) : super(name, location);

  void setTemperature(double temp) {
    temperature = temp;
    print('$name set to $temperature°C in $location');
  }

  @override
  void scheduleOn(String time) {
    print('$name scheduled to turn ON at $time');
  }

  @override
  void scheduleOff(String time) {
    print('$name scheduled to turn OFF at $time');
  }
}

// Subclass: Security Camera
class SecurityCamera extends SmartDevice {
  SecurityCamera(String name, String location) : super(name, location);

  void startRecording() {
    if (isOn) {
      print('$name is recording...');
    } else {
      print('$name is OFF. Please turn it ON to start recording.');
    }
  }
}

// Aggregation
class Room {
  String name;
  List<SmartDevice> devices = [];

  Room(this.name);

  void addDevice(SmartDevice device) {
    devices.add(device);
    print('${device.name} added to $name');
  }

  void removeDevice(SmartDevice device) {
    devices.remove(device);
    print('${device.name} removed from $name');
  }

  void turnAllOn() {
    for (var device in devices) {
      if (!device.isOn) device.turnOn();
    }
  }

  void turnAllOff() {
    for (var device in devices) {
      if (device.isOn) device.turnOff();
    }
  }

  void showStatus() {
    print('\n--- $name Device Status ---');
    for (var device in devices) {
      print(device.status());
    }
  }
}

// Composition
class SmartHomeController {
  List<Room> rooms = [];

  void addRoom(Room room) {
    rooms.add(room);
    print('Room ${room.name} added to Smart Home');
  }

  void showAllStatus() {
    for (var room in rooms) {
      room.showStatus();
    }
  }

  void turnDevicesOnInRoom(String roomName) {
    for (var room in rooms) {
      if (room.name == roomName) {
        room.turnAllOn();
      }
    }
  }

  void turnDevicesOffInRoom(String roomName) {
    for (var room in rooms) {
      if (room.name == roomName) {
        room.turnAllOff();
      }
    }
  }
}

// Factory Pattern
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

// Simulation
void main() {
  var controller = SmartHomeController();

  var livingRoom = Room('Living Room');
  var kitchen = Room('Kitchen');

  var light1 = DeviceFactory.create('light', 'Ceiling Light', 'Living Room');
  var thermostat1 = DeviceFactory.create('thermostat', 'Nest', 'Living Room');
  var camera1 = DeviceFactory.create('camera', 'Front Cam', 'Living Room');

  var light2 = DeviceFactory.create('light', 'Kitchen Light', 'Kitchen');

  livingRoom.addDevice(light1);
  livingRoom.addDevice(thermostat1);
  livingRoom.addDevice(camera1);

  kitchen.addDevice(light2);

  controller.addRoom(livingRoom);
  controller.addRoom(kitchen);

  controller.showAllStatus();

  controller.turnDevicesOnInRoom('Living Room');
  controller.turnDevicesOffInRoom('Kitchen');

  controller.showAllStatus();

  // polymorphism
for (var room in controller.rooms) {
  for (var device in room.devices) {
    if (device is Schedulable) {
      (device as Schedulable).scheduleOn('8:00 AM');
      (device as Schedulable).scheduleOff('10:00 PM');
    }

    if (device is Thermostat) {
      device.setTemperature(22.5);
    }

    if (device is SecurityCamera) {
      device.startRecording();
    }
  }
}
}