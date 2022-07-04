import 'package:flutter/material.dart';
import 'package:task_02/Services/api_manager.dart';
import 'package:task_02/detail_page.dart';
import 'package:task_02/models/data_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isData = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ApiManager().getData();
    isData = true;
  }

  @override
  Widget build(BuildContext context) {
    var dataInfo;
    return Scaffold(
      appBar: AppBar(
        title: const Text("List View"),
        centerTitle: true,
      ),
      body: !isData
          ? const Center(
              child: Text("No Data Available"),
            )
          : FutureBuilder<Facebook>(
              future: ApiManager().getData(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return ListView.builder(
                  itemCount: snapshot.data?.dataInfo.length,
                  itemBuilder: (context, index) {
                    dataInfo = snapshot.data?.dataInfo[index];
                    // print(dataInfo.image.small);
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailPage(dataInfo),
                          ),
                        );
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.2,
                        width: MediaQuery.of(context).size.height * 0.5,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: Colors.grey,
                            width: 0,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              spreadRadius: 5,
                              blurRadius: 9,
                              offset: const Offset(
                                3,
                                3,
                              ),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 80,
                              height: 80,
                              margin: const EdgeInsets.all(10),
                              decoration: const BoxDecoration(
                                color: Colors.black,
                                shape: BoxShape.circle,
                              ),
                              child: Image.network(
                                dataInfo.image.small.toString(),
                                scale: 1.0,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: Column(
                                children: [
                                  Text(
                                    dataInfo.title,
                                    // textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    dataInfo.address,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
    );
  }
}
