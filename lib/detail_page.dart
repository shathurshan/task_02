import 'package:flutter/material.dart';
import 'package:task_02/map_page.dart';
import 'package:task_02/models/data_model.dart';

class DetailPage extends StatefulWidget {
  final DataInfo dataInfo;
  DetailPage(this.dataInfo);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Details"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.location_on),
            tooltip: 'Show Snackbar',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MapPage(
                    widget.dataInfo.latitude.toString(),
                    widget.dataInfo.longitude.toString(),
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                height: 200,
                width: 200,
                decoration: const BoxDecoration(
                  color: Colors.black,
                  shape: BoxShape.rectangle,
                ),
                child: Image.network(
                  widget.dataInfo.image!.large.toString(),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                widget.dataInfo.title.toString(),
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 10,
                  right: 10,
                ),
                child: Text(
                  widget.dataInfo.description.toString(),
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
