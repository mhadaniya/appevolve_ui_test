class PaymentMethod {
  final String? lastFour;
  final String type;

  PaymentMethod({required this.type, this.lastFour});

  @override
  String toString() {
    // TODO: implement toString
    return '${this.type}, **** ${this.lastFour}';
  }
}
