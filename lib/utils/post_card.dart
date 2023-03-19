import 'package:flutter/material.dart';
import 'package:querium/utils/global_colors.dart';

class PostCardView extends StatefulWidget {
  const PostCardView({super.key});

  @override
  State<PostCardView> createState() => _PostCardViewState();
}

class _PostCardViewState extends State<PostCardView> {
  int _voteCount = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
      child: SizedBox(
        child: InkWell(
          onTap: () {
            print("card tapped.");
          },
          child: Container(
            padding: const EdgeInsets.all(12),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: const Color.fromARGB(255, 211, 223, 243),
                boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                )
              ]
            ),
            child: Column(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    "Problem Name",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 22,
                      color: Color.fromARGB(255, 60, 58, 58),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Row(
                  children: const [
                    Text(
                      "posted by  -  ",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 12,
                        color: Color.fromARGB(255, 78, 76, 76),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      "email",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 12,
                        color: Color.fromARGB(255, 78, 76, 76),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: const [
                    Icon(Icons.timeline),
                    SizedBox(width: 8,),
                    Text(
                      "time",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 12,
                        color: Color.fromARGB(255, 78, 76, 76),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      " in",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 12,
                        color: Color.fromARGB(255, 78, 76, 76),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      " hostelname",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 12,
                        color: Color.fromARGB(255, 78, 76, 76),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    "Gist of problem...",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 14,
                      color: Color.fromARGB(255, 52, 51, 51),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height*0.005,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.width*0.12,
                      width: MediaQuery.of(context).size.width*0.3,
                      padding: const EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: const [
                          Text(
                            "Pending",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 15,
                              color: Color.fromARGB(255, 78, 76, 76),
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          //SizedBox(height: MediaQuery.of(context).size.height*0.015,),
                          Text(
                            "Status",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 12,
                              color: Color.fromARGB(255, 78, 76, 76),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ), 
                    SizedBox(width: MediaQuery.of(context).size.width*0.1,),
                    SizedBox(
                      width: MediaQuery.of(context).size.width*0.3,
                      height: MediaQuery.of(context).size.width*0.12,
                      //color: Colors.orange,
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _voteCount++;
                          });
                        },
                        style: ElevatedButton.styleFrom(backgroundColor: GlobalColor.mainColor, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.arrow_upward),
                            Text("$_voteCount Upvote",)
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        )
      ),
    );
  }
}