import 'package:flutter/material.dart';
import 'customButton.dart';

class Finished extends StatelessWidget {

  final void Function() restart;
  final bool hit;
  final int attempts;
  final int number;

  Finished({
    @required this.restart,
    this.hit = true,
    @required this.attempts,
    this.number
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          hit
            ? 'Acertei o número $number em $attempts palpite(s)!'
            : 'Não consegui advinhar o número, reinicie o jogo!',
            style: TextStyle(
              fontSize: 22,
              color: Colors.white
            ),
        ),
        
        Container(
          margin: EdgeInsets.only(top: 50),
          child: CustomButton(
            colorText: Colors.cyan,
            text: 'REINICIAR',
            size: 24,
            press: () => restart()
          ),
        )
      ]
    );
  }
}