import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _logo(),
        _actions(),
      ],
    );
  }

  Widget _logo() {
    return Container(
      child: Row(
        children: [
        Padding(
          padding: const EdgeInsets.only(top: 6),
          child: Image.asset("assets/images/youtube.jpeg", width: 70,),
        ),
        Text("Kim's Tube", style: TextStyle(fontWeight: FontWeight.bold),),
        ],
      ),

    );
  }

  Widget _actions() {
    return Row(
      children: [
        GestureDetector(
          onTap: (){},
          child: Container(
            width: 23,
            height: 23,
            child: SvgPicture.asset("assets/svg/icons/bell.svg"),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: GestureDetector(
            onTap: (){},
            child: Container(
              width: 23,
              height: 23,
              child: SvgPicture.asset("assets/svg/icons/search.svg"),
            ),
          ),
        ),
        CircleAvatar(
          backgroundColor: Colors.grey.withOpacity(0.5),
          backgroundImage: Image.network("https://yt3.ggpht.com/ytc/AAUvwnhXW_AiWCgbztaGTQWkpH56AHFhovdMzREKFYHs=s176-c-k-c0x00ffffff-no-rj").image,
        ),
      ],
    );
  }
}
