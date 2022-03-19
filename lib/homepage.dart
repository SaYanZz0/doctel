// import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:esiproject/widgets/categoriecard.dart';
import 'package:esiproject/widgets/doctorcard.dart';
import 'package:esiproject/widgets/mytitle.dart';
import 'package:esiproject/widgets/search_input.dart';
import 'package:flutter/material.dart';
import 'model/doctors.dart';
import 'package:esiproject/widgets/drawer_widget.dart';
import './widgets/Navigation-bar.dart';

class HomePgae extends StatefulWidget {
  @override
  _HomePgaeState createState() => _HomePgaeState();
  
}

int index = 0;
List<String> cat = [
  'Géneralistes',
  'Radiologues',
  'Pshyciatres',
  'Cardiologues',
  'Pédiatres'
];
List<String> img = [
  'assets/images/stethoscope.png',
  'assets/images/ct-scan.png',
  'assets/images/brain.png',
  'assets/images/cardiogram.png',
  'assets/images/specialist.png'
];
List<Widget> items = [
  const Image(image: AssetImage('assets/images/accueil.png')),
  const Image(image: AssetImage('assets/images/rendez-vous.png')),
  const Image(
    image: AssetImage('assets/images/profil-de-lutilisateur.png'),
  )
];
final _list = Doctor.blog();
final _list2 = Doctor.blog2();

class _HomePgaeState extends State<HomePgae> {
  // const buttomNavBar({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    int selectedIndex = 0;
    List<IconData> data = [
      Icons.home,
      Icons.person_add_alt_1_rounded,
      Icons.list_rounded,
    ];
    return Scaffold(
      backgroundColor: Color.fromARGB(235, 241, 240, 240),
      drawer: drawer_widget(),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
                height: height * 0.07,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(30)),
                child: const SearchInput()),
            const MyTitle(title: 'Categories', fontsize: 25),
            const Padding(padding: EdgeInsets.only(top: 8.0)),
            SizedBox(
              height: height * 0.11,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: cat.length,
                  itemBuilder: (context, index) {
                    return CategorieCard(title: cat[index], image: img[index]);
                  }),
            ),
            const MyTitle(title: 'Top Doctors', fontsize: 25),
            SizedBox(
              height: height * 0.23,
              //width: double.infinity,//MediaQuery.of(context).size.width,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _list.length,
                  itemBuilder: (context, index) {
                    return DoctorCard(doc: _list[index]);
                  }),
            ),
            const MyTitle(title: 'Doctors', fontsize: 25),
            SizedBox(
                height: height * 0.22,
                
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: _list2.length,
                    itemBuilder: (context, index) {
                      return DoctorCard(doc: _list[index]);
                    }))
          ]),
        ),
      )),
      
       
      bottomNavigationBar: Padding(
        
        padding: const EdgeInsets.all(20),
        child: Material(
          elevation: 10,
          borderRadius: BorderRadius.circular(40),
          color: Colors.white,
          shadowColor: Color.fromRGBO(217, 217, 217, 20),
          child: SizedBox(
              height: 50,
              width: double.infinity,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: data.length,
                padding: const EdgeInsets.symmetric(horizontal: 30),
                itemBuilder: (ctx, i) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = i;
                      });
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 250),
                      width: 40,
                      // decoration: BoxDecoration(
                      //   // border: i == selectedIndex
                      //   //     ? const Border(
                      //   //         top: BorderSide(color: Colors.blue, width: 1))
                      //   //     : null,
                      //   // gradient: i == selectedIndex
                      //   //     ? const LinearGradient(
                      //   //         colors: [Colors.blue, Colors.white],
                      //   //         begin: Alignment.topCenter,
                      //   //         end: Alignment.bottomCenter)
                      //       // : null,
                      // ),
                      child: Icon(
                        data[i],
                        color: i == selectedIndex ? Colors.blue : Colors.grey,
                        size: 35,
                      ),
                    ),
                  ),
                ),
              )),
        ),
      ),
    );
  }
}
