import 'package:flutter/material.dart';

import 'package:diseno_inicial/src/pages/home/menu/traducir_documentos_page.dart';
import 'package:diseno_inicial/src/pages/home/menu/traducir_imagenes_page.dart';
import 'package:diseno_inicial/src/pages/home/menu/traducir_texto_page.dart';

import 'package:diseno_inicial/src/pages/scroll/scroll_page.dart';

import 'package:diseno_inicial/src/pages/home/menu/menu_page.dart';
import 'package:diseno_inicial/src/pages/home/saved_documents/traducciones-guardadas-page.dart';
import 'package:diseno_inicial/src/pages/home/settings/configuracion-page.dart';
//import 'package:flutter/services.dart';





void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    /*SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith( //SIRVE PARA CAMBIAR EL COLOR DE NUESTRA BARRA SUPERIOR DE NUESTRO MOVIL INDEPENDIENTE
      statusBarColor: Colors.white
    ));*/
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Diseños',


      initialRoute: 'scroll',
      routes: {
        //SECCION DE BIENVENIDA
        'scroll' : (BuildContext context) => ScrollPage(),
        //SECCION PRINCIPAL DE TRADUCCIONES
        'traducir-texto' : (BuildContext context) => TraducirTextoPage(),
        'traducir-documentos' : (BuildContext context) => TraducirDocumentosPage(),
        'traducir-fotos' : (BuildContext context) => TraducirFotosPage(),
        //SECCION DE LA BARRA INFERIOR DE LA APLICACION
        'menu' : (BuildContext context) => MenuPage(),
        'traducciones-guardadas' : (BuildContext context) => TraduccionesGuardadasPage(),
        'configuracion' : (BuildContext context) => ConfiguracionPage(),

      }
      
    );
  }
}