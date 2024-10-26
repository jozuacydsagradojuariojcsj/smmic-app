class Device {
  final String deviceID;
  String deviceName;
  String? longitude;
  String? latitude;

  Device({required this.deviceID, required this.deviceName, this.longitude, this.latitude});

  //Updates the device information (deviceName and deviceID) of the object instance
  // void updateInfo(Map<String, dynamic> newInfo) {
  //   if (newInfo.containsKey('deviceName') && newInfo['deviceName'] != deviceName) {
  //     deviceName = newInfo['deviceName'];
  //   }
  //   if (newInfo.containsKey('coordinates') && newInfo['coordinates'] != coordinates) {
  //     coordinates = newInfo['coordinates'];
  //   }
  // }
}

class SinkNode extends Device {
  final List<String> registeredSensorNodes;

  SinkNode._internal({
    required super.deviceID,
    required super.deviceName,
    super.latitude,
    super.longitude,
    required this.registeredSensorNodes
  }) : super();

  //TODO: add logic to check if a device already exists (caching or from shared prefs)
  factory SinkNode.fromJSON(Map<String, dynamic> deviceInfo) {
    return SinkNode._internal(
      deviceID: deviceInfo['deviceID'],
      deviceName: deviceInfo['deviceName'],
      longitude: deviceInfo['longitude'],
      latitude: deviceInfo['latitude'],
      registeredSensorNodes: deviceInfo['registeredSensorNodes']
    );
  }
}

class SensorNode extends Device {
  final String registeredSinkNode;
  
  SensorNode._internal({
    required super.deviceID,
    required super.deviceName,
    super.longitude,
    super.latitude,
    required this.registeredSinkNode
  }) : super();

  //TODO: add logic to check if a device already exists (caching or from shared prefs)
  factory SensorNode.fromJSON(Map<String, dynamic> deviceInfo) {
    return SensorNode._internal(
      deviceID: deviceInfo['deviceID'],
      deviceName: deviceInfo['deviceName'],
      latitude:deviceInfo['latitude'],
      longitude: deviceInfo['longitude'],
      registeredSinkNode: deviceInfo['sinkNodeID']
    );
  }
}

class SensorNodeSnapshot {
  final String deviceID;
  final DateTime timestamp;
  final double soilMoisture;
  final double temperature;
  final double humidity;
  final double batteryLevel;

  SensorNodeSnapshot._internal({
    required this.deviceID,
    required this.timestamp,
    required this.soilMoisture,
    required this.temperature,
    required this.humidity,
    required this.batteryLevel,
  });

  factory SensorNodeSnapshot.fromJSON(Map<String, dynamic> data) {
    return SensorNodeSnapshot._internal(
      deviceID: data['device_id'],
      timestamp: DateTime.parse(data['timestamp']),
      soilMoisture: double.parse(data['soil_moisture']),
      temperature: double.parse(data['temperature']),
      humidity: double.parse(data['humidity']),
      batteryLevel: double.parse(data['battery_level']),
    );
  }

  Map<String,dynamic> toJson() => {
    'deviceID' : deviceID,
    'timestamp' : timestamp.toIso8601String(),
    'soil_moisture' : soilMoisture,
    'temperature' : temperature,
    'humidity' : humidity,
    'batteryLevel': batteryLevel
  };
}

//TODO: Add other data fields
class SinkNodeSnapshot {
  final String deviceID;
  final double batteryLevel;

  SinkNodeSnapshot._internal({
    required this.deviceID,
    required this.batteryLevel
  });

  factory SinkNodeSnapshot.fromJSON(Map<String, dynamic> data) {
    return SinkNodeSnapshot._internal(
      deviceID: data['deviceID'],
      batteryLevel: data['batteryLevel']
    );
  }
}