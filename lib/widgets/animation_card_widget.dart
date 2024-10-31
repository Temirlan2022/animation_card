import 'package:flutter/material.dart';

class AnimationCardWidget extends StatefulWidget {
  const AnimationCardWidget({super.key});

  @override
  State<AnimationCardWidget> createState() => _AnimationCardState();
}

class _AnimationCardState extends State<AnimationCardWidget> {
  bool isMovedLeft1 = false;
  bool isMovedLeft2 = false;
  bool isMovedLeft3 = false;
  bool firstElement = false;
  bool secondElement = false;
  bool thirdElement = false;
  bool thirdElementSecondState = false;

  double position1 = 0.0; // Начальная позиция первой карточки
  double position2 = 0.0; // Начальная позиция второй карточки
  double position3 = 0.0; // Начальная позиция третьей карточки

  @override
  Widget build(BuildContext context) {
    double thirdElementTopPadding = thirdElement
        ? thirdElementSecondState
            ? MediaQuery.of(context).size.height / 2 - 100
            : MediaQuery.of(context).size.height / 2 - 120
        : MediaQuery.of(context).size.height / 2 - 140;
    double secondElementTopPadding = firstElement
        ? MediaQuery.of(context).size.height / 2 - 100
        : MediaQuery.of(context).size.height / 2 - 120;
    double firstElementTopPadding =
        MediaQuery.of(context).size.height / 2 - 100;

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            child: Container(
              color: Colors.green,
            ),
          ),
          _isThirdCard(context, thirdElementTopPadding),
          _isSecondCard(context, secondElementTopPadding),
          _isFirstCard(context, firstElementTopPadding),
        ],
      ),
    );
  }

  AnimatedPositioned _isFirstCard(
      BuildContext context, double firstElementTopPadding) {
    return AnimatedPositioned(
      left: isMovedLeft1
          ? position1 // Позиция изменяется в зависимости от свайпа
          : MediaQuery.of(context).size.width / 2 - 150,
      top: firstElementTopPadding,
      duration: const Duration(milliseconds: 500),
      child: AnimatedOpacity(
        opacity: isMovedLeft1 ? 0.0 : 1.0,
        duration: const Duration(seconds: 1),
        child: GestureDetector(
          onHorizontalDragUpdate: updatePosition1,
          onHorizontalDragEnd: handleSwipe1,
          child: Container(
            width: 300,
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.black, style: BorderStyle.solid),
              color: Colors.amber,
            ),
          ),
        ),
      ),
    );
  }

  AnimatedPositioned _isSecondCard(
      BuildContext context, double secondElementTopPadding) {
    return AnimatedPositioned(
      left: isMovedLeft2
          ? position2 // Позиция изменяется в зависимости от свайпа
          : secondElement
              ? MediaQuery.of(context).size.width / 2 - 150
              : MediaQuery.of(context).size.width / 2 - 130,
      top: secondElementTopPadding,
      duration: const Duration(milliseconds: 500),
      child: AnimatedOpacity(
        opacity: isMovedLeft2 ? 0.0 : 1.0,
        duration: const Duration(seconds: 1),
        child: GestureDetector(
          onHorizontalDragUpdate: updatePosition2,
          onHorizontalDragEnd: handleSwipe2,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            width: secondElement ? 300 : 260,
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.black, style: BorderStyle.solid),
              color: Colors.amber,
            ),
          ),
        ),
      ),
    );
  }

  AnimatedPositioned _isThirdCard(
      BuildContext context, double thirdElementTopPadding) {
    return AnimatedPositioned(
      left: isMovedLeft3
          ? position3 // Позиция изменяется в зависимости от свайпа
          : thirdElement
              ? thirdElementSecondState
                  ? MediaQuery.of(context).size.width / 2 - 150
                  : MediaQuery.of(context).size.width / 2 - 130
              : MediaQuery.of(context).size.width / 2 - 110,
      top: thirdElementTopPadding,
      duration: const Duration(milliseconds: 500),
      child: AnimatedOpacity(
        opacity: isMovedLeft3 ? 0.0 : 1.0,
        duration: const Duration(seconds: 1),
        child: GestureDetector(
          onHorizontalDragUpdate: updatePosition3,
          onHorizontalDragEnd: handleSwipe3,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            width: thirdElement
                ? thirdElementSecondState
                    ? 300
                    : 260
                : 220,
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.black, style: BorderStyle.solid),
              color: Colors.amber,
            ),
          ),
        ),
      ),
    );
  }

  void updatePosition1(DragUpdateDetails details) {
    setState(() {
      position1 += details.delta.dx;

      // Изменение позиции первой карточки
    });
  }

  void updatePosition2(DragUpdateDetails details) {
    setState(() {
      position2 += details.delta.dx;
      // Изменение позиции второй карточки
    });
  }

  void updatePosition3(DragUpdateDetails details) {
    setState(() {
      position3 += details.delta.dx;
      // Изменение позиции третьей карточки
    });
  }

  void handleSwipe1(DragEndDetails details) {
    if (details.velocity.pixelsPerSecond.dx > 0) {
      setState(() {
        isMovedLeft1 = true;
        position1 = 500; // Сдвинуть вправо
      });
    } else if (details.velocity.pixelsPerSecond.dx < 0) {
      setState(() {
        isMovedLeft1 = true;
        position1 = -500; // Сдвинуть влево
      });
    } else if (details.velocity.pixelsPerSecond.dx == 0) {
      position1 = 0.0;
    }
    isMovedLeft1 = true;
    firstElement = true;
    secondElement = true;
    thirdElement = true;
  }

  void handleSwipe2(DragEndDetails details) {
    if (details.velocity.pixelsPerSecond.dx > 0) {
      setState(() {
        isMovedLeft2 = true;
        position2 = 500; // Сдвинуть вправо
      });
    } else if (details.velocity.pixelsPerSecond.dx < 0) {
      setState(() {
        isMovedLeft2 = true;
        position2 = -500; // Сдвинуть влево
      });
    } else if (details.velocity.pixelsPerSecond.dx == 0) {
      position2 = 0.0;
    }
    isMovedLeft2 = true;
    thirdElementSecondState = true;
  }

  void handleSwipe3(DragEndDetails details) {
    if (details.velocity.pixelsPerSecond.dx > 0) {
      setState(() {
        isMovedLeft3 = true;
        position3 = 500; // Сдвинуть вправо
      });
    } else if (details.velocity.pixelsPerSecond.dx < 0) {
      setState(() {
        isMovedLeft3 = true;
        position3 = -500; // Сдвинуть влево
      });
    } else if (details.velocity.pixelsPerSecond.dx == 0) {
      position3 = 0.0;
    }
    isMovedLeft3 = true;
  }
}
