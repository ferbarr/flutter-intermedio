// ignore_for_file: avoid_unnecessary_containers, unnecessary_getters_setters, use_key_in_widget_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PinterestButton {
  //Para las opciones del menu
  final Function() onPressed;
  final IconData icon;
  //Incializamos
  PinterestButton({required this.onPressed, required this.icon});
}

class PinterestMenu extends StatelessWidget {
  final bool mostrar;
  PinterestMenu({this.mostrar = true});
  final List<PinterestButton> items = [
    //Definir las opciones del menu
    PinterestButton(
        onPressed: () {
          print('pie');
        },
        icon: Icons.pie_chart),
    PinterestButton(
        onPressed: () {
          print('search');
        },
        icon: Icons.search),
    PinterestButton(
        onPressed: () {
          print('notifications');
        },
        icon: Icons.notifications),
    PinterestButton(
        onPressed: () {
          print('supervised');
        },
        icon: Icons.supervised_user_circle),
  ];

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _MenuModel(), //Instanciamos
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 250),
        opacity:
            (mostrar) ? 1 : 0, //La opacidad ambiara dependiendo a la condicion
        child: Container(
          //El opacity debe envolver al container
          width: 250,
          height: 60,
          decoration: const BoxDecoration(
              //Decoracion
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(100)),
              boxShadow: [
                //Sombreado
                BoxShadow(
                    color: Colors.black38, blurRadius: 10, spreadRadius: -5)
              ]),
          child: _MenuItems(items),
        ),
      ),
    );
  }
}

class _MenuItems extends StatelessWidget {
  final List<PinterestButton> menuItems;
  const _MenuItems(this.menuItems); //Inicializamos el paramtro recibido

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly, //Espaciado
        children: List.generate(
            //Va generar una lista de _PinterestButton y mandamos de paramtro el numero de la iteacion y la poscion del arreglo
            menuItems.length,
            (i) => _PinterestMenuButton(i, menuItems[i])));
  }
}

class _PinterestMenuButton extends StatelessWidget {
  final int index;
  final PinterestButton item;
  const _PinterestMenuButton(this.index, this.item);

  @override
  Widget build(BuildContext context) {
    //Obtenemos la info del item seleccionado
    final itemSelected = Provider.of<_MenuModel>(context).itemSelected;
    return GestureDetector(
      //Para poder agregar un onTap
      onTap: () {
        Provider.of<_MenuModel>(context, listen: false).itemSelected =
            index; //Le pasamos al setter la posicion actual del item
        item.onPressed(); //Ejecutamos la funcion que viene de parametro
      },
      behavior: HitTestBehavior.translucent, //Para que no falle el gesture
      child: Container(
          child: Icon(
              //Mostramos el icono que viene en el parametro
              item.icon,
              size: (itemSelected == index)
                  ? 30
                  : 25, //Cambiamos el tamaño del icono si es el mismo seleccionado
              color: (itemSelected == index)
                  ? Colors.red.shade800
                  : Colors
                      .blueGrey //Condocionamos que si se encuentra el itemSelected en la misma posicion, tenga un color distinto
              )),
    );
  }
}

class _MenuModel with ChangeNotifier {
  int _itemSelected = 0;
  int get itemSelected => _itemSelected; //Getter

  set itemSelected(int value) {
    //Setter
    _itemSelected = value;
    notifyListeners(); //Notificamos cambio
  }
}
