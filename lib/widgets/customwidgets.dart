import 'package:flutter/material.dart';

 class CustomBarButton extends StatelessWidget {
   const CustomBarButton({super.key, required this.text, required this.onPressed});
   final String text;
   final VoidCallback onPressed;
   @override
   Widget build(BuildContext context) {
     return ElevatedButton(onPressed: onPressed  , style: ButtonStyle(), child: Text(text, style: TextStyle(color: Colors.black),));
   }
 }
