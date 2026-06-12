enum StockMovementType { IN, OUT, ADJUSTMENT }

class StockMovement {
  final int id;
  final int productId;
  final String productName;
  final int? userId;
  final String username;
  final int quantity;
  final StockMovementType type;
  final String reason;
  final DateTime createdAt;

  StockMovement({
    required this.id,
    required this.productId,
    required this.productName,
    this.userId,
    required this.username,
    required this.quantity,
    required this.type,
    required this.reason,
    required this.createdAt,
  });

  factory StockMovement.fromJson(Map<String, dynamic> json) {
    StockMovementType parsedType;
    switch (json['type'] as String) {
      case 'IN':
        parsedType = StockMovementType.IN;
        break;
      case 'OUT':
        parsedType = StockMovementType.OUT;
        break;
      case 'ADJUSTMENT':
      default:
        parsedType = StockMovementType.ADJUSTMENT;
        break;
    }

    return StockMovement(
      id: (json['id'] as num).toInt(),
      productId: (json['productId'] as num).toInt(),
      productName: json['productName'] as String? ?? '',
      userId: json['userId'] != null ? (json['userId'] as num).toInt() : null,
      username: json['username'] as String? ?? '',
      quantity: (json['quantity'] as num).toInt(),
      type: parsedType,
      reason: json['reason'] as String? ?? '',
      createdAt: json['createdAt'] != null
          ? DateTime.parse(json['createdAt'] as String)
          : DateTime.now(),
    );
  }

  Map<String, dynamic> toJsonRequest() {
    String typeStr;
    switch (type) {
      case StockMovementType.IN:
        typeStr = 'IN';
        break;
      case StockMovementType.OUT:
        typeStr = 'OUT';
        break;
      case StockMovementType.ADJUSTMENT:
        typeStr = 'ADJUSTMENT';
        break;
    }

    return {
      'productId': productId,
      'quantity': quantity,
      'type': typeStr,
      'reason': reason,
    };
  }
}
