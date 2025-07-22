// Base Class with Abstraction
abstract class SmartDevice {
  String name;
  String location;
  bool isOn = false;

  SmartDevice(this.name, this.location);

  void turnOn() {
    isOn = true;
    print('$name in $location is ON');
  }

  void turnOff() {
    isOn = false;
    print('$name in $location is OFF');
  }
}

// Subclass
class Light extends SmartDevice {
  Light(String name, String location) : super(name, location);

  @override
  void turnOn() {
    isOn = true;
    print('💡 $name in $location is shining bright!');
  }

  void dimLight() {
    print('$name is dimmed in $location');
  }
}

// Subclass
class Thermostat extends SmartDevice {
  double temperature = 25;

  Thermostat(String name, String location) : super(name, location);

  void setTemperature(double temp) {
    temperature = temp;
    print('$name set to $temperature°C in $location');
  }
}

// Subclass
class SecurityCamera extends SmartDevice {
  SecurityCamera(String name, String location) : super(name, location);

  @override
  void turnOn() {
    isOn = true;
    print('📷 $name in $location is ON and monitoring...');
  }

  void startRecording() {
    print('$name is recording in $location');
  }
}

// Interface
abstract class Schedulable {
  void scheduleOn(String time);
  void scheduleOff(String time);
}

// Light with Interface
class SchedulableLight extends Light implements Schedulable {
  SchedulableLight(String name, String location) : super(name, location);

  @override
  void scheduleOn(String time) {
    print('$name will turn ON at $time');
  }

  @override
  void scheduleOff(String time) {
    print('$name will turn OFF at $time');
  }
}

//Thermostat with Interface
class SchedulableThermostat extends Thermostat implements Schedulable {
  SchedulableThermostat(String name, String location) : super(name, location);

  @override
  void scheduleOn(String time) {
    print('$name will turn ON at $time');
  }

  @override
  void scheduleOff(String time) {
    print('$name will turn OFF at $time');
  }
}

// Room class
class Room {
  String name;    //Aggregation
  List<SmartDevice> devices = [];

  Room(this.name);

  void addDevice(SmartDevice device) {
    devices.add(device);
  }
}

// SmartHomeController
class SmartHomeController {
  List<Room> rooms = [];   //Composition

  void addRoom(Room room) {
    rooms.add(room);
  }

  void turnOnAllInRoom(String roomName) {
    for (var room in rooms) {
      if (room.name == roomName) {
        for (var device in room.devices) {
          device.turnOn(); // calls overridden method if available
        }
      }
    }
  }

  void showStatus() {
    for (var room in rooms) {
      print('\nRoom: ${room.name}');
      for (var device in room.devices) {
        print('- ${device.name} is ${device.isOn ? "ON" : "OFF"}');
      }
    }
  }
}

// Factory Pattern
class DeviceFactory {
  static SmartDevice create(String type, String name, String location) {
    switch (type) {
      case 'light':
        return SchedulableLight(name, location); // FIXED: using SchedulableLight
      case 'thermostat':
        return SchedulableThermostat(name, location);
      case 'camera':
        return SecurityCamera(name, location);
      default:
        throw Exception('Unknown device type');
    }
  }
}


void main() {
  // Create devices using factory
  var light = DeviceFactory.create('light', 'Main Light', 'Living Room');
  var thermostat = DeviceFactory.create('thermostat', 'Nest', 'Bedroom');
  var camera = DeviceFactory.create('camera', 'Cam 1', 'Entrance');


  light.turnOn();

  // Create rooms and add devices
  var livingRoom = Room('Living Room');
  livingRoom.addDevice(light);
  livingRoom.addDevice(camera);

  var bedroom = Room('Bedroom');
  bedroom.addDevice(thermostat);

  var controller = SmartHomeController();
  controller.addRoom(livingRoom);
  controller.addRoom(bedroom);

  controller.turnOnAllInRoom('Living Room');

  controller.showStatus();

  var sLight = SchedulableLight('Night Lamp', 'Kids Room');
  sLight.scheduleOn('7:00 PM');
  sLight.scheduleOff('11:00 PM');
}
