import 'package:flutter/material.dart';

main()=>runApp(Estacionamiento());

class Estacionamiento extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return Estado();
      }
    }
    
double primHora= 0;
double fracHora =0;
double total=0;
int iniHora = 0;
int iniMin=0;
int finHora=0;
int finMin=0;

    class Estado extends State{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.red
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Calcular costo de estacionamiento"),
        ),
        body: Column(
          children: <Widget>[
            //caja de texto para precio de hora inicial
            Padding(
              padding: EdgeInsets.all(15),
              child: TextField(
                decoration: InputDecoration(
                  icon: Icon(Icons.attach_money),
                  labelText: "Costo de la 1° hora",
                  hintText: "40",
                  helperText: "Solo ingresa numeros",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10)
                  )
                ),
                onChanged: (cambio){
                  setState(() {
                   primHora= double.parse(cambio); 
                  });
                },
              ),
            ),
            //caja de texto para precio de fraccion de hora
            Padding(
              padding: EdgeInsets.all(15),
              child: TextField(
                decoration: InputDecoration(
                  icon: Icon(Icons.attach_money),
                  labelText: "Costo por fraccion de hora (15 min)",
                  hintText: "10",
                  helperText: "Solo ingresa numeros",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10)
                  )
                ),
                onChanged: (cambio){
                  setState(() {
                   fracHora= double.parse(cambio); 
                  });
                },
              ),
            ),
            //caja de texto para hora de inicio
            Padding(
              padding: EdgeInsets.all(15),
              child: TextField(
                decoration: InputDecoration(
                  icon: Icon(Icons.access_time),
                  labelText: "Hora de inicio",
                  hintText: "16:20",
                  helperText: "No ingreses letras",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10)
                  )
                ),
                onChanged: (cambio){
                  setState(() {
                   List<String> corte = cambio.split(':');
                   iniHora = int.parse(corte[0]);
                   iniMin = int.parse(corte[1]);
                  });
                },
              ),
            ),
            //caja de texto para hora se salida
            Padding(
              padding: EdgeInsets.all(15),
              child: TextField(
                decoration: InputDecoration(
                  icon: Icon(Icons.access_time),
                  labelText: "Hora fin",
                  hintText: "18:00",
                  helperText: "No ingreses letras",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10)
                  )
                ),
                onChanged: (cambio){
                  setState(() {
                   List<String> corte = cambio.split(':');
                   finHora = int.parse(corte[0]);
                   finMin = int.parse(corte[1]);
                  });
                },
              ),
            ),
            //boton de confirmacion
            Padding(
              padding: EdgeInsets.all(15),
              child: FlatButton(
                child: Text("Calcular"),
                onPressed: (){
                  print(iniHora);
                  print(iniMin);
                  print(finHora);
                  print(finMin);
                  setState(() {
                    //calcula total de horas y minutos
                    int totalHora= -iniHora+finHora;
                    int totalMin= -iniMin+finMin;
                    //exepcion de dia siguiente
                    if (totalHora<0){
                      totalHora+=24;
                      totalHora.abs();
                    //exepcion de misma hora
                    } else if (totalHora==0){
                      totalHora++;
                      totalMin=0;
                    }
                    //suma total de primer hora
                    totalHora-= 1;
                    total = primHora;

                    totalMin+= totalHora*60;  //total de horas a minutos
                    double totalFrac = totalMin/15; //calcula fracciones a partir de minutos de estancia
                    int frac = totalFrac.floor(); //redondea las fracciones
                    total+= fracHora*frac;  //calcula y suma monto por fracciones
                    
                  });
                },
                color: Colors.red
              ),
            ),
            Padding(
              padding: EdgeInsets.all(15),
              child: Text("A pagar: $total"),
            )
          ],
        ),
      ),
    );
  }

}