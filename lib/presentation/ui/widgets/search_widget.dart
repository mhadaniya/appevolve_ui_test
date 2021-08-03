import 'package:appevolve_ui_test/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 40,
      // alignment: Alignment.bottomCenter,
      child: TextField(
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 8),
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none,
          ),
          hintText: 'Search by any order parameter',
          hintStyle: GoogleFonts.manrope(
            textStyle: TextStyle(
              color: AppColors.mediumGray,
              fontSize: 14,
            ),
          ),
          labelStyle: GoogleFonts.manrope(
            textStyle: TextStyle(
              color: AppColors.mediumGray,
              fontSize: 14,
            ),
          ),
          prefixStyle: GoogleFonts.manrope(
            textStyle: TextStyle(
              color: AppColors.mediumGray,
              fontSize: 14,
            ),
          ),
          prefixIcon: Icon(
            Icons.search,
            color: AppColors.mediumGray,
          ),
        ),
      ),
    );
  }
}
