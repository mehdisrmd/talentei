import 'package:flutter/material.dart';

class GlobalProfile extends StatelessWidget implements PreferredSizeWidget {
  const GlobalProfile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(3.5),
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xFFE7E8F4), width: 1),
        shape: BoxShape.circle,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(200),
        child: Image.asset(
          'assets/images/profile.png',
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size(50, 50);
}
