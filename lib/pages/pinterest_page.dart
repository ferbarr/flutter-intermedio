// ignore_for_file: missing_required_param, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:pinterest/widgets/pinterest_menu.dart';
import 'package:provider/provider.dart';

class PinterestPage extends StatelessWidget {
  const PinterestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width; //Get ancho del device

    return Scaffold(
        body: ChangeNotifierProvider(
      create: (_) => _MostrarMenu(),
      builder: (context, child) {
        //Para construir un nuevo context porque ya existe un provider instanciado, otra opcion seria usar multiprovider
        return Stack(
          //Retornamo el widget a mostrar
          //Para poder encimar widgets
          children: [
            PinterestGrid(),
            Positioned(
                bottom: 30,
                child: Container(
                  width: width,
                  child: Align(
                    //Widget para alinear
                    alignment: Alignment.center, //Alinear al centro
                    child: PinterestMenu(
                      mostrar: Provider.of<_MostrarMenu>(context)
                          .mostrar, //Le mandamos el valor a la propiedad que recibe el widget PinterestMenu
                    ),
                  ),
                )),
          ],
        );
      },
    ));
  }
}

class PinterestGrid extends StatefulWidget {
  @override
  State<PinterestGrid> createState() => _PinterestGridState();
}

class _PinterestGridState extends State<PinterestGrid> {
  //Creamos la variable items y le generamos 200 datos
  final List<int> items = List.generate(200, (i) => i);
  ScrollController controller =
      ScrollController(); //Para tener acceso al scroll

  double scrollAnterior = 0;

  @override
  void initState() {
    controller.addListener(() {
      //Agregamos listener al controlador
      // print('Scroll listener  ${controller.offset}'); //Mostrar posicion
      if (controller.offset > scrollAnterior && controller.offset > 150) {
        Provider.of<_MostrarMenu>(context, listen: false).mostrar =
            false; //Ocultar menu
      } else {
        Provider.of<_MostrarMenu>(context, listen: false).mostrar =
            true; //Mostrar menu
      }

      scrollAnterior = controller.offset; //Le asignamos el actual
    });

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
      controller:
          controller, //Se lo agregamos, el controller funciona para los widgets que tiene scroll
      crossAxisCount: 4,
      itemCount: items.length, //Indicamos las veces que construira
      itemBuilder: (BuildContext context, int index) => _PinterestItem(
          index), //Lo que construira en este caso sera un contenedor y mandamos paramtro
      staggeredTileBuilder:
          (int index) => //Aqui indicamos el escalonado y tamaño de los items
              StaggeredTile.count(2, index.isEven ? 2 : 3),
    );
  }
}

class _PinterestItem extends StatelessWidget {
  final int index;
  const _PinterestItem(this.index); //Recibimos parametro y se inicializa

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      decoration: const BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.all(Radius.circular(30))),
      child: Center(
        child: CircleAvatar(
          backgroundColor: Colors.white,
          child: Text(
              '$index'), //Se muestra la posicion en la que se encuentre la iteracion
        ),
      ),
    );
  }
}

class _MostrarMenu with ChangeNotifier {
  bool _mostrar = true;
  bool get mostrar => _mostrar; //getter

  set mostrar(bool value) {
    //setter
    _mostrar = value;
    notifyListeners();
  }
}
