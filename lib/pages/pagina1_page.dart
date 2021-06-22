import 'package:flutter/material.dart';
import 'package:transition_app/pages/pagina2_page.dart';


class Pagina1Page extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pagina 1'),
      ),
      body: Center(
        child: Text('Pagina 1'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.access_time),
        onPressed: (){
          Navigator.push(context, _crearRuta() );
        },
      ),
    );
  }

  Route _crearRuta() {
    

    return PageRouteBuilder(
      pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) =>   Pagina2Page(), 
        // transitionDuration: Duration(seconds: 2), 
        transitionsBuilder: (context, animation, secondaryAnimation, child) {

          final curvedAnimation = CurvedAnimation(parent: animation, curve: Curves.easeInOut);
          // return SlideTransition(
          //   // jugar con el begin  -1 < x,y < 1 
          //   position: Tween<Offset>(begin: Offset(0.0, -1.0), end: Offset(0,0)).animate(curvedAnimation),
          //   child: child,
          // );

          // return ScaleTransition(
          //   scale: Tween<double>(begin: 0.0, end: 1.0).animate(curvedAnimation),
          //   child: child,
          // );

          // return RotationTransition(
          //   child: child,
          //   turns: Tween<double>(begin: 0.0, end: 1).animate(curvedAnimation)
          // );
          return FadeTransition(
            opacity: Tween<double>(begin: 0.0, end: 1).animate(curvedAnimation),
            child: child
          );
        },

      );
  }
}

