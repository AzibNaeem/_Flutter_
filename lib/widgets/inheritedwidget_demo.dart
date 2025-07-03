import 'package:flutter/material.dart';

class ColorProvider extends InheritedWidget {
  final Color color;
  final Function(Color) changeColor;

  const ColorProvider({
    super.key,
    required this.color,
    required this.changeColor,
    required super.child,
  });

  static ColorProvider of(BuildContext context) {
    final ColorProvider? result =
    context.dependOnInheritedWidgetOfExactType<ColorProvider>();
    assert(result != null, 'No ColorProvider found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(ColorProvider oldWidget) {
    return color != oldWidget.color;
  }
}


class InheritedDemo extends StatefulWidget {
  const InheritedDemo({super.key});

  @override
  State<InheritedDemo> createState() => _InheritedDemoState();
}

class _InheritedDemoState extends State<InheritedDemo> {
  Color _color = Colors.green;

  void _toggleColor() {
    setState(() {
      _color = _color == Colors.green ? Colors.blue : Colors.green;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ColorProvider(
      color: _color,
      changeColor: (Color newColor) {
        setState(() {
          _color = newColor;
        });
      },
      child: Scaffold(
        appBar: AppBar(title: const Text('Inherited Widget Demo')),
        body: const Center(
          child: ColorBox(),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _toggleColor,
          child: const Icon(Icons.color_lens),
        ),
      ),
    );
  }
}


class ColorBox extends StatelessWidget {
  const ColorBox({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = ColorProvider.of(context);

    return Container(
      width: 150,
      height: 150,
      color: provider.color,
      alignment: Alignment.center,
      child: const Text(
        'Color Box',
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
  }
}
