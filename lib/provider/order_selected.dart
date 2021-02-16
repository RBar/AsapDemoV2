// Project imports:
import 'package:asapdemo/domain/entities/order_list_entity.dart';

class OrderSelected {
  final OrderListEntity _selectedOrder;
  OrderListEntity get selectedOrder => _selectedOrder;
  OrderSelected(
    this._selectedOrder,
  );
}
