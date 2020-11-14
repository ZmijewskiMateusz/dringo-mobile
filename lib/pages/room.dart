import 'package:dringo/providers/room_provider.dart';
import 'package:dringo/services/socket_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../main.dart';

class Room extends StatefulWidget {
  static const routeName = '/room';

  @override
  _RoomState createState() => _RoomState();
}

class _RoomState extends State<Room> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int id = ModalRoute.of(context).settings.arguments;
    final SocketService socketService = injector.get<SocketService>();

    void dispose() {
      super.dispose();
    }

    var participants = new List<String>();

    final room = Provider.of<RoomProvider>(
      context,
      listen: false,
    ).findById(id);

    return StreamBuilder(
      stream: socketService.getResponse,
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        if (snapshot.hasData) participants.add(snapshot.data.toString());

        return Scaffold(
          body: Container(
            child: Column(children: [
              SizedBox(height: 70.0),
              Text(
                room.name,
                style: TextStyle(fontSize: 24.0),
              ),
              SizedBox(height: 70.0),
              for (var participant in participants) Text(participant)
            ]),
          ),
        );
      },
    );
  }
}
