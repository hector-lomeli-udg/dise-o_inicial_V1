import 'package:flutter/material.dart';

import 'dart:math';


class TraducirFotosPage extends StatefulWidget {
  const TraducirFotosPage({Key? key}) : super(key: key);

  @override
  _TraducirFotosPageState createState() => _TraducirFotosPageState();
}

class _TraducirFotosPageState extends State<TraducirFotosPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TRADUCIR FOTOS'),
      ),
      body: Stack(
        children: [
          _fondoApp(),
          SingleChildScrollView(
            child: Column(
              children: [
                _tituloDescripcion(),
                _botonSeleccionarArchivo(),
                SizedBox(height: 60.0,),
                _botones(),
                SizedBox(height: 60.0,),
                Text('Aqui mostrara la traduccion del cuadro de texto'),
                SizedBox(height: 60.0,),
                Container(height: 200, width: 200, color: Colors.white,)
              ],
            ),
          ),
        ],
      ),

      bottomNavigationBar: _bottomNavigationBar(context)
    );
  }


  Widget _fondoApp(){
    final gradiente = Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: FractionalOffset(0.0, 0.6), //Se define en que punto inicia el gradiente en la coordenada X y Y  
          end: FractionalOffset(0.0, 1.0),
          colors: [
            Color.fromRGBO(52, 54, 101, 1.0),
            Color.fromRGBO(35, 37, 57, 1.0)
          ]
        )
      ),
    );

    //PARTE DEL ESTILO DE LA CAJA ROSA
    final cajaRosa = Transform.rotate(
      angle: -pi / 5.0, //Para que el angulo del cuadrado se gire 
      child: Container(
        height: 360.0,
        width: 360.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(80.0),
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(236, 98, 188, 1.0),
              Color.fromRGBO(241, 147, 172, 1.0)
            ] 
          ),
        ),
      )
    );
    
    return Stack(
      children: [
        gradiente,
        Positioned( //Sirve para ubicar un elemento con coordenadas especificas
          top: -100.0,
          child: cajaRosa,
        )
      ],
    );
  }

  Widget _tituloDescripcion(){
    return SafeArea(
      child: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Haga click en el boton de seleccionar para poder traducir su foto o imagen al cuadro de texto o mandar a imprimir', style:TextStyle( color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold),),
              SizedBox( height: 10.0),
              //Text('Classify this transaccion into a particular category', style:TextStyle( color: Colors.white, fontSize: 18.0, )),
            ],
          )
      ),
    );
  }



  _botonSeleccionarArchivo(){
    return RaisedButton(
          shape: StadiumBorder(),
          color: Colors.blue,
          textColor: Colors.white,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
            child: Text('Seleccionar Archivo', style: TextStyle(fontSize: 20.0),),
          ),
          onPressed: (){
            //navegar
          },
        );
  }


  Widget _botones(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RaisedButton(
          shape: StadiumBorder(),
          color: Colors.blue,
          textColor: Colors.white,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
            child: Text('Traduccion', style: TextStyle(fontSize: 20.0),),
          ),
          onPressed: (){
            //navegar
          },
        ),
        RaisedButton(
          shape: StadiumBorder(),
          color: Colors.blue,
          textColor: Colors.white,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
            child: Text('Imprimir', style: TextStyle(fontSize: 20.0),),
          ),
          onPressed: (){
            //navegar
          },
        ),
      ],
    );
  }


  Widget _bottomNavigationBar( BuildContext context){ 
  int _botonBarraActual = 0;
  
  List _listaPaginas = [ //Se usara para tomar la posicion del string y usarlo en el navigator
    'menu',
    'traducciones-guardadas',
    'configuracion',
  ];

    return Theme( //LA UNICA FORMA DE CAMBIAR LAS PROPIEDADES DEL BOTTOMNAVIGATIONBAR IMPLICA CAMBIAR EL THEME
      data: Theme.of(context).copyWith(
        canvasColor: Color.fromRGBO(55, 57, 84, 1.0),
        primaryColor: Colors.pinkAccent,
        textTheme: Theme.of(context).textTheme.copyWith(caption: TextStyle ( color: Color.fromRGBO(116, 117, 152, 1.0)))
      ),
      
      child: BottomNavigationBar(

        onTap: (index){ //Al hacer tap obtendra el index de la barra y se ira a la pagina requerida
          setState(() {
            _botonBarraActual = index;
            Navigator.pushNamed(context, _listaPaginas[_botonBarraActual]);
          });
        },

        currentIndex: _botonBarraActual, //se toma el indice actual  

        items: [ //Todos los items de la barra de navegacion
          BottomNavigationBarItem(
            icon: Icon( Icons.calendar_today, size: 30.0,),
            title: Text('Inicio'),
          ),
          BottomNavigationBarItem(
            icon: Icon( Icons.bubble_chart, size: 30.0,),
            title: Text('Trad. Guardadas'),
          ),
          BottomNavigationBarItem(
            icon: Icon( Icons.supervised_user_circle, size: 30.0,),
            title: Text('Configuracion'),
          )
        ], 
      )
    );
  }
}