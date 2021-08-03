import 'package:appevolve_ui_test/domain/models/models.dart';
import 'package:appevolve_ui_test/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'widgets/widgets.dart';

class ListOrdersPage extends StatefulWidget {
  @override
  _ListOrdersPageState createState() => _ListOrdersPageState();
}

class _ListOrdersPageState extends State<ListOrdersPage> {
  final List<Order> orders = [
    Order.faker(),
    Order.faker(),
    Order.faker(),
    Order.faker(),
    Order.faker(),
    Order.faker(),
    Order.faker(),
    Order.faker(),
    Order.faker(),
    Order.faker()
  ];

  late List<Order> showingOrders;

  @override
  void initState() {
    setState(() {
      showingOrders = orders;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 68,
        backgroundColor: AppColors.superDarkBlue,
        title: Text(
          'Orders',
          style: GoogleFonts.manrope(
            textStyle: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        centerTitle: true,
        leading: Icon(
          Icons.menu,
          size: 30,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 19.0, top: 5),
            child: Stack(
              alignment: AlignmentDirectional.center,
              children: [
                CircleAvatar(
                  radius: 12,
                  backgroundImage: AssetImage('assets/avatar.png'),
                ),
                Positioned(
                  bottom: 18,
                  right: 2,
                  child: CircleAvatar(
                    backgroundColor: AppColors.turquoise,
                    radius: 3,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: LayoutBuilder(
        builder: (context, viewportConstraints) => ListView(
          children: [
            SizedBox(height: 16),
            Top(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Divider(color: AppColors.mediumGray),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  OrderStatusListView(
                    orders: orders,
                  ),
                  SizedBox(height: 20),
                  ...orders.map((e) => OrderCard(order: e))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Top extends StatelessWidget {
  const Top({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          SizedBox(
            height: 4,
          ),
          SearchField(),
          SizedBox(
            height: 16,
          ),
          ActionsButtons(),
        ],
      ),
    );
  }
}

class ActionsButtons extends StatelessWidget {
  const ActionsButtons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: Container(
            alignment: Alignment.center,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.tune),
                SizedBox(
                  width: 8,
                ),
                Text(
                  'Filters',
                  style: GoogleFonts.manrope(
                    textStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppColors.mediumGray,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        SizedBox(
          width: 17,
        ),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(4),
            ),
            alignment: Alignment.center,
            height: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.swap_vert),
                SizedBox(
                  width: 8,
                ),
                Text(
                  'Sort',
                  style: GoogleFonts.manrope(
                    textStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppColors.mediumGray,
                    ),
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

class OrderStatusListView extends StatelessWidget {
  final List<Order> orders;
  final Function? filterBy;

  OrderStatusListView({required this.orders, this.filterBy});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          OrderStatusChipFilter(
            label: 'All Orders',
            total: '294',
            color: AppColors.turquoise,
          ),
          OrderStatusChipFilter(
            label: 'Preparing',
            total: '12',
          ),
          OrderStatusChipFilter(
            label: 'Sent',
            total: '77',
          ),
          OrderStatusChipFilter(
            label: 'Returned',
            total: '0',
          ),
          OrderStatusChipFilter(
            label: 'Canceled',
            total: '0',
          ),
          OrderStatusChipFilter(
            label: 'Delivered',
            total: '0',
          ),
        ],
      ),
    );
  }
}
