import 'package:flutter/material.dart';
import 'package:world_time/services/get_time.dart';

class Location extends StatefulWidget {
  const Location({Key? key}) : super(key: key);

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {

  List<GetWorldTime> location = [
    GetWorldTime(location: 'Johannesburg, RSA', flag: 'sa.png', url: '/Africa/Johannesburg'),
    GetWorldTime(location: 'Casablanca, Morocco', flag: 'morocco.png', url: '/Africa/Casablanca'),
    GetWorldTime(location: 'Lagos, Nigeria', flag: 'nigeria.png', url: '/Africa/Lagos'),
    GetWorldTime(location: 'Berlin, Germany', flag: 'germany.png', url: '/Europe/Berlin'),
    GetWorldTime(location: 'Athens, Greece', flag: 'greece.png', url: '/Europe/Athens'),
    GetWorldTime(location: 'Jakarta, Indonesia', flag: 'indonesia.png', url: '/Asia/Jakarta'),
    GetWorldTime(location: 'Nairobi, Kenya', flag: 'kenya.png', url: '/Africa/Nairobi'),
    GetWorldTime(location: 'Seoul, South Korea', flag: 'south_korea.png', url: '/Asia/Seoul'),
    GetWorldTime(location: 'London, UK', flag: 'uk.png', url: '/Europe/London'),
    GetWorldTime(location: 'Denver, USA', flag: 'usa.png', url: '/America/Denver'),
  ];

  void updateTime(index) async {
    GetWorldTime instance = location[index];
    await instance.setTime();
    Navigator.pop(context, {
      'location': instance.location,
      'time': instance.time,
      'flag': instance.flag,
      'isDayTime': instance.isDayTime,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      appBar: AppBar(
        title: const Text('Location'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: location.length,
        itemBuilder: (context, index) {
          return Card(
            color: Colors.blue[100],
            child: ListTile(
              onTap: () {
                updateTime(index);
              },
              title: Text(location[index].location),
              leading: CircleAvatar(
                backgroundImage: AssetImage('assets/${location[index].flag}'),
              ),
              //subtitle: Text(location[index].time),
            ),
          );
        },
      ),
    );
  }
}
