import 'package:flutter/material.dart';

const objColor = Color(0XFF3D2605);

const bgColor = Color(0XFFFFF4AC);

const appBarBgColor = Color(0XFFF4AE30);

const tileColor = Color(0XFFF2A65A);

const titleStyle = TextStyle(
  color: objColor,
  fontWeight: FontWeight.bold,
  fontFamily: 'Oliver',
  fontSize: 30.0,
);

const nameStyle = TextStyle(
  color: objColor,
  fontWeight: FontWeight.bold,
  fontFamily: 'Oliver',
  fontSize: 20.0,
);

const tileNameStyle = TextStyle(
  color: objColor,
  fontWeight: FontWeight.bold,
  fontFamily: 'Oliver',
  fontSize: 16.0,
);

const descStyle = TextStyle(
  color: objColor,
  fontFamily: 'Creamy_Garden',
  fontSize: 16.0,
);

class ButtonDesign extends StatelessWidget {
  final String buttonTitle;


  const ButtonDesign({super.key, required this.buttonTitle});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          child: Theme(
            data: ThemeData(
              iconTheme: const IconThemeData(
                color: Color(0XFF3D2605),
              ),
            ),
            child: const ImageIcon(
              AssetImage("assets/images/_buttonlogo.png"),
            ),
          ),
        ),
        Container(
          alignment: Alignment.center,
          child: Text(
            buttonTitle,
            style: const TextStyle(
              fontSize: 25.0,
              color: objColor,
              fontFamily: 'Oliver',
            ),
          ),
        ),
        Container(
          alignment: Alignment.centerRight,
          child: Theme(
            data: ThemeData(
              iconTheme: const IconThemeData(
                color: objColor,
              ),
            ),
            child: const ImageIcon(
              AssetImage("assets/images/_buttonlogo.png"),
            ),
          ),
        ),
      ],
    );
  }
}

class AppBarDesign extends StatelessWidget with PreferredSizeWidget {
  final String appBarTitle;

  AppBarDesign({super.key, required this.appBarTitle});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        appBarTitle,
        style: const TextStyle(color: Color(0XFF3D2605),
          fontFamily: 'Oliver',
        ),
      ),
      automaticallyImplyLeading: false,
      leading: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: const Icon(Icons.arrow_back),
        color: objColor,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}