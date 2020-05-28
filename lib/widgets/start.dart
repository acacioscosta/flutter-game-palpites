import 'package:flutter/material.dart';
import './customButton.dart';

class Start extends StatelessWidget {

  final void Function() _start;

  Start(this._start);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 50),
      child: Column(
        children: [
          Text(
            'Instruções:',
            style: TextStyle(
              fontSize: 22,
              color: Colors.white
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(10, 20, 10, 50),
            child: Column(
              children: [
                Text(
                  '1. Vou advinhar o número que você pensou',
                  style: TextStyle(
                    fontSize: 18,
                    height: 2,
                    color: Colors.white
                  ),
                ),
                Text(
                  '2. O número precisa ser entre 0 e 1000',
                  style: TextStyle(
                    fontSize: 18,
                    height: 2,
                    color: Colors.white
                  ),
                ),
                Text(
                  '3. Agora clique em INICIAR',
                  style: TextStyle(
                    fontSize: 18,
                    height: 2,
                    color: Colors.white
                  ),
                )
              ]
            )
          ),
          CustomButton(
            colorText: Colors.cyan,
            text: 'INICIAR',
            size: 24,
            press: () => _start()
          )
        ],
      ),
    );
  }
}