import '../enums/enMovementType.dart';

class InventoryMovement {
  final String id;
  final String productId;
  final int quantity;
  final MovementType type;
  final DateTime date;
  final String? note;
  final String? userId;
  final String? supplierId;
  final String? referenceId;

  InventoryMovement({
    required this.id,
    required this.productId,
    required this.quantity,
    required this.type,
    required this.date,
    this.note,
    this.userId,
    this.supplierId,
    this.referenceId,
  });

  InventoryMovement copyWith({
    String? id,
    String? productId,
    int? quantity,
    MovementType? type,
    DateTime? date,
    String? note,
    String? userId,
    String? supplierId,
    String? referenceId,
  }) {
    return InventoryMovement(
      id: id ?? this.id,
      productId: productId ?? this.productId,
      quantity: quantity ?? this.quantity,
      type: type ?? this.type,
      date: date ?? this.date,
      note: note ?? this.note,
      userId: userId ?? this.userId,
      supplierId: supplierId ?? this.supplierId,
      referenceId: referenceId ?? this.referenceId,
    );
  }
}
