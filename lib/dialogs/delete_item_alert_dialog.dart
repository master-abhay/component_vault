



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import '../AppColors.dart';
import '../buttons/custom_icon_button_with_text.dart';
import '../mixins & constants/constants.dart';

Future deleteItemAlertDialog({required BuildContext context,String? descriptionText,String? buttonText,required VoidCallback onDelete}) async {
  showDialog(context: context, builder: (context){
    return AlertDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(kCardRadius)),
      title: Text("Confirmation!",style: TextStyle(fontSize: 16),),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(descriptionText ?? "Are you sure you want to delete this item?"),
          Text("This operation cannot be undone.",style: TextStyle(color: AppColors.lightCoral),),
        ],
      ),
      actions: [
        CustomIconButtonWithText(text: buttonText ?? "Delete",color: Colors.red,borderColor: Colors.white,textColor: Colors.white, icon: Icon(CupertinoIcons.delete,size: 16,color: Colors.white,),
            onPressed: onDelete
            ),
        CustomIconButtonWithText(text: "Cancel",color: Colors.white,borderColor: AppColors.stoneGray,textColor: Colors.black, icon: Icon(Icons.cancel_outlined,size: 16,color: Colors.black,), onPressed: (){
          Navigator.of(context).pop();
        }),
      ],
    );
  });
}