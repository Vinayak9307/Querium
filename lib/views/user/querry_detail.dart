import 'package:flutter/material.dart';
import 'package:querium/utils/global_colors.dart';
import 'package:querium/views/user/comment_box.dart';

class QueryDetail extends StatefulWidget {
  const QueryDetail({super.key});

  @override
  State<QueryDetail> createState() => _QueryDetailState();
}

class _QueryDetailState extends State<QueryDetail> {
  final List images = [
    'post 1',
    'post 2',
    'post 3',
    'post 4',
    'post 5',
    //'post 6',
    //'post 7',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(color: Colors.white),
        backgroundColor: GlobalColor.mainColor,
        title: const Text('Query Detail',
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.w600)),
        centerTitle: true,
        automaticallyImplyLeading: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),

            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Container(
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    'Title',
                    textAlign: TextAlign.right,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  )),
            ),

            const Card(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: SizedBox(
                  // height: 150,
                  width: double.infinity,
                  child: Text('Dummy text'),
                ),
              ),
            ),

            Card(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 15, left: 15),
                    child: Container(
                        alignment: Alignment.centerLeft,
                        child: const Text(
                          'Administration response',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        )),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),

            const Card(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: SizedBox(
                  width: double.infinity,
                  child: Text('Dummy Text'),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Container(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: GlobalColor.mainColor,
                  ),
                  child: const Text('comments'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const QueryComments()),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            // ignore: unused_local_variable
            for (var item in images)
              Center(
                child: SizedBox(
                  width: double.infinity,
                  height: 200,
                  child: Padding(
                    padding: const EdgeInsets.all(13.0),
                    child: Container(
                      height: 200,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                              'https://i.pinimg.com/originals/78/2f/03/782f032235bd4b00c80de140b8e70538.jpg'),
                          fit: BoxFit.fill,
                        ),
                        //shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ),
              ),

            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
