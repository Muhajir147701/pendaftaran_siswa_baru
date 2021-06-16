part of 'widgets.dart';

class FieldTextInput extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String label;

  FieldTextInput(this.controller, this.hintText, this.label);
  @override
  Widget build(BuildContext context) {
    return TextField(
        controller: controller,
        decoration: InputDecoration(
            hintText: hintText,
            labelText: label,
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10))));
  }
}
