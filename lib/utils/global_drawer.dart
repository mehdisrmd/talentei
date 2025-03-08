import 'package:flutter/material.dart';
import 'package:talentei/utils/general_color.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:talentei/utils/global_profile.dart';

class GlobalDrawer extends StatefulWidget {
  const GlobalDrawer({super.key});

  @override
  State<GlobalDrawer> createState() => _GlobalDrawerState();
}

class _GlobalDrawerState extends State<GlobalDrawer>
    with SingleTickerProviderStateMixin {
  bool _isExamsExpanded = false;
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _toggleExpanded() {
    setState(() {
      _isExamsExpanded = !_isExamsExpanded;
      if (_isExamsExpanded) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Builder(
            builder: (context) => IconButton(
              icon: SvgPicture.asset('assets/icons/menu.svg'),
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onPressed: () => Scaffold.of(context).openEndDrawer(),
            ),
          ),
          const SizedBox(width: 15),
        ],
      ),
      endDrawer: Drawer(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
        ),
        backgroundColor: Colors.white,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            SizedBox(
              height: MediaQuery.of(context).viewPadding.top,
            ),
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              height: 78,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      ' امیرسامان شهرتی',
                      textAlign: TextAlign.right,
                      style: const TextStyle(
                        color: GeneralColor.drawerIconColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    GlobalProfile(),
                  ]),
            ),

            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Divider(
                thickness: 2,
                height: 1,
                color: Color(0xFFF6F6F6),
              ),
            ),
            const DrawerListTile(
              icon: 'assets/icons/user.svg',
              title: 'پروفایل من',
            ),
            const DrawerListTile(
              icon: 'assets/icons/lock.svg',
              title: 'تغییر رمز عبور',
            ),
            // Exams item with dropdown
            DrawerListTile(
              icon: 'assets/icons/graduation.svg',
              title: 'آزمون ها',
              trailing: _isExamsExpanded
                  ? Icons.keyboard_arrow_up
                  : Icons.keyboard_arrow_down,
              onTap: _toggleExpanded,
            ),
            // Animated dropdown container
            AnimatedSize(
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeInOut,
              child: Container(
                height: _isExamsExpanded ? null : 0,
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(),
                child: Column(
                  children: [
                    SizeTransition(
                      sizeFactor: _animation,
                      child: _buildDropdownItem('آزمون 1'),
                    ),
                    SizeTransition(
                      sizeFactor: _animation,
                      child: _buildDropdownItem('آزمون 2'),
                    ),
                    SizeTransition(
                      sizeFactor: _animation,
                      child: _buildDropdownItem('آزمون 3'),
                    ),
                  ],
                ),
              ),
            ),
            const DrawerListTile(
              icon: 'assets/icons/graduation.svg',
              title: 'درخواست مشاوره',
            ),
            const DrawerListTile(
              icon: 'assets/icons/group.svg',
              title: 'مقالات علمی',
            ),
            const DrawerListTile(
              icon: 'assets/icons/about.svg',
              title: 'درباره ما',
            ),
            const DrawerListTile(
              icon: 'assets/icons/phone.svg',
              title: 'ارتباط با ما',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDropdownItem(String title) {
    return Padding(
      padding:
          const EdgeInsets.only(left: 16.0, right: 50.0, top: 4.0, bottom: 4.0),
      child: InkWell(
        onTap: () {
          // Handle dropdown item tap
        },
        borderRadius: BorderRadius.circular(12),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 3,
                offset: const Offset(0, 1),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  title,
                  textAlign: TextAlign.right,
                  style: const TextStyle(
                    color: GeneralColor.drawerIconColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(width: 8),
                const Icon(
                  Icons.circle,
                  size: 8,
                  color: GeneralColor.drawerIconColor,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  final String icon;
  final String title;
  final IconData? trailing;
  final VoidCallback? onTap;

  const DrawerListTile({
    super.key,
    required this.icon,
    required this.title,
    this.trailing,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: InkWell(
        onTap: onTap,
        // borderRadius: BorderRadius.circular(12),
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (trailing != null)
                  Icon(
                    trailing,
                    color: GeneralColor.drawerIconColor,
                    size: 20,
                  ),
                Expanded(
                  child: Text(
                    title,
                    textAlign: TextAlign.right,
                    style: const TextStyle(
                      color: GeneralColor.drawerIconColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                SvgPicture.asset(
                  icon,
                  height: 24,
                  width: 24,
                  colorFilter: const ColorFilter.mode(
                    GeneralColor.drawerIconColor,
                    BlendMode.srcIn,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
