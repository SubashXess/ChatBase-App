import 'package:chatbase_app/Components/showSnackBar.dart';
import 'package:chatbase_app/Styles/shadowstyle.dart';
import 'package:chatbase_app/Styles/textstyle.dart';
import 'package:chatbase_app/constants.dart';
import 'package:flutter/material.dart';

class NameField extends StatefulWidget {
  final Function(String name) onChanged;
  const NameField({Key? key, required this.onChanged}) : super(key: key);

  @override
  State<NameField> createState() => _NameFieldState();
}

class _NameFieldState extends State<NameField> {
  final TextEditingController _nameController = TextEditingController();

  @override
  void initState() {
    _nameController.addListener(onListen);
    super.initState();
  }

  @override
  void dispose() {
    _nameController.removeListener(onListen);
    _nameController.dispose();
    super.dispose();
  }

  void onListen() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
      width: size.width * 0.8,
      decoration: BoxDecoration(
        boxShadow: [boxShadowStyle(kPrimaryDeepColor.withOpacity(0.4))],
        color: kPrimaryLightColor,
        borderRadius: BorderRadius.circular(29.0),
      ),
      child: TextFormField(
        controller: _nameController,
        style: textStyleSimple(kPrimaryColor, 16.0, FontWeight.normal),
        decoration: InputDecoration(
          hintText: 'Enter Name',
          hintStyle:
              textStyleSimple(kPrimaryDeepLightColor, 16.0, FontWeight.w400),
          errorStyle:
              textStyleSimple(kPrimaryDeepColor, 12.0, FontWeight.normal),
          border: InputBorder.none,
          errorBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          prefixIcon: const Icon(Icons.person_rounded, color: kPrimaryColor),
          suffixIcon: _nameController.text.isEmpty
              ? Container(width: 0.0)
              : IconButton(
                  onPressed: () => _nameController.clear(),
                  icon: const Icon(Icons.close_rounded, color: kPrimaryColor)),
          // const Icon(Icons.close_rounded, color: kPrimaryColor),
        ),
        keyboardType: TextInputType.name,
        cursorColor: kPrimaryDeepColor,
        autofillHints: const [AutofillHints.name],
        textCapitalization: TextCapitalization.words,
        validator: validateName,
        onChanged: widget.onChanged,
      ),
    );
  }

  String? validateName(String? value) {
    if (value!.isEmpty) {
      // showSnackBar(context, 'Required name');
      return 'Required name';
    } else if (value.length < 4) {
      // showSnackBar(context, 'Enter valid name');
      return 'Enter valid name';
    } else if (value.length > 20) {
      // showSnackBar(context, 'Your name is too long');
      return 'Your password is too long';
    } else {
      return null;
    }
  }
}
