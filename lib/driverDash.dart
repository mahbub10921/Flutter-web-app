import 'package:dako/userDash.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class BlinkingButton extends StatefulWidget {
  BlinkingButton();

  @override
  _BlinkingButtonState createState() => _BlinkingButtonState();
}

class _BlinkingButtonState extends State<BlinkingButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _opacityAnimation;
  late bool _shouldBlink;

  @override
  void initState() {
    super.initState();
    _shouldBlink = true;
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )..repeat(reverse: true);

    _opacityAnimation = Tween<double>(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // bool hasValue = widget.object != null;

    return Scaffold(
        drawer: Navbar(),
        appBar: AppBar(
          title: Text('Dako'),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'kamal@gmail.com',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
          backgroundColor: Colors.black,
        ),
        body: Visibility(
          // visible: hasValue,

          child: Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: Center(
              child: Container(
                child: AnimatedBuilder(
                  animation: _opacityAnimation,
                  builder: (context, child) {
                    return Opacity(
                      opacity: _opacityAnimation.value,
                      child: child,
                    );
                  },
                  child: Column(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamedAndRemoveUntil(
                              context, "request", (route) => true);
                          setState(() {
                            _animationController.stop();
                            _shouldBlink = false;
                          });
                          // showAlert(context);
                        },
                        child:
                            Text(_shouldBlink ? 'Incoming Request' : 'Running'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}

class Request extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
          'Mahbubul Haque \n 01537263505 \n Pickup:Khilgaon Railgate \n Dropup: Banani Graveyard \n Fare : BDT 220'),
      // content: Text('Modal Content'),
      actions: [
        TextButton(
          child: Text('Confirm'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: Text('Cancel'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
