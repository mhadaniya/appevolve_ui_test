import 'package:appevolve_ui_test/utils/colors.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';

import 'payment_method.dart';

enum OrderStatus {
  Preparing,
  Sent,
  Returned,
  Canceled,
  Delivered,
}

const Map<OrderStatus, Color> orderColor = {
  OrderStatus.Preparing: AppColors.yellowOrange,
  OrderStatus.Sent: AppColors.blue,
  OrderStatus.Returned: AppColors.darkBlue,
  OrderStatus.Canceled: AppColors.red,
  OrderStatus.Delivered: AppColors.turquoise,
};

Map<OrderStatus, Color> orderColorWithAlpha = {
  OrderStatus.Preparing: AppColors.yellowOrange.withAlpha(64),
  OrderStatus.Sent: AppColors.blue.withAlpha(64),
  OrderStatus.Returned: AppColors.darkBlue.withAlpha(64),
  OrderStatus.Canceled: AppColors.red.withAlpha(64),
  OrderStatus.Delivered: AppColors.turquoise.withAlpha(64),
};

class Order {
  final String id;
  final OrderStatus status;
  final DateTime createdAt;
  final String? location;
  final String clientName;
  final String clientEmail;
  final String deliveryCompany;
  final String trackingCode;
  final List<String> products;
  final int totalPrice;
  final PaymentMethod paymentMethod;

  Order({
    required this.id,
    required this.status,
    required this.createdAt,
    this.location,
    required this.clientName,
    required this.clientEmail,
    required this.deliveryCompany,
    required this.trackingCode,
    required this.products,
    required this.totalPrice,
    required this.paymentMethod,
  });

  factory Order.faker() {
    Faker faker = Faker();
    var name = faker.person.name();

    return Order(
      id: '13702574',
      createdAt: DateTime.now(),
      clientName: name,
      clientEmail: '${name.toLowerCase().split(' ').last}@email.com',
      deliveryCompany: 'DHL',
      trackingCode:
          '${faker.randomGenerator.integer(999, min: 111)}-${faker.randomGenerator.integer(999999, min: 111111)}',
      products: [faker.lorem.word(), faker.lorem.word(), faker.lorem.word()],
      totalPrice: faker.randomGenerator.integer(99999),
      location: faker.address.city(),
      status: OrderStatus
          .values[faker.randomGenerator.integer(OrderStatus.values.length)],
      paymentMethod: PaymentMethod(type: 'Credit Card', lastFour: '4321'),
    );
  }
}
