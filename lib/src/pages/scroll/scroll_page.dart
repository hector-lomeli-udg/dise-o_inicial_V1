import 'package:flutter/material.dart';

import 'package:diseno_inicial/src/pages/login/crear_sesion_page.dart';
import 'package:diseno_inicial/src/pages/login/inicio_sesion_page.dart';



class ScrollPage extends StatelessWidget {
  const ScrollPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView( //PAGEVIEW DONDE SE HACE EL SCROLL
        children: [
          _pagina1(),
          _pagina2(),
          _pagina3(context)
        ],
      )
    );
  }


  //COLOR DE FONDO QUE TENDRA LA SECCION DE SCROLL
  Widget _colorFondo(){
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Color.fromRGBO(108, 192, 218, 1.0),
    );
  }


  //PAGINA 1
  Widget _pagina1() {
    return Stack(
      children: [
        _colorFondo(),
        //_imagenFondo(),
        _textosPagina1(),
      ],
    );
  }




  /* PONER ESTE CODIGO EN CUANTO SE ENCUENTRE ALGUNA FOTO BUENA PARA EL FONDO
  Widget _imagenFondo(){
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Image(
        image: AssetImage('assets/scroll-1.png'),
        fit: BoxFit.cover// sive para que pueda llenar los espacios que no se pudieron llenar
      )
    );
  }
  */


  //CONTENIDO DEL CUERPO DE LA PAGINA 1
  Widget _textosPagina1(){
    final estiloTexto = TextStyle(color: Colors.white, fontSize: 20.0); //estilo para el texto 
    return SafeArea(
      child: Column(
        children: [
          
          Expanded(child: Container()),
          Text('Bienvenido a Traduciendo Con Sentido.', style: estiloTexto,),
          SizedBox(height: 20.0),
          Text('En esta aplicación podras traducir texto convencional a braille, procesar texto de documentos para su traducción al braille, Procesar texto de imágenes para su traducción al braille', style: estiloTexto,),
          Expanded(child: Container()),
          
          Text('Desliza a la derecha', style: estiloTexto,),

          Icon(Icons.keyboard_arrow_right, size: 70.0, color: Colors.white,)
        ],
      ),
    );
  }



  //PAGINA 2
  Widget _pagina2() {
    return Stack(
      children: [
        _colorFondo(),
        //_imagenFondo(),
        _textosPagina2(),
      ],
    );
  }


  //CONTENIDO DEL CUERPO DE LA PAGINA 2
  Widget _textosPagina2(){
    final estiloTexto = TextStyle(color: Colors.white, fontSize: 20.0); //estilo para el texto 
    return SafeArea(
      child: Column(
        children: [
          Expanded(child: Container()),
          Text('No olvide de registrarse para que pueda hacer uso del acceso de sus documentos en linea', style: estiloTexto,),
          Icon(Icons.face_outlined, size: 70.0, color: Colors.white,),
          Expanded(child: Container()),
          Text('Desliza a la derecha', style: estiloTexto,),
          Icon(Icons.keyboard_arrow_right, size: 70.0, color: Colors.white,)
        ],
      ),
    );
  }


  //PAGINA 3
  Widget _pagina3(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Color.fromRGBO(108, 192, 218, 1.0),
      child: Center(
        child: _botonesPagina3(context),
      ),
    );
  }

  //CONTENIDO DEL CUERPO DE LA PAGINA 3
  Widget _botonesPagina3(BuildContext context){
    return Column(
      children: [
        Expanded(child: Container()),
        RaisedButton(
          shape: StadiumBorder(),
          color: Colors.blue,
          textColor: Colors.white,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
            child: Text('Iniciar sesión', style: TextStyle(fontSize: 20.0),),
          ),
          onPressed: (){
            final rutaInicioSesion = MaterialPageRoute(
                builder: (context){
                  return InicioSesionPage();
                }
              );
            Navigator.push( context, rutaInicioSesion);
          },
        ),
        Expanded(child: Container()),
        Divider(height: 20, thickness: 5, indent: 20, endIndent: 20),
        Expanded(child: Container()),
        RaisedButton(
          shape: StadiumBorder(),
          color: Colors.blue,
          textColor: Colors.white,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
            child: Text('Crear cuenta', style: TextStyle(fontSize: 20.0),),
          ),
          onPressed: (){
            final rutaCrearSesion = MaterialPageRoute(
                builder: (context){
                  return CrearSesionPage();
                }
              );
            Navigator.push( context, rutaCrearSesion);
          },
        ),
        Expanded(child: Container()),

      ],
    );
  }
}