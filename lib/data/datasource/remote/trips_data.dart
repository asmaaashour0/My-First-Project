import '../../../core/class/crud.dart';
import '../../../linkapi.dart';

class tripsData {
  Crud crud;
  tripsData(this.crud);
  getData(int id, int userid) async {
    //
    var response = await crud.postData(
        "http://192.168.1.104:8050/api/sh/${id.toString()}",
        {"userid": userid.toString()});
    print("${AppLink.tripspage}/${id.toString()}"); //"id": id
    print("$response.........................tripsdata");
    return response.fold((l) => l, (r) => r);
  }
}
