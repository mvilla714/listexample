// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:listexample/institucion_model.dart';
import 'package:listexample/person_model.dart';

void main() {
  runApp(
    MaterialApp(
      home: MyApp(),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //istanciando institucion.
  Institucion tecsup = Institucion(name: "Tecsup", people: []);

  //instanciando personas
  Person pepe =
      Person(name: "Pepe", address: "Av pepe123", phone: "1234456789");
  Person matias =
      Person(name: "Mathias", address: "avlima 123", phone: "789456132");
  Person maria =
      Person(name: "Maria", address: "AV 123 456", phone: "987654321");
  Person juana = Person(name: "Juana", address: "AV LKJ", phone: "00000000");

  //Lista de personas a partir de nuestra clase person
  List<Person> peopleClassList = [];

  @override
  void initState() {
    super.initState();
    //usando una lista
    peopleClassList.add(pepe);
    peopleClassList.add(matias);
    peopleClassList.add(maria);
    peopleClassList.add(juana);
    //usando atributo people
    tecsup.people.add(pepe);
    tecsup.people.add(matias);
    //tecsup.people.add(maria);
    //tecsup.people.add(juana);
  }

  //lista con nombres
  List<String> names = [
    "Frans",
    "Pedro",
    "Juan",
  ];

  //Función que me devuelve una lista con widgets TEXT(<cada nombre>)
  List<Widget> buildNames() {
    List<Widget> tmp = [];
    names.forEach((String mandarina) {
      tmp.add(Text(mandarina));
    });
    return tmp;
  }

  //Lista de personas, cada persona es un mapa
  List<Map<String, dynamic>> peopleList = [
    {
      "name": "Adrian",
      "address": "av123 123",
      "phone": "123456789",
    },
    {
      "name": "Eddy",
      "address": "Av los arces 456",
      "phone": "987654321",
    },
    {
      "name": "Pedro",
      "address": "av 7 los guiosos",
      "phone": "1111111",
    }
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("My classes"),
          actions: [
            IconButton(
              onPressed: () {
                // peopleClassList = peopleClassList;
                setState(() {});
              },
              icon: Icon(Icons.add),
            ),
          ],
          leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.menu,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              children: [
                Row(
                  // mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("LOS NOMBRES"),
                    IconButton(
                        onPressed: () {
                          /*peopleList.add(
                            {
                              "name": "Pedro",
                              "address": "av larco 123",
                              "phone": "12345798",
                            },
                          );*/
                          tecsup.people.add(Person(
                              name: "Leticia",
                              address: "Calle Juarez 12",
                              phone: "1234451"));
                          setState(() {});
                        },
                        icon: Icon(Icons.add_box))
                  ],
                ),
                Divider(
                  height: 20,
                  thickness: 3,
                  color: const Color.fromRGBO(33, 150, 243, 1),
                ),
                // ...names
                //     .map((e) => Text(e))
                //     .toList(), //Método para agregar lista de nombres a partir del mapeo de la lista
                // ...buildNames(), //funcion que me agrega la lista de nombres con widgets TEXT
                //...peopleClassList
                ...tecsup.people
                    .map(
                      (element) => ListTile(
                        leading: CircleAvatar(
                          child: Text(element.name[0]),
                        ),
                        title: Text(element.name),
                        subtitle: Text(element.address),
                        trailing: Text(element.phone),
                      ),
                    )
                    .toList(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
