import 'package:flutter/material.dart';

import '../constant/colors_manger.dart';

class CustomElevatedButton extends StatelessWidget {
  final String text;
  final Function() onTap;
  const CustomElevatedButton({super.key ,required this.text,
  required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return  SizedBox(width: double.infinity,
      child: ElevatedButton(style: ElevatedButton.styleFrom(
          backgroundColor: ColorsManger.primary,
          padding: EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))
      ),
          onPressed: onTap, child: Text(text
            ,style: TextStyle(color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          )

      ),
    )
    ;
  }
}
