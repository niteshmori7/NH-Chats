import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:nhchat/profile%20message.dart';

void main() {
  runApp(HomeScreen());
}


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _advancedDrawerController = AdvancedDrawerController();

  @override
  Widget build(BuildContext context) {
    return AdvancedDrawer(
      backdrop: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.blue, Colors.blue.withOpacity(1)],
          ),
        ),
      ),
      controller: _advancedDrawerController,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 300),
      animateChildDecoration: true,
      rtlOpening: false,
      // openScale: 1.0,
      disabledGestures: false,
      childDecoration: const BoxDecoration(
        // NOTICE: Uncomment if you want to add shadow behind the page.
        // Keep in mind that it may cause animation jerks.
        // boxShadow: <BoxShadow>[
        //   BoxShadow(
        //     color: Colors.black12,
        //     blurRadius: 0.0,
        //   ),
        // ],
        borderRadius: const BorderRadius.all(Radius.circular(16)),
      ),
      drawer: SafeArea(
        child: Container(
          child: ListTileTheme(
            textColor: Colors.white,
            iconColor: Colors.white,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: 128.0,
                  height: 128.0,
                  margin: const EdgeInsets.only(
                    top: 24.0,
                    bottom: 64.0,
                  ),
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    color: Colors.black26,
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(
                    'assets/aiimage.jpeg',fit: BoxFit.fill,
                  ),
                ),
                ListTile(
                  onTap: () {},
                  leading: Icon(Icons.home),
                  title: Text('Home'),
                ),
                ListTile(
                  onTap: () {},
                  leading: Icon(Icons.account_circle_rounded),
                  title: Text('Profile'),
                ),
                ListTile(
                  onTap: () {},
                  leading: Icon(Icons.favorite),
                  title: Text('Favourites'),
                ),
                ListTile(
                  onTap: () {},
                  leading: Icon(Icons.settings),
                  title: Text('Settings'),
                ),
                Spacer(),
                DefaultTextStyle(
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white54,
                  ),
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                      vertical: 16.0,
                    ),
                    child: Text('Terms of Service | Privacy Policy'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Padding(
            padding: const EdgeInsets.only(top: 35),
            child: const Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Icon(Icons.location_pin,color: Colors.blueAccent,size: 20,),
                ),
                Text("Ahmedabad"),
                Icon(Icons.arrow_drop_down_sharp)
              ],
            ),
          ),
          leading: Padding(
            padding: const EdgeInsets.only(top: 25,left: 20),
            child: IconButton(
              onPressed: _handleMenuButtonPressed,
              icon: ValueListenableBuilder<AdvancedDrawerValue>(
                valueListenable: _advancedDrawerController,
                builder: (_, value, __) {
                  return AnimatedSwitcher(
                    duration: Duration(milliseconds: 250),
                    child: Icon(
                      value.visible ? Icons.clear : Icons.menu,
                      key: ValueKey<bool>(value.visible),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Container(
                height: 48,
                width: 370,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: Colors.black12
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Search....",
                        icon: Icon(Icons.search)
                    ),
                  ),
                ),
              ),
            ),
            SingleChildScrollView(scrollDirection: Axis.horizontal ,
              child: Padding(
                padding: const EdgeInsets.only(top: 40,left: 20,right: 20),
                child: Row(
                  children: [
                    Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image.asset("assets/patang.jpeg",height: 70,width: 70,fit: BoxFit.fill,),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Text("Ahmedabad",style: TextStyle(fontSize: 13 ),),
                        )
                      ],
                    ),
                    SizedBox(
                      width: 17,
                    ),
                    Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image.asset("assets/mumbai.jpeg",height: 70,width: 70,fit: BoxFit.fill,),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Text("Mumbai",style: TextStyle(fontSize: 13 ),),
                        )
                      ],
                    ),
                    SizedBox(
                      width: 17,
                    ),
                    Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image.asset("assets/22.jpeg",height: 70,width: 70,fit: BoxFit.fill,),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Text("Goa",style: TextStyle(fontSize: 13 ),),
                        )
                      ],
                    ),
                    SizedBox(
                      width: 17,
                    ),
                    Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image.asset("assets/haidrabad.jpeg",height: 70,width: 70,fit: BoxFit.fill,),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Text("Haidrabad",style: TextStyle(fontSize: 13 ),),
                        )
                      ],
                    ),
                    SizedBox(
                      width: 17,
                    ),
                    Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image.asset("assets/delhi.jpeg",height: 70,width: 70,fit: BoxFit.fill,),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Text("Delhi",style: TextStyle(fontSize: 13 ),),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 17,top: 30),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Row(
                      children: [
                        alexcarry(context),
                        SizedBox(
                          width: 15,
                        ),
                        alexcarry(context)
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Row(
                      children: [
                        alexcarry(context),
                        SizedBox(
                          width: 15,
                        ),
                        alexcarry(context)
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Row(
                      children: [
                        alexcarry(context),
                        SizedBox(
                          width: 15,
                        ),
                        alexcarry(context)
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
  void _handleMenuButtonPressed() {
    // NOTICE: Manage Advanced Drawer state through the Controller.
    // _advancedDrawerController.value = AdvancedDrawerValue.visible();
    _advancedDrawerController.showDrawer();
  }
}
alexcarry(BuildContext context){
  return Container(
    height: 200,
    width: 170,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: Colors.blueAccent,
    ),
    child: InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=> chmessage()));
      },
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.asset("assets/aiimage.jpeg",height: 80,width: 80,fit: BoxFit.fill,),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text("Alex Carry",style: TextStyle(color: Colors.white),),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Icon(Icons.location_pin,color: Colors.white,size: 13,),
              ),
              Text(" Ahmedabad",style: TextStyle(color: Colors.white),),
            ],
          )
        ],
      ),
    ),
  );
}


