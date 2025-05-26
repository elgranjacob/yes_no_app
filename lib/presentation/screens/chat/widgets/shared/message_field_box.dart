import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  final ValueChanged<String> onValue;
  const MessageFieldBox({super.key, required this.onValue});

  @override
  Widget build(BuildContext context) {

    final FocusNode focusNode = FocusNode();

    final textController = TextEditingController();


    final outlineInputBorder = UnderlineInputBorder(
      borderSide: const BorderSide(color: Colors.transparent),
      borderRadius: BorderRadius.circular(20)
    );

    final inputDecoration = InputDecoration(
        hintText: 'End your Message with a "?"',
        enabledBorder: outlineInputBorder,
        focusedBorder: outlineInputBorder,
        filled: true,
        suffixIcon: IconButton(
          icon:Icon(Icons.send_and_archive_outlined),
          onPressed: () {
            final textValue =  textController.value.text;
           // print('button: $textValue');
            textController.clear();
            onValue(textValue);
          },
        )
      );

    return TextFormField(
      onTapOutside: (event) {
        focusNode.unfocus();
      },
      focusNode: focusNode,
      controller: textController,
      decoration: inputDecoration,
      onFieldSubmitted: (value) {
        //print("Submit value $value");
        textController.clear();
        focusNode.requestFocus();
        onValue(value);
      },
    );
  }
}