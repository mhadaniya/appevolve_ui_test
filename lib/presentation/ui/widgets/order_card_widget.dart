import 'package:appevolve_ui_test/domain/models/models.dart';
import 'package:appevolve_ui_test/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class OrderCard extends StatelessWidget {
  final Order order;

  OrderCard({required this.order});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Column(
        children: [
          CardHeader(order: order),
          Divider(),
          InfoRow(
            prefixText:
                '${DateFormat.yMd().format(order.createdAt)}, ${DateFormat.Hm().format(order.createdAt)}',
            suffixText: order.location,
            suffixTextStyle: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: AppColors.mediumGray,
            ),
          ),
          InfoRow(
            prefixText: 'Client Name',
            suffixText: order.clientName,
            backgroundColor: AppColors.gray,
          ),
          InfoRow(
            prefixText: 'Client Email',
            suffixText: order.clientEmail,
          ),
          InfoRow(
            prefixText: 'Delivery Company',
            suffixText: order.deliveryCompany,
            backgroundColor: AppColors.gray,
          ),
          InfoRow(
            prefixText: 'Tracking Code',
            suffixText: order.trackingCode.toString(),
          ),
          InfoRow(
            prefixText: 'Products',
            suffixText:
                order.products.reduce((value, element) => '$value, $element'),
            backgroundColor: AppColors.gray,
          ),
          InfoRow(
            prefixText: 'Price',
            suffixText:
                '\$${NumberFormat("###.0#", "en_US").format(order.totalPrice * .01)}',
          ),
          InfoRow(
            prefixText: 'Payment Method',
            suffixText: order.paymentMethod.toString(),
            backgroundColor: AppColors.gray,
          ),
        ],
      ),
    );
  }
}

class CardHeader extends StatelessWidget {
  const CardHeader({
    Key? key,
    required this.order,
  }) : super(key: key);

  final Order order;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 15,
                backgroundColor: orderColor[order.status],
                child: Icon(
                  Icons.shopping_bag_outlined,
                  color: Colors.white,
                  size: 16,
                ),
              ),
              SizedBox(width: 8),
              Text(
                '# ${order.id}',
                style: GoogleFonts.manrope(
                  textStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          Chip(
            label: Text('${order.status.toString().split('.').last}'),
            labelStyle: GoogleFonts.manrope(
              textStyle: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: orderColor[order.status],
              ),
            ),
            backgroundColor: orderColorWithAlpha[order.status],
          ),
        ],
      ),
    );
  }
}

class InfoRow extends StatelessWidget {
  const InfoRow({
    Key? key,
    this.prefixText,
    this.suffixText,
    this.backgroundColor,
    this.suffixTextStyle,
    this.prefixTextStyle,
  }) : super(key: key);

  final String? prefixText;
  final String? suffixText;
  final Color? backgroundColor;
  final TextStyle? suffixTextStyle;
  final TextStyle? prefixTextStyle;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: backgroundColor ?? Colors.white,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '$prefixText',
              style: GoogleFonts.manrope(
                textStyle: prefixTextStyle ??
                    TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: AppColors.mediumGray,
                    ),
              ),
            ),
            Text(
              '$suffixText',
              style: GoogleFonts.manrope(
                textStyle: suffixTextStyle ??
                    TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: AppColors.superDarkBlue,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
