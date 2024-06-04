import '../../../core/class/crud.dart';

class TestData {
  Crud crud;
  TestData(this.crud);
  getData() async {
    var response = await crud.getRequest(
      "http://192.168.1.104:8050/api/show",
      {},
    );
    //print("$response.................data");
    return response.fold((l) => l, (r) => r);
  }
}
