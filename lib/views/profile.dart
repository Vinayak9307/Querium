// ignore_for_file: non_constant_identifier_names, override_on_non_overriding_member

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:querium/views/drawer.dart';
import 'package:querium/views/pending_complaints.dart';
import 'package:querium/views/solved_complaints.dart';
import 'package:querium/utils/global_colors.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}


class _ProfileState extends State<Profile> {

    //these variable gives informaation about the user
    
    String Name = "Prashant";
    String RegNO = "2022CA067";
    String Hostel = "Tilak";
    int RoomNO = 335;

  //this is a controller for editing the hostel name or Room no
  late TextEditingController controller;

  //this overrides the state of hostel name or Room no when user edits it
  @override
  void initState(){
    super.initState();

    controller  = TextEditingController();
  }
  void onTapPending(){
    Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PendingComplaints()),
              );
  }
  void onTapsolved(){
    Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PendingComplaints()),
              );
  }

  @override
  void dispose(){
    controller.dispose();
    super.dispose();
  }

  //this is a controller for editing the hostel name or Room no
  late TextEditingController controller1;

  //this overrides the state of hostel name or Room no when user edits it
  @override
  void initState2(){
    super.initState();

    controller1  = TextEditingController();
  }

  @override
  void dispose2(){
    controller.dispose();
    super.dispose();
  }
  
  //this metthod will be called when user presses the edit icon of hostel name or Room no and it will return a new entry
  Future <String?> _onEditPressed(var flag)=>
    
    //a pop up box would be opened for the user to write the new hostel name or Room no
    showDialog<String>(context: context, builder:(context)=>
      AlertDialog(
          title: flag == 1 ? const Text('Hostel name'): const Text('Room No.'),

        //this is the text field for filling the new hostel name or Room no
        content: TextField(
          autofocus: true,
          decoration: flag == 1 ? const InputDecoration(hintText: 'Enter hostel name'): const InputDecoration(hintText: 'Enter Room No.'),
          controller: controller,
        ),
        
        //action for submit button of pop up
        actions: [
          TextButton(
            child: const Text('Submit'),
            onPressed: () {
              submitHostel();
            },
          ),
        ],  
      )
    );

  @override
  Widget build(BuildContext context) {
    
;    return Scaffold(
      //appbar
      appBar: AppBar(
        backgroundColor: GlobalColor.mainColor,
        
        title: const Text('Profile',textAlign: TextAlign.center, style:TextStyle(fontWeight: FontWeight.w600) ),
        
        centerTitle: true,
        
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            //for spacing
            const SizedBox(height: 50,),

            //this stack contains the profile image and its edit option 
            Stack(
              children: [
                SizedBox(
                  width: 120,
                  height:120,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),child: const Image(image: AssetImage("assets/images/index.png")),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                    child: Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(100), color: GlobalColor.mainColor),
                      child: GestureDetector(
                          child: const Icon(Icons.camera_alt_outlined,color: Colors.white,),
                          onTap: () {
                          },
                    ),
                    ),
                ),
              ],
            ),
            //for spacing
            const SizedBox(height: 20,),
            Text(Name,style: TextStyle(fontFamily: GoogleFonts.poppins().fontFamily,fontSize: 20)),
            //for spacing
            const SizedBox(height: 5,),
            Text(RegNO,style: TextStyle(fontFamily: GoogleFonts.poppins().fontFamily,fontSize: 20)),
            //for spacing
            const SizedBox(height: 70,),
            
            //this row contains the buttons to see complaints filed and complaints resolved
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              
              children: [
                
                complaintsButton(4, 'complaints pending', onTapPending, false),
                complaintsButton(5, 'complaints solved', onTapsolved, false),
                
              ],
            ),
            //for spacing
            const SizedBox(height: 30,),

            //this is a card which contains listtile of hostel
            Card(
              elevation: 5,
              child: ListTile(
                leading: const Icon(Icons.home_outlined , size: 30,),
                subtitle: Text(Hostel,style: const TextStyle(fontWeight: FontWeight.bold,fontSize:20)),
                title: const Text('Hostel' , ),
                trailing: GestureDetector(
                      child: const Icon(Icons.edit),
                      onTap: () async {
                        final Hostel = await _onEditPressed(1);

                        if(Hostel == null || Hostel.isEmpty) return;

                        setState(()=>this.Hostel = Hostel);
                      },
                ),
              ),
            
            ),

            //for spacing
            const SizedBox(height: 30,),

            //this is a card which contains listtile of hostel
            Card(
              elevation: 5,
              child: ListTile(
                leading: const Icon(Icons.location_on_outlined , size: 30,),
                subtitle: Text(RoomNO.toString(),style: const TextStyle(fontWeight: FontWeight.bold,fontSize:20)),
                title: const Text('Room no.' ),
                trailing: GestureDetector(
                      child: const Icon(Icons.edit),
                      
                      onTap: () async {
                        final RoomNO = await _onEditPressed(2);

                        if(RoomNO == null || RoomNO.isEmpty) return;

                        setState(()=>this.RoomNO = int.parse(RoomNO));
                      },

                ),
              ),
            ),

            const Divider(),
          ],
        ),
      ),
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Container(
            child:Column(
              children: const [
                MyDrawer(), 
              ],
            ),
          ),
        ),
      ),
    );
  }

  //this method is getting called to display the complaint buttons
  SizedBox complaintsButton(number ,text , onTap ,isLoading) {
    return SizedBox(
        width: 185,
        height: 50,
        child: ElevatedButton(
          
                    onPressed: onTap,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: GlobalColor.mainColor,
                      //minimumSize: MediaQuery.of(context).size.width,
                      // minimumSize: const Size.fromHeight(10),
                      // maximumSize: const Size.fromHeight(50),
                    ),
                    child: isLoading
                ? const Center(
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  )
                : Column(
                      children: [
                        Text(number.toString(), style: TextStyle(fontFamily: GoogleFonts.poppins().fontFamily,fontSize: 15)),
                        Text(text, style: TextStyle(fontFamily: GoogleFonts.poppins().fontFamily,fontSize: 15)),
                      ],
                    ),
                  ),
      
    );
  }
  
  //this is the submit button for new hostel name or room no. 
  //it distroy's the pop up for new hostel name or room no. and returns the new entry
  void submitHostel() {
    Navigator.of(context).pop(controller.text);
    controller.clear();
  }

  
}