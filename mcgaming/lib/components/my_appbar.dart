import 'package:flutter/material.dart';

class MyAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const MyAppbar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0XFF1A1B1E),
       leading: null,  // Menonaktifkan tombol default di sebelah kiri
      automaticallyImplyLeading: false, 
      title: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(
                  'lib/images/logo_mcgaming.png',
                  width: 100.0,
                  height: 100.0,
                ),
                const SizedBox(width: 10),
              ],
            ),
            const SizedBox(
              width: 200.0,
              height: 40.0,
              child: TextField(
                style: TextStyle(
                  color: Colors.white,
                ),
                decoration: InputDecoration(
                  hintText: "Search something",
                  hintStyle: TextStyle(
                    color: Color(0xffBAB0B0),
                    fontWeight: FontWeight.normal,
                  ),
                  filled: true,
                  fillColor: Color(0xff1A1B1E),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    borderSide: BorderSide(
                      color: Color(0xffE299FF),
                      width: 1.5,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    borderSide: BorderSide(
                      color: Color(0xffE299FF),
                      width: 2.0,
                    ),
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 0.0, horizontal: 16.0),
                ),
              ),
            ),
          ],
        ),
      ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(10.0),
        child: Container(
          decoration: const BoxDecoration(
            color: Color(0xffE299FF),
            boxShadow: [
              BoxShadow(
                color: Color(0xffE299FF),
                offset: Offset(0, 3),
                blurRadius: 4.0,
              ),
            ],
          ),
          height: 2.0,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 2.0);
}
