
class CountryDTO {
  final String idCountry;
  final String img;
  final String name;
  final String description;

  CountryDTO(this.img, this.name, this.description, this.idCountry);

  CountryDTO.fromMap(Map<String, dynamic> map)
      : img = map['flag_image'],
        name = map['name'],
        description = map['short_description'],
        idCountry = map['idcountry'].toString();
}
