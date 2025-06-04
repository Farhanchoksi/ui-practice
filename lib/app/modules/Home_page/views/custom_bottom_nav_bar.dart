import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const CustomBottomNavBar({
    Key? key,
    required this.selectedIndex,
    required this.onItemTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      // padding: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: HexColor('CBDCE6')),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            spreadRadius: 1,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(icon: Icons.home, label: 'Home', index: 0),
          _buildNavItem(icon: Icons.share, label: 'Network', index: 1),
          _buildNavItem(icon: Icons.calendar_today, label: 'Agenda', index: 2),
          _buildNavItem(icon: Icons.person, label: 'Profile', index: 3),
        ],
      ),
    );
  }

  Widget _buildNavItem({
    required IconData icon,
    required String label,
    required int index,
  }) {
    final bool isSelected = selectedIndex == index;

    return Flexible(
      flex: isSelected ? 2 : 1,
      child: GestureDetector(
        onTap: () => onItemTapped(index),
        child: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
            decoration:
                isSelected
                    ? BoxDecoration(
                      color: HexColor('CBDCE6'),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: HexColor('333F64'), width: 1),
                    )
                    : null,
            child:
                isSelected
                    ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(icon, size: 22, color: HexColor('333F64')),
                        const SizedBox(width: 6),
                        Flexible(
                          child: Text(
                            label,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: HexColor('#333F64'),
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    )
                    : Center(
                      child: Icon(icon, size: 22, color: Colors.grey[600]),
                    ),
          ),
        ),
      ),
    );
  }
}
