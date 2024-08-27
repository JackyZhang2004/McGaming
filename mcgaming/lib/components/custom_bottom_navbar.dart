import 'package:flutter/material.dart';
import 'package:mcgaming/pages/clow_chat.dart';
import 'package:mcgaming/pages/edit_profile.dart';
import 'package:mcgaming/pages/home_page.dart';
import 'package:mcgaming/pages/item_detail_page.dart';
import 'package:mcgaming/pages/my_game_page.dart';
import 'package:mcgaming/pages/play_later.dart';
import 'package:mcgaming/pages/profile.dart';
import 'package:mcgaming/pages/settings.dart';

class CustomBottomNavbar2 extends StatefulWidget {
  CustomBottomNavbar2({super.key});

  @override
  State<CustomBottomNavbar2> createState() => _CustomBottomNavbarState();
}

class _CustomBottomNavbarState extends State<CustomBottomNavbar2> with SingleTickerProviderStateMixin {
    int selectedTab = 0;
    int selectedPage = 0;
    bool isExpanded = false;
    bool isSelectButton = false;
    late AnimationController _animationController;
    late Animation<double> _animation;
    List pages = const[
      HomePage(),
      ProfilePage(),
      MyGame(),
      ClowChat(),
      SettingsPage(),
      PlayLater(),
      EditProfilePage(),
    ];

    void _selectState(int index){
      setState(() {
        selectedTab = index;
      });      
    }

void _resetImageAndClose(BuildContext context) {
    setState(() {
      isSelectButton = false; // Reset gambar ke gambar semula
    });
    Navigator.of(context).pop(); 
   // Close the dialog
  }

void _showLightbox(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      barrierColor: Colors.black54, 
      builder: (BuildContext context) {
        return Center(
          child: GestureDetector(
            onTap: () {
              _resetImageAndClose(context); 
            },
            child: Column(
              children: [
                const Padding(padding: EdgeInsets.only(top: 450)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Container(
                          width: 0,
                          height: 0,
                          padding: const EdgeInsets.all(20.0),
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(100),
                        ),
                        ),
                        const SizedBox(height: 0,),
                        GestureDetector(
                          onTap: (){
                            Navigator.of(context).pop();
                            _selectState(2);
                          },
                          child: Container(
                            width: 90,
                            height: 90,
                            padding: const EdgeInsets.all(20.0),
                            decoration: BoxDecoration(
                              color: const Color(0xFF1A1B1E),
                              borderRadius: BorderRadius.circular(100),
                              boxShadow: [
                                BoxShadow(
                                  color: const Color(0xFFE299FF).withOpacity(1), 
                                  offset: const Offset(0, 7), 
                                  blurRadius: 6, 
                                  spreadRadius: 2, 
                                ),
                              ],
                              border: Border.all(
                              color: const Color(0xFFE299FF), 
                              width: 2.0,  
                            ),
                             image: const DecorationImage(
                                image: AssetImage('lib/images/mygame_icon.png'), 
                                fit: BoxFit.none, 
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 10,),
                    Column(
                      children: [
                        GestureDetector(
                          onTap: (){
                            Navigator.of(context).pop();
                            _selectState(3);
                          },
                          child: Container(
                            width: 90,
                            height: 90,
                            padding: const EdgeInsets.all(20.0),
                            decoration: BoxDecoration(
                              color: const Color(0xFF1A1B1E),
                              borderRadius: BorderRadius.circular(100),
                              boxShadow: [
                                BoxShadow(
                                  color: const Color(0xFFE299FF).withOpacity(1), // Warna bayangan dengan transparansi
                                  offset: const Offset(0, 7), // Mengatur bayangan ke atas objek (x: 0, y: -4)
                                  blurRadius: 6, // Menentukan blur bayangan
                                  spreadRadius: 2, // Menentukan penyebaran bayangan
                                ),
                              ],
                              border: Border.all(
                              color: const Color(0xFFE299FF), // Warna outline
                              width: 2.0,  
                            ),
                             image: const DecorationImage(
                                image: AssetImage('lib/images/clowchat_icon.png'), // Replace with your image path
                                fit: BoxFit.none, // Adjust the fit according to your needs
                              ),
                          ),
                          ),
                        ),
                        const SizedBox(height: 0,),
                        Container(
                          width: 90,
                          height: 90,
                          padding: const EdgeInsets.all(20.0),
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(100),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 10,),
                    Column(
                      children: [
                        Container(
                          width: 0,
                          height: 0,
                          padding: const EdgeInsets.all(20.0),
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(100),
                          ),
                        ),
                        const SizedBox(height: 0,),
                        GestureDetector(
                          onTap: (){
                            Navigator.of(context).pop();
                            _selectState(4);
                          },
                          child: Container(
                            width: 90,
                            height: 90,
                            padding: const EdgeInsets.all(20.0),
                            decoration: BoxDecoration(
                              color: const Color(0xFF1A1B1E),
                              borderRadius: BorderRadius.circular(100),
                              boxShadow: [
                                BoxShadow(
                                  color: const Color(0xFFE299FF).withOpacity(1), // Warna bayangan dengan transparansi
                                  offset: const Offset(0, 7), // Mengatur bayangan ke atas objek (x: 0, y: -4)
                                  blurRadius: 6, // Menentukan blur bayangan
                                  spreadRadius: 2, // Menentukan penyebaran bayangan
                                ),
                              ],
                              border: Border.all(
                                color: const Color(0xFFE299FF), // Warna outline
                                width: 2.0,         // Ketebalan outline
                              ),
                              image: const DecorationImage(
                                image: AssetImage('lib/images/settings_icon.png'), // Replace with your image path
                                fit: BoxFit.none, // Adjust the fit according to your needs
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _toggleImage(){
    setState(() {
      isSelectButton = !isSelectButton;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget activescreen = pages[selectedTab];
     return Scaffold(
      resizeToAvoidBottomInset: false,
        body: SafeArea(child: activescreen),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: SizedBox(
        width: 100,
        height: 100,
        child: FloatingActionButton(
          onPressed: () {
            _toggleImage();
            _showLightbox(context);
          }, // Trigger the lightbox
          backgroundColor: Colors.transparent,
          elevation: 0,
          highlightElevation: 0,
          splashColor: Colors.transparent,
          child: () {
            if (selectedTab == 0) {
              return Container(
                margin: const EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(!isSelectButton
                        ? 'lib/images/clow_idle.png'
                        : 'lib/images/clow_handsup.png'),
                    fit: BoxFit.cover, 
                  ),
                ),
              );
            } else if (selectedTab == 1) {
              return Container(
                margin: const EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(!isSelectButton
                        ? 'lib/images/clow_profile.png'
                        : 'lib/images/clow_handsup.png'),
                    fit: BoxFit.cover, 
                  ),
                ),
              );
            } else if (selectedTab == 2) {
              return Container(
                margin: const EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(!isSelectButton
                        ? 'lib/images/clow_mygame.png'
                        : 'lib/images/clow_handsup.png'),
                    fit: BoxFit.cover, 
                  ),
                ),
              );
            } else if (selectedTab == 3) {
              return Container(
                margin: const EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(!isSelectButton
                        ? 'lib/images/clow_chat.png' // Ganti dengan image untuk case ke-4
                        : 'lib/images/clow_handsup.png'),
                    fit: BoxFit.cover, 
                  ),
                ),
              );
            } else if (selectedTab == 4) {
              return Container(
                margin: const EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(!isSelectButton
                        ? 'lib/images/clow_idle.png' // Ganti dengan image untuk case ke-4
                        : 'lib/images/clow_handsup.png'),
                    fit: BoxFit.cover, 
                  ),
                ),
              );
            }
          }(),
        ),
      ),
        bottomNavigationBar: NavBar(
          pageIndex: selectedTab,
          onTap: (index) {
            if (index == selectedTab) {
              pages[index]
                  .navKey
                  .currentState
                  ?.popUntil((route) => route.isFirst);
            } else {
              _selectState(index);
            }
          },
        ),  
     );  
  }
}

class NavBar extends StatelessWidget {
  final int pageIndex;
  final Function(int) onTap;

  const NavBar({
    super.key,
    required this.pageIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      // elevation: 0.0,
      color: const Color(0xFF1A1B1E),
      height: 70,
        child: Column(
          children: [
            Transform.translate(offset: const Offset(0, -13), child: Container(height: 2, 
            decoration: BoxDecoration(
              color: const Color(0xFFE299FF),
              boxShadow: [
                BoxShadow(
                color: const Color(0xFFE299FF).withOpacity(0.8), // Warna bayangan dengan transparansi
                offset: const Offset(0, -2), // Mengatur bayangan ke atas objek (x: 0, y: -4)
                blurRadius: 5, // Menentukan blur bayangan
                spreadRadius: 2,),
              ],
            ),
            ),),
            Row(
              children: [
                navItem(
                  Icons.home_outlined,
                  pageIndex == 0,
                  onTap: () => onTap(0),
                ),
                const SizedBox(width: 85,),
                navItem(
                  Icons.person_outline,
                  pageIndex == 1,
                  onTap: () => onTap(1),
                ),
              ],
            ),
          ],
        ),
    );
  }

  Widget navItem(IconData icon, bool selected, {Function()? onTap}) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
      child: Column(
  mainAxisSize: MainAxisSize.min,
  children: <Widget>[
    Icon(
      icon,
      size: 40.0, // Set the size of the icon
      color: selected ? const Color(0xFF8A5CF3): const Color(0xFFE299FF), // Set the color of the icon
    ),
    Container(
      width: 24, // Width of the underline (matches icon size for a cleaner look)
      height: 2, // Thickness of the underline
      color: selected ? const Color(0xFFE299FF): const Color(0xFFE299FF).withOpacity(0.0), // Color of the underline
    ),
  ],
),
      )
    );
  }
}
