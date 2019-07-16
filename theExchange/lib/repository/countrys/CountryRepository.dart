import 'package:meu_primeiro_app/repository/countrys/model/CountryDTO.dart';
import 'package:meu_primeiro_app/repository/countrys/model/CountryCategory.dart';
import 'package:meu_primeiro_app/support/conection/api.dart';

abstract class NoticeRepository {
  Future<List<CountryDTO>> loadCountrys();
}

class NoticeRepositoryImpl implements NoticeRepository {
  final Api _api = Api("dvp4.dartdigital.com.br");


  Future<List<CountryDTO>> loadCountrys() async {
    final result = await _api.get("/api/Country");
    return result
        .map<CountryDTO>((country) => new CountryDTO.fromMap(country))
        .toList();
  }

  Future<CountryCategory> loadCategory(String id) async {
    final result = await _api.get("api/country/" + id);
    return new CountryCategory.fromJson(result);
  }
}
