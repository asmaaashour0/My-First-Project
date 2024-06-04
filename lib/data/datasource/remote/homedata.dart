import 'package:project3/linkapi.dart';

import '../../../core/class/crud.dart';

class HomeData {
  Crud crud;
  HomeData(this.crud);
  getData() async {
    var response =
        await crud.getRequest("http://192.168.1.104:8050/api/show", {});
    print("................  $response ..................data");
    return response.fold((l) => l, (r) => r);
  }

  SearchData(String search) async {
    var response =
        await crud.postData(AppLink.search, {"keyword": search.toString()});
    print(search);
    print("................  $response ..................Searchdata");
    return response.fold((l) => l, (r) => r);
  }
}
