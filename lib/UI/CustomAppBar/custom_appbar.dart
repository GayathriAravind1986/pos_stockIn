import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple/Bloc/demo/demo_bloc.dart';
import 'package:simple/Reusable/color.dart';
import 'package:simple/Reusable/text_styles.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final int selectedIndex;
  final Function(int) onTabSelected;
  final VoidCallback onLogout;
  const CustomAppBar({
    super.key,
    required this.selectedIndex,
    required this.onTabSelected,
    required this.onLogout,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => DemoBloc(),
      child: CustomAppBarView(
        selectedIndex: selectedIndex,
        onTabSelected: onTabSelected,
        onLogout: onLogout,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(70);
}

class CustomAppBarView extends StatefulWidget {
  final int selectedIndex;
  final Function(int) onTabSelected;
  final VoidCallback onLogout;
  const CustomAppBarView({
    super.key,
    required this.selectedIndex,
    required this.onTabSelected,
    required this.onLogout,
  });

  @override
  CustomAppBarViewState createState() => CustomAppBarViewState();
}

class CustomAppBarViewState extends State<CustomAppBarView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    Widget mainContainer() {
      return AppBar(
        backgroundColor: whiteColor,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Container(
          margin: EdgeInsets.only(left: 10),
          child: Row(
            children: [
              Text(
                "Alagu Drive In",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: appPrimaryColor,
                ),
              ),
              SizedBox(width: size.width * 0.2),
              Row(
                children: [
                  TextButton.icon(
                    onPressed: () => widget.onTabSelected(0),
                    icon: Icon(
                      Icons.home_outlined,
                      size: 30,
                      color: widget.selectedIndex == 0
                          ? appPrimaryColor
                          : greyColor,
                    ),
                    label: Text(
                      "Home",
                      style: MyTextStyle.f16(
                        weight: FontWeight.bold,
                        widget.selectedIndex == 0 ? appPrimaryColor : greyColor,
                      ),
                    ),
                  ),
                  SizedBox(width: 16),
                  TextButton.icon(
                    onPressed: () => widget.onTabSelected(1),
                    icon: Icon(
                      Icons.shopping_cart_outlined,
                      size: 30,
                      color: widget.selectedIndex == 1
                          ? appPrimaryColor
                          : greyColor,
                    ),
                    label: Text(
                      "Orders",
                      style: MyTextStyle.f16(
                        weight: FontWeight.bold,
                        widget.selectedIndex == 1 ? appPrimaryColor : greyColor,
                      ),
                    ),
                  ),
                  SizedBox(width: 16),
                  TextButton.icon(
                    onPressed: () => widget.onTabSelected(2),
                    icon: Icon(
                      Icons.note_alt_outlined,
                      size: 30,
                      color: widget.selectedIndex == 2
                          ? appPrimaryColor
                          : greyColor,
                    ),
                    label: Text(
                      "Report",
                      style: MyTextStyle.f16(
                        weight: FontWeight.bold,
                        widget.selectedIndex == 2 ? appPrimaryColor : greyColor,
                      ),
                    ),
                  ),
                  SizedBox(width: 16),
                  TextButton.icon(
                    onPressed: () => widget.onTabSelected(3),
                    icon: Icon(
                      Icons.inventory,
                      size: 30,
                      color: widget.selectedIndex == 3
                          ? appPrimaryColor
                          : greyColor,
                    ),
                    label: Text(
                      "Stockin",
                      style: MyTextStyle.f16(
                        weight: FontWeight.bold,
                        widget.selectedIndex == 3 ? appPrimaryColor : greyColor,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        actions: [
          Container(
            padding: EdgeInsets.only(right: 20),
            child: IconButton(
              icon: Icon(Icons.logout, color: appPrimaryColor),
              onPressed: widget.onLogout,
            ),
          ),
        ],
      );
    }

    return BlocBuilder<DemoBloc, dynamic>(
      buildWhen: ((previous, current) {
        return false;
      }),
      builder: (context, dynamic) {
        return mainContainer();
      },
    );
  }
}
// class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
//   final int selectedIndex;
//   final Function(int) onTabSelected;
//   final VoidCallback onLogout;
//
//   const CustomAppBar({
//     super.key,
//     required this.selectedIndex,
//     required this.onTabSelected,
//     required this.onLogout,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//
//     return AppBar(
//       backgroundColor: whiteColor,
//       elevation: 0,
//       automaticallyImplyLeading: false,
//       title: Container(
//         margin: EdgeInsets.only(left: 10),
//         child: Row(
//           children: [
//             Text(
//               'Roja Restaurant',
//               style: TextStyle(
//                 fontSize: 20,
//                 fontWeight: FontWeight.bold,
//                 color: appPrimaryColor,
//               ),
//             ),
//             SizedBox(width: size.width * 0.3),
//             Row(
//               children: [
//                 TextButton.icon(
//                   onPressed: () => onTabSelected(0),
//                   icon: Icon(
//                     Icons.home_outlined,
//                     size: 30,
//                     color: selectedIndex == 0 ? appPrimaryColor : greyColor,
//                   ),
//                   label: Text(
//                     "Home",
//                     style: MyTextStyle.f16(
//                       weight: FontWeight.bold,
//                       selectedIndex == 0 ? appPrimaryColor : greyColor,
//                     ),
//                   ),
//                 ),
//                 SizedBox(width: 16),
//                 TextButton.icon(
//                   onPressed: () => onTabSelected(1),
//                   icon: Icon(
//                     Icons.shopping_cart_outlined,
//                     size: 30,
//                     color: selectedIndex == 1 ? appPrimaryColor : greyColor,
//                   ),
//                   label: Text(
//                     "Orders",
//                     style: MyTextStyle.f16(
//                       weight: FontWeight.bold,
//                       selectedIndex == 1 ? appPrimaryColor : greyColor,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//       actions: [
//         Container(
//           padding: EdgeInsets.only(right: 20),
//           child: IconButton(
//             icon: Icon(Icons.logout, color: appPrimaryColor),
//             onPressed: onLogout,
//           ),
//         ),
//       ],
//     );
//   }
//
//   @override
//   Size get preferredSize => const Size.fromHeight(70);
// }
