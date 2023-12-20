import 'package:flutter/material.dart';

class ButtonImageFb1 extends StatelessWidget {
  final String text;
  final Function() onPressed;
  const ButtonImageFb1({required this.text, required this.onPressed, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: AspectRatio(
        aspectRatio: 208 / 71,
        child: Container(
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
                offset: const Offset(0, 4),
                color: const Color(0x004960f9).withOpacity(0.3),
                spreadRadius: 4,
                blurRadius: 50)
          ]),
          child: MaterialButton(
            onPressed: onPressed,
            splashColor: Colors.lightBlue,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(36)),
            padding: const EdgeInsets.all(0.0),
            child: Ink(
                decoration: BoxDecoration(
                  //gradient:
                  image: const DecorationImage(
                    image: NetworkImage(
                        'https://firebasestorage.googleapis.com/v0/b/flutterbricks-public.appspot.com/o/finance_app_2%2FbuttonBackgroundSmall.png?alt=media&token=fa2f9bba-120a-4a94-8bc2-f3adc2b58a73'),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(36),
                ),
                child: Container(
                    constraints: const BoxConstraints(
                        minWidth: 88.0,
                        minHeight: 36.0), // min sizes for Material buttons
                    alignment: Alignment.center,
                    child: Text(text,
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w300)))),
          ),
        ),
      ),
    );
  }
}

class BouncingButton extends StatefulWidget {
  final String text;
  final VoidCallback onTap;
  const BouncingButton({
    super.key,
    required this.onTap,
    required this.text,
  });

  @override
  State<BouncingButton> createState() => _BouncingButtonState();
}

class _BouncingButtonState extends State<BouncingButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final Duration _animationDuration = const Duration(milliseconds: 300);
  final Tween<double> _tween = Tween<double>(begin: 1.0, end: 0.95);
  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: _animationDuration,
    )..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _controller.forward().then((_) {
          _controller.reverse();
        });
        widget.onTap();
      },
      child: ScaleTransition(
        scale: _tween.animate(
          CurvedAnimation(
            parent: _controller,
            curve: Curves.easeOut,
            reverseCurve: Curves.easeIn,
          ),
        ),
        child: Container(
          height: 50,
          width: 400,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Colors.blue,
          ),
          //says undefined name 'text
          child: Text(widget.text,
              style: const TextStyle(fontSize: 18, color: Colors.white)),
        ),
      ),
    );
  }
}
