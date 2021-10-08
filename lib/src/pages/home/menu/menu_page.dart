//import 'dart:js';
import 'package:flutter/material.dart';

import 'dart:ui';
import 'dart:math';


class MenuPage extends StatefulWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _fondoApp(),

          SingleChildScrollView( //SIMILAR A LISTVIEW, LA DIFERENCIA ES QUE ABARCA TODA LA PANTALLA
              child: Column(
                children: [
                  _tituloDescripcion(),
                  _botonesRedondeados(context)
                ],
              ),
            )
        ],
      ),

      bottomNavigationBar: _bottomNavigationBar(context)
    );
  }

  //ESTILO Y FORMA DEL FONDO DE LA PANTALLA
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

  //SECCION DE TEXTO DE INICIO
  Widget _tituloDescripcion(){
    return SafeArea(
      child: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Menu de opciones', style:TextStyle( color: Colors.white, fontSize: 30.0, fontWeight: FontWeight.bold),),
              SizedBox( height: 10.0),
              //Text('Classify this transaccion into a particular category', style:TextStyle( color: Colors.white, fontSize: 18.0, )),
            ],
          )
      ),
    );
  }

  //SECCION DONDE SE LLAMARAN A LAS FUNCIONES DE LOS BOTONES
  Widget _botonesRedondeados(BuildContext context){
    return Table( 
      children: [
        TableRow( 
          children: [
            _crearBotonRedondeado(context, Colors.blue, Icons.text_fields, 'Traducir texto plano', 'traducir-texto'),
          ]
        ),
        TableRow(
          children: [
            _crearBotonRedondeado(context, Colors.green, Icons.folder, 'Traducir documentos', 'traducir-documentos'),
          ]
        ),
        TableRow(
          children: [
            _crearBotonRedondeado(context, Colors.red, Icons.image, 'Traducir texto en imagenes', 'traducir-fotos'),
          ]
        ),
      ],
    );
  }

  //CREACION DE CONTAINERS EN FORMA DE BOTONES EN LA SECCION DEL CUERPO DE LA APLICACION
  Widget _crearBotonRedondeado(BuildContext context, Color color, IconData icono, String texto, String ruta){  
    return //BackdropFilter( //TODO LO QUE QUEDE ATRAS QUEDE COMO BORROSO 
      //filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0), //EL BLUR CONSUME RECURSOS, (POSIBLE ELIMINACION)
      //child: 
      InkWell(
        onTap: (){
           Navigator.pushNamed(context, ruta);
          },
        child: Container(
          height: 140.0,
          margin: EdgeInsets.all(15.0),
          decoration: BoxDecoration(
            color: Color.fromRGBO(62, 66, 107, 0.7),
            borderRadius: BorderRadius.circular(20.0)
          ),
          
          child: Column( 
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(height: 5.0),
              CircleAvatar(
                backgroundColor: color, //SE PONE EL COLOR QUE ESTAMOS RECIBIENDO EN EL PARAMETRO
                radius: 35.0,
                child: Icon(icono, color: Colors.white, size: 30.0,), //SE PONE EL ICONO QUE ESTAMOS RECIBIENDO EN EL PARAMETRO
              ),
              Text(texto, style: TextStyle(color: color),), //SE PONE EL TEXTO Y COLOR QUE ESTAMOS RECIBIENDO EN EL PARAMETRO
              SizedBox(height: 5.0)
            ],
          ),
          
        //),
          ),
      );
  }

  //BARRA INFERIOR DE NAVEGACION
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
