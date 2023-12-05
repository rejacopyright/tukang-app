import 'package:flutter/material.dart';

class CircleLoader extends StatelessWidget {
  const CircleLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: SizedBox(
          width: 25,
          height: 25,
          child: CircularProgressIndicator(
            color: Theme.of(context).primaryColor,
            strokeWidth: 2,
          ),
        ),
      ),
    );
  }
}

class ChatPageLoader extends StatelessWidget {
  const ChatPageLoader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Center(
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: 10,
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.05),
              borderRadius: BorderRadius.circular(50),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width / 2,
                height: 20,
                margin: const EdgeInsets.only(bottom: 7.5),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 2,
                height: 10,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ],
          )
        ],
      ),
    ));
  }
}
