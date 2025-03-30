/* * Student Numbers:        221001482,        222043497,                   2221013309,              221014333,            222075927
 * Student Names:  Koena Mosa Ramela, Tshwaro Thothela, Selloane Relebohile Letsoara, Vinjiwe Onica Precious, Lesego Ignician Moutlana
 * Question: Profile Image
 */

import 'package:bookingapp/viewmodels/profile_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
 
 
class ProfileImage extends StatelessWidget {
   final VoidCallback onImagePick;
  
   const ProfileImage({super.key, required this.onImagePick});
 
 
  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileViewModel>(builder: (context, profileViewModel,child) {
   return GestureDetector(
    onTap:onImagePick,
    child: CircleAvatar(
      radius: 50,
      backgroundImage: profileViewModel.image!=null?FileImage(profileViewModel.image!) : const NetworkImage('https://picsum.photos/250?image=9') as ImageProvider,
      child: profileViewModel.image==null?const Icon(Icons.camera_alt,size:50,color:Colors.white,):null ),
   
    );
      
      },
    );
  }
}