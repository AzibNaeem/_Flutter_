# Smart Home Device Manager

A console-based Dart simulation of a smart home system that manages various devices (Lights, Thermostats, Security Cameras) using **Object-Oriented Programming (OOP)** concepts, along with the **Factory Design Pattern**, **Interfaces**, and **Composition vs Aggregation** modeling.

## Class Structure

### `SmartDevice` (Abstract Class)
- Base class for all smart devices.
- **Properties**: `name`, `location`, `isOn`
- **Methods**: `turnOn()`, `turnOff()`, `status()`

### `Schedulable` (Interface)
- For devices that support scheduling.
- **Methods**: `scheduleOn(time)`, `scheduleOff(time)`

### Subclasses of `SmartDevice`

| Class           | Inherits From | Implements     | Description                                    |
|----------------|----------------|----------------|------------------------------------------------|
| `Light`         | `SmartDevice`  | `Schedulable`  | A simple light device that supports scheduling |
| `Thermostat`    | `SmartDevice`  | `Schedulable`  | Controls temperature and supports scheduling   |
| `SecurityCamera`| `SmartDevice`  | –              | Can record when turned on                      |

### `Room` (Aggregation)
- Aggregates smart devices.
- **Methods**: `addDevice()`, `removeDevice()`, `turnAllOn()`, `turnAllOff()`, `showStatus()`

### `SmartHomeController` (Composition)
- Composes and manages rooms.
- **Methods**: `addRoom()`, `turnDevicesOnInRoom()`, `turnDevicesOffInRoom()`, `showAllStatus()`

### `DeviceFactory` (Factory Pattern)
- Creates devices dynamically based on string input.
- **Method**: `static SmartDevice create(String type, String name, String location)`
