//import 'package:diseno_inicial/src/pages/home/widgets/bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

import 'dart:math';




class PoliticasDePrivacidadPage extends StatefulWidget {
  const PoliticasDePrivacidadPage({Key? key}) : super(key: key);

  @override
  _PoliticasDePrivacidadPageState createState() => _PoliticasDePrivacidadPageState();
}

class _PoliticasDePrivacidadPageState extends State<PoliticasDePrivacidadPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('POLITICAS DE PRIVACIDAD'),
      ),

      
      body: Stack(
        children: [
          _fondoApp(),

          SingleChildScrollView( //SIMILAR A LISTVIEW, LA DIFERENCIA ES QUE ABARCA TODA LA PANTALLA
              child: Column(
                children: [
                  _tituloDescripcion(),
                  _textoPoliticasDePrivacidad()
                ],
              ),
            )
        ],
      ),
      bottomNavigationBar: _bottomNavigationBar(context),
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

  //SECCION DE TEXTO DE INICIO
  Widget _tituloDescripcion(){
    return SafeArea(
      child: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Politicas de privacidad de Traduciendo con sentido', style:TextStyle( color: Colors.white, fontSize: 30.0, fontWeight: FontWeight.bold),),
              SizedBox( height: 10.0),
              //Text('Classify this transaccion into a particular category', style:TextStyle( color: Colors.white, fontSize: 18.0, )),
            ],
          )
      ),
    );
  }


  Widget _textoPoliticasDePrivacidad(){
    return Text('Todos los datos que se solicitan a los usuarios a traves de la aplicación para dispositivos móviles seran necesarios y en web opcional para prestar el servicio objeto del servicio en virtud del cual se ha procedido al uso de la aplicación en los correspondientes dispositivos. \n\n  1. CONSENTIMIENTO \n La utilización de la aplicación dará lugar al tratamiento de datos de carácter personal que Traduciendo con sentido, en su caso, llevará a cabo de acuerdo con las normas y procedimientos internos establecidos al efecto, que son conocidos por los usuarios y autorizados por éstos. \n\n  2. GARANTÍA Y PROTECCIÓN DE DATOS\n En el tratamiento de los datos de carácter personal, Traduciendo con sentido se compromete a garantizar y proteger la información o datos fundamentales de las personas, obligándose en este sentido, a efectuar el correspondiente tratamiento de datos de acuerdo con la normativa vigente en cada momento y a guardar el más absoluto secreto en relación con la información entregada por los y usuarios.\n Los datos de carácter personal objeto de tratamiento no se utilizarán para otras finalidades que no se encuentren aquí recogidas. \n\n   3. MODIFICACIONES\n Traduciendo con sentido se reserva el derecho a efectuar las modificaciones que estime oportunas, pudiendo modificar, suprimir e incluir posibles nuevos contenidos y/o servicios, así como la forma en que éstos aparezcan presentados y localizados. \n\n  4. MENORES DE EDAD\n Con carácter general, para hacer uso de los Servicios de la presente aplicación móvil los menores de edad deben haber obtenido previamente la autorización de sus padres, tutores o representantes legales, quienes serán responsables de todos los actos realizados a través de la presente aplicación móvil o web por los menores a su cargo. En aquellos Servicios en los que expresamente se señale. \n\n 5.DURACIÓN Y TERMINACIÓN\n La prestación de los servicios y/o contenidos de la presente aplicación móvil o web tiene una duración indefinida. Sin perjuicio de lo anterior, Traducionedo con sentido está facultada para dar por terminada, suspender o interrumpir unilateralmente, en cualquier momento y sin necesidad de preaviso, la prestación del servicio y de la presente aplicación móvil o web y/o de cualquiera de los servicios, sin perjuicio de lo que se hubiera dispuesto al respecto en las correspondientes condiciones particulares. ');
  }



  Widget _bottomNavigationBar( BuildContext context){ 
  int _botonBarraActual = 2;
  
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