import 'package:flutter/material.dart';

class AnimacionesPage extends StatelessWidget {
  const AnimacionesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CuadradoAnimado(),
      ),
    );
  }
}

class CuadradoAnimado extends StatefulWidget {
  const CuadradoAnimado({
    Key? key,
  }) : super(key: key);

  @override
  State<CuadradoAnimado> createState() => _CuadradoAnimadoState();
}

class _CuadradoAnimadoState extends State<CuadradoAnimado>
    with SingleTickerProviderStateMixin {
  //Lo extendemos para poder hacer varias animaciones
  late AnimationController animationController; //Controlador de animaciones
  late Animation<double> rotacion; //Indicamos la animacion que hara

  @override
  void initState() {
    //Lo que hara al iniciar
    animationController = AnimationController(
        //El this es para hacer referencia al mismo mixin
        vsync: this,
        duration: const Duration(milliseconds: 4000));
//Creamos la animacion indicando inicio y fin de la rotacion
    rotacion = Tween(begin: 0.0, end: 2.0).animate(animationController);

    super.initState();
  }

  @override
  void dispose() {
    //LO que hara al finalizar
    animationController.dispose(); //Limpiamos el controlador

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    animationController.forward(); //Para darle play a la animacion
    return AnimatedBuilder(
      //Para construir la animacion en la interfaz
      animation: animationController, //Pasamos el controlador
      builder: (BuildContext context, Widget? child) {
        //Indicamos lo que construira
        return Transform.rotate(
            angle: rotacion.value, child: const _Rectangulo());
      },
    );
  }
}

class _Rectangulo extends StatelessWidget {
  const _Rectangulo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      decoration: const BoxDecoration(color: Colors.yellow),
    );
  }
}
