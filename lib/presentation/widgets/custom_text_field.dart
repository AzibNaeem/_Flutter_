import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String label;
  final String hint;
  final TextEditingController controller;
  final IconData icon;
  final bool isPassword;
  final Color? fillColor;
  final Color? textColor;
  final Color? labelColor;

  const CustomTextField({
    super.key,
    required this.label,
    required this.hint,
    required this.controller,
    required this.icon,
    this.isPassword = false,
    this.fillColor,
    this.textColor,
    this.labelColor,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late FocusNode _focusNode;
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(() {
      setState(() {
        _isFocused = _focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      focusNode: _focusNode,
      obscureText: widget.isPassword,
      style: TextStyle(color: widget.textColor),
      decoration: InputDecoration(
        prefixIcon: Icon(widget.icon, color: widget.labelColor),
        filled: widget.fillColor != null,
        fillColor: widget.fillColor,
        labelText: _isFocused ? null : widget.label,
        labelStyle: TextStyle(color: widget.labelColor),
        hintText: _isFocused ? widget.hint : null,
        hintStyle: TextStyle(color: widget.textColor?.withOpacity(0.6)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}