import 'package:flutter/material.dart';

class HeaderCuadrado extends StatelessWidget {
  const HeaderCuadrado({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      color: const Color(0xff615AAB),
    );
  }
}

class HeaderBordeRedondo extends StatelessWidget {
  const HeaderBordeRedondo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: const BoxDecoration(
          color:
              Color(0xff615AAB), //El color debe estar dentro del boxDecoration
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(50),
              bottomRight: Radius.circular(
                  50)) //Agregamos borde en las partes inferiores

          ),
    );
  }
}

class HeaderDiagonal extends StatelessWidget {
  const HeaderDiagonal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        //Para comenzar a pintar
        painter:
            _HeaderDiagonalPainter(), //Recibe instancia de un customPainter
      ),
    );
  }
}

class _HeaderDiagonalPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final lapiz = Paint();
    final path = Path();
    lapiz.color = const Color(0xff615AAB);
    //Indicamos el tipo de rellenado, el stroke solo pinta bordes, el fill rellena todo
    // lapiz.style = PaintingStyle.stroke;
    lapiz.style = PaintingStyle.fill;
    lapiz.strokeWidth = 20;

    path.moveTo(0, size.height * 0.35);

    path.lineTo(size.width, size.height * 0.20);

    path.lineTo(size.width, 0);

    path.lineTo(0, 0);

    // Indicamos al canvas que pinte todos los trazos que hizo, indicando las coordenadas y el lapiz
    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class HeaderTriangulo extends StatelessWidget {
  const HeaderTriangulo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderTrianguloPainter(), //Indicamos lo que va a pintar
      ),
    );
  }
}

class _HeaderTrianguloPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final lapiz = Paint();
    final path = Path();
    lapiz.color = const Color(0xff615AAB);
    lapiz.style = PaintingStyle.fill;

    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);

    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class HeaderPico extends StatelessWidget {
  const HeaderPico({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderPicoPainter(),
      ),
    );
  }
}

class _HeaderPicoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final lapiz = Paint();
    final path = Path();
    lapiz.color = const Color(0xff188AB1);
    lapiz.strokeWidth = 10;
    lapiz.style = PaintingStyle.fill;
    path.lineTo(0, size.height * 0.3);

    path.lineTo(size.width * 0.5, size.height * 0.4);

    path.lineTo(size.width, size.height * 0.3);
    path.lineTo(size.width, 0);

    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class HeaderCurvo extends StatelessWidget {
  const HeaderCurvo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderCurvoPainter(),
      ),
    );
  }
}

class _HeaderCurvoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final lapiz = Paint(); //Pincel
    final path = Path(); //Coordenadas
    lapiz.color = const Color(0xff9018B1);
    lapiz.style = PaintingStyle.fill;
    // lapiz.strokeWidth = 20;

    path.lineTo(0, size.height * 0.2);
    // Para hacer la curva se pone asi: son 4 coordenadas
    // x1,y1,x2,y2
    // Las primeras coordenadas son para pintar el primer trazo con una curva
    // Las ultimas coordenadas son para pintar el otro trazo con una curva
    path.quadraticBezierTo(
        size.width * 0.5, size.height * 0.4, size.width, size.height * 0.2);

    path.lineTo(size.width, 0);

    canvas.drawPath(path, lapiz); //Pinte los trazos
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class HeaderWaves extends StatelessWidget {
  const HeaderWaves({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderWavesPainter(),
      ),
    );
  }
}

class _HeaderWavesPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    //Definimos los colores
    const Gradient gradiente = LinearGradient(
        colors: [Color(0xff6D05E8), Color(0xffC012FF), Color(0xff6d05fa)]);
    final Rect rect =
        Rect.fromCircle(center: const Offset(150, 55), radius: 180);

    final lapiz = Paint()..shader = gradiente.createShader(rect);
    final path = Path(); //Coordenadas
    lapiz.color = const Color(0xff9018B1);
    lapiz.style = PaintingStyle.fill;
    lapiz.strokeWidth = 20;

    path.lineTo(0, size.height * 0.25);
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.30,
        size.width * 0.5, size.height * 0.25);

    path.quadraticBezierTo(
        size.width * 0.75, size.height * 0.20, size.width, size.height * 0.25);

    path.lineTo(size.width, 0);

    canvas.drawPath(path, lapiz); //Pinte los trazos
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
