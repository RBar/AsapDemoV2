// Project imports:
import 'package:asapdemo/domain/entities/order_list_entity.dart';

// se utiliza el provider para tener la orden seleccionado en el estado.

class OrderSelected {
  final OrderListEntity _selectedOrder;
  OrderListEntity get selectedOrder => _selectedOrder;
  OrderSelected(
    this._selectedOrder,
  );
}
