import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OrderStatusChipFilter extends StatelessWidget {
  final String label;
  final String total;
  final Color? color;

  const OrderStatusChipFilter(
      {this.label = 'label', this.total = '', this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
        decoration: BoxDecoration(
          color: color?.withAlpha(64) ?? Colors.transparent,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Row(
          children: [
            Text(
              label,
              style: GoogleFonts.manrope(
                textStyle: TextStyle(
                  color: color ?? Colors.grey,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            SizedBox(width: 4),
            Visibility(
              visible: total.isNotEmpty,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                decoration: BoxDecoration(
                  color: color ?? Colors.grey,
                  borderRadius: BorderRadius.circular(8),
                ),
                alignment: Alignment.center,
                height: 20,
                child: Text(
                  total,
                  style: GoogleFonts.manrope(
                    textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 8,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
