import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DropDownWid extends StatelessWidget {
  DropDownWid({super.key, required this.fuel, required this.controller});
  final bool fuel;
  final TextEditingController controller;
  final List<String> fuelList = ['Electric', 'Petrol', 'Disel'];
  final List<String> transList = ['Automatic', 'Manual', 'Semi-Auto', 'Other'];

  final TextStyle _labelStyle =
      GoogleFonts.poppins(fontWeight: FontWeight.w600);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 8),
        Text(
          fuel ? ' Fuel Type' : ' Transmission',
          style: GoogleFonts.poppins(fontSize: 17, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 8),
        CustomDropdown(
          selectedStyle: GoogleFonts.poppins(color: Colors.black),
          hintText: fuel ? 'Select Fuel Type' : "Select Transmission Type",
          hintStyle: GoogleFonts.poppins(),
          items: fuel ? fuelList : transList,
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Colors.black,
            width: 1,
          ),
          controller: controller,
          excludeSelected: false,
          listItemBuilder: (context, result) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(result, style: _labelStyle),
                const Icon(Icons.circle_outlined)
              ],
            );
          },
        ),
      ],
    );
  }
}
