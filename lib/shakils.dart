import 'package:flutter/material.dart';

class ShakilAnimation extends StatefulWidget {
  const ShakilAnimation({Key? key}) : super(key: key);

  @override
  State<ShakilAnimation> createState() => _ShakilAnimationState();
}

class _ShakilAnimationState extends State<ShakilAnimation>
    with SingleTickerProviderStateMixin {
  final String _title = 'Staggered Animations';

  // final TextStyle _textStyle =
  // const TextStyle(color: Colors.white, fontSize: 20);
  late AnimationController _animationController;
  late Animation<double> _textAnimation;
  late Animation<double> _opacityAnimation;
  late Animation<double> _avatarAnimation;
  late Animation<double> _iconAnimation;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 5));
    _textAnimation = Tween<double>(begin: 0, end: 20).animate(CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0, 0.2, curve: Curves.bounceInOut)));
    _avatarAnimation = Tween<double>(begin: 0, end: 20).animate(CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.2, 0.4, curve: Curves.bounceInOut)));
    _iconAnimation = Tween<double>(begin: 0.0, end: 40.0).animate(
        CurvedAnimation(
            parent: _animationController,
            curve: const Interval(0.4, 0.6, curve: Curves.fastOutSlowIn)));
    _opacityAnimation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.6, 1.0, curve: Curves.bounceInOut)));
    _animationController.forward();
    _animationController.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var items = [
      1,
      2,
      3,
      4,
      5,
      6,
      7,
      8,
      9,
      10,
      11,
      12,
      13,
      14,
      15,
      1,
      2,
      3,
      4,
      5,
      6,
      7,
      8,
      9,
      10,
      11,
      12,
      13,
      14,
      15
    ];
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        appBar: AppBar(
          title: Text(
            _title,
            style: TextStyle(
                fontSize: _textAnimation.value, fontWeight: FontWeight.bold),
          ),
          // centerTitle: true,
          backgroundColor: Colors.deepPurple,
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: CircleAvatar(
                backgroundImage:
                    const AssetImage('assets/images/my_picture.jpg'),
                radius: _avatarAnimation.value,
              ),
            )
          ],
        ),
        body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              // tileColor: Colors.grey,
              title: Opacity(
                opacity: _opacityAnimation.value,
                child: Text(
                  'My Index is ${items[index]}',
                  style: TextStyle(
                    color: Colors.teal,
                    fontWeight: FontWeight.bold,
                    fontSize: _textAnimation.value,
                  ),
                ),
              ),
              onTap: () {
                // setState(() {});
              },
              // shape: MyShapeBorder());
              trailing: Icon(
                Icons.person,
                color: Colors.green,
                size: _iconAnimation.value,
              ),
            );
          },
        ),
      ),
    );
  }
}
