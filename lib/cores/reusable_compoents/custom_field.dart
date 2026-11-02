import 'package:event_app/cores/constant/assets_manger.dart';
import 'package:event_app/cores/constant/colors_manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomField extends StatefulWidget {
  final TextEditingController controller;
  final Widget prefix;
  final bool suffix;
  final String hint;
  final String? Function(String?) validator;

  const CustomField({
    super.key,
    required this.hint,
    required this.prefix,
    required this.validator,
    this.suffix = false,
   required this.controller ,
  });

  @override
  State<CustomField> createState() => _CustomFieldState();
}

class _CustomFieldState extends State<CustomField> {
  bool visible=false;
  @override
  Widget build(BuildContext context) {

    return TextFormField(
      controller: widget.controller,
      validator:widget.validator ,
      style: Theme.of(context).textTheme.titleSmall,
      obscureText: visible,
      decoration: InputDecoration(
        hintText: widget.hint,
        hintStyle: Theme.of(context).textTheme.titleSmall,
        prefixIcon: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 10),
          child: widget.suffix? SvgPicture.asset(AssetsManger.password) :widget.prefix,
        ),
        prefixIconConstraints: const BoxConstraints(
          minWidth: 10,
          minHeight: 10,
        ),
        suffixIcon: widget.suffix
            ? Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: IconButton(
                  icon: Icon(visible?Icons.visibility_off:Icons.visibility),
                  color: Theme.of(context).colorScheme.tertiary,
                  onPressed: () {
                    visible=!visible;
                    setState(() {

                    });
                  },
                ),
              )
            : SizedBox(),
        suffixIconConstraints: const BoxConstraints(
          minWidth: 10,
          minHeight: 10,
        ),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: Theme.of(context).colorScheme.tertiary),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: Theme.of(context).colorScheme.tertiary),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: ColorsManger.Red),
        ),
      ),
    );
  }
}
