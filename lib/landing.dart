import 'package:flutter/material.dart';
import 'package:pts_rafyattala_rpl2/teammodel.dart';
import 'package:pts_rafyattala_rpl2/home.dart';
class DetailScreen extends StatefulWidget {
  final TeamModel team;

  DetailScreen(this.team);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BACK', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 20),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(widget.team.strTeamBadge, height: 10),
                    ),
                    SizedBox(height: 20),
                    Text(widget.team.strTeam, style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20), textAlign: TextAlign.center),
                    SizedBox(height: 20),
                    Text(widget.team.strDescriptionEN, style: TextStyle(color: Colors.black, fontSize: 14), textAlign: TextAlign.center),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
