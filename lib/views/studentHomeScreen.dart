import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:querium/views/main_feed.dart';
import 'package:querium/views/new_post.dart';
import 'package:querium/views/profile.dart';
import 'package:querium/utils/global_colors.dart';
import 'package:querium/utils/global_variables.dart';

class StudentHomeScreen extends StatefulWidget{
  const StudentHomeScreen({super.key});

  
  @override
  // ignore: library_private_types_in_public_api
  _StudentHomeScreenState createState() => _StudentHomeScreenState();
}

class _StudentHomeScreenState extends State<StudentHomeScreen>{
  final List post = [
    'post 1',
    'post 2',
    'post 3',
    'post 4',
    'post 5',
    //'post 6',
    //'post 7',
  ];
  // final screens =[
  //   Profile(),
  //   NewPost(),
  //   StudentHomeScreen(),
  // ];

  @override
  Widget build(BuildContext context){
    
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: GlobalColor.mainColor,
        title: const Text('Queries',textAlign: TextAlign.center,),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      backgroundColor: Colors.white,
      body: ListView.builder(
        itemCount: post.length,
        itemBuilder: (context, index){
          return const Post();
        },
      ),

      
      
      bottomNavigationBar:   CurvedNavigationBar(
        height: 60,
        backgroundColor: Colors.white,
        color: GlobalColor.mainColor,
        animationDuration: const Duration(milliseconds: 300),
        onTap: (index){
          if(index==0){

            if(GlobalVariable.preState!= 0){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const StudentHomeScreen()),
            );
            GlobalVariable.preState = 0;

            }
          }
          if(index==1){

            if(GlobalVariable.preState != 1){
               Navigator.push(
                 context,
                 MaterialPageRoute(builder: (context) => const NewPost()),
               );
               GlobalVariable.preState = 1;
              }
          }
          if(index==2){
            if(GlobalVariable.preState != 2){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Profile()),
              );
              GlobalVariable.preState = 2;
            }
          }

          if(index==3){
            if(GlobalVariable.preState != 3){
              
              GlobalVariable.preState = 3;
            }
          }

        },
        items: const[
          Icon(Icons.home, color: Colors.white),
          Icon(Icons.add,color: Colors.white),
          Icon(Icons.person,color: Colors.white),
          Icon(Icons.notification_important_outlined,color: Colors.white,)
        ]),
    );
  }
}
// CurvedNavigationBar(
//         backgroundColor: Colors.white,
//         color: Colors.deepPurple.shade300,
//         animationDuration: const Duration(milliseconds: 300),
//         onTap: (index){
//           if(index==0){
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => const NewPost()),
//             );
//           }
//           if(index==1){
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => const Profile()),
//             );
//           }

//         },
//         items: const[
//           //Icon(Icons.home, color: Colors.white),
//           Icon(Icons.add,color: Colors.white),
//           Icon(Icons.person,color: Colors.white),
//         ]),

//  Container(
//         color: Colors.deepPurple,
//         child:  Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
//           child: GNav(
//             gap: 8,
//             backgroundColor: Colors.deepPurple,
//             color: Colors.white,
//             activeColor: Colors.white,
//             tabBackgroundColor: Colors.grey,
//             padding: EdgeInsets.all(16),
          
//             tabs:const [
              
//               GButton(
//                 //backgroundColor: Colors.grey,
//                 icon: Icons.home,
//                 text: 'home',
//                 ),
//               GButton(
//                 icon: Icons.add_box,
//                 text: 'post',
//               ),
//               GButton(
//                 icon: Icons.person_4,
//                 text: 'profile',
//                 ),
//             ],    
            
//             onTabChange: (index){
//             //  if(index==0){
//             //   Navigator.push(
//             //     context,
//             //     MaterialPageRoute(builder: (context) => const StudentHomeScreen ()),
//             //   );
//             //  }
//             //  if(index==1){
//             //   Navigator.push(
//             //     context,
//             //     MaterialPageRoute(builder: (context) => const NewPost()),
//             //   );
//             //  }
//             //  if(index==2){
//             //   Navigator.push(
//             //     context,
//             //     MaterialPageRoute(builder: (context) => const Profile()),
//             //   );
//             //  }
//             },
//           ),
//         ),
//       ),