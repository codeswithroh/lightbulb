import 'package:flutter/material.dart';
import 'package:torch_controller/torch_controller.dart';

class LightBulbState extends StatefulWidget {
  const LightBulbState({super.key});

  @override
  State<LightBulbState> createState() => __LightBulbStateState();
}

class __LightBulbStateState extends State<LightBulbState> {
  final bgColor = const Color(0xff2C3333);
  final textColor = const Color(0xffE7F6F2);
  var controller = TorchController();
  var isActive = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text('Light Bulb', style: TextStyle(color: textColor)),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(isActive
                      ? 'assets/flash_on.png'
                      : 'assets/flash_off.png'),
                  SizedBox(
                    height: size.height * 0.05,
                  ),
                  CircleAvatar(
                      backgroundColor: Colors.deepPurple,
                      minRadius: 30,
                      maxRadius: 45,
                      child: Transform.scale(
                        scale: 1.5,
                        child: IconButton(
                          onPressed: () {
                            controller.toggle();
                            setState(() {
                              isActive = !isActive;
                            });
                          },
                          icon: Icon(
                            isActive ? Icons.flash_on : Icons.flash_off,
                            color: Colors.white,
                          ),
                        ),
                      ))
                ],
              ),
            ),
          )),
          Text('Developed by codeswithroh',
              style: TextStyle(color: textColor, fontSize: 14)),
          SizedBox(
            height: size.height * 0.05,
          )
        ],
      ),
    );
  }
}
