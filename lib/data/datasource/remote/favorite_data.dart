import '../../../core/class/crud.dart';
import '../../../linkapi.dart';

class FavoriteData {
  Crud crud;
  FavoriteData(this.crud);
  addFavorite(int userid, int tripid) async {
    var response = await crud.postData(
        "http://192.168.1.104:8050/api/addfavorite",
        {"userid": userid.toString(), "tripid": tripid.toString()});
    print("${AppLink.tripspage}/addfavorite");
    print("$response.........................favoritedata");
    return response.fold((l) => l, (r) => r);
  }

  deleteFavorite(int userid, int tripid) async {
    var response = await crud.postData(
        "http://192.168.1.104:8050/api/removefavorite",
        {"userid": userid.toString(), "tripid": tripid.toString()});
    print("${AppLink.tripspage}/removefavorite"); //"id": id
    print("$response.........................tripsdata");
    return response.fold((l) => l, (r) => r);
  }
}
