class User {
  final int id;
  final String name;
  final String username;
  final String email;
  final Address address;
  final String phone;
  final String website;
  final Company company;

  User({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.address,
    required this.phone,
    required this.website,
    required this.company,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    final id = json['id'] as int;
    final name = json['name'] as String;
    final username = json['username'] as String;
    final email = json['email'] as String;
    final phone = json['phone'] as String;
    final website = json['website'] as String;
    final address = Address.fromJson(json['address'] as Map<String, dynamic>);
    final company = Company.fromJson(json['company'] as Map<String, dynamic>);
    return User(
      id: id,
      name: name,
      username: username,
      email: email,
      address: address,
      phone: phone,
      website: website,
      company: company,
    );
  }
}

class Address {
  final String street;
  final String suite;
  final String city;
  final String zipcode;
  final Geo geo;

  Address({
    required this.street,
    required this.suite,
    required this.city,
    required this.zipcode,
    required this.geo,
  });

  factory Address.fromJson(Map<String, dynamic> json) {
    final street = json['street'] as String;
    final suite = json['suite'] as String;
    final city = json['city'] as String;
    final zipcode = json['zipcode'] as String;
    final geo = Geo.fromJson(json['geo'] as Map<String, dynamic>);
    return Address(
      street: street,
      suite: suite,
      city: city,
      zipcode: zipcode,
      geo: geo,
    );
  }
}

class Company {
  final String name;
  final String catchPhrase;
  final String bs;

  Company({required this.name, required this.catchPhrase, required this.bs});

  factory Company.fromJson(Map<String, dynamic> json) {
    final name = json['name'] as String;
    final catchPhrase = json['catchPhrase'] as String;
    final bs = json['bs'] as String;
    return Company(name: name, catchPhrase: catchPhrase, bs: bs);
  }
}

class Geo {
  final double lat;
  final double lng;

  Geo({required this.lat, required this.lng});

  factory Geo.fromJson(Map<String, dynamic> json) {
    final lat = double.parse(json['lat'] as String);
    final lng = double.parse(json['lng'] as String);
    return Geo(lat: lat, lng: lng);
  }
}