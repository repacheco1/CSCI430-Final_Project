//import 'package:units/units.dart';

class Business {
  final double rating;
  final String price;
  final String phone;
  // ignore: non_constant_identifier_names
  final String display_phone;
  final String id;
  final String name;

  final double latitude;
  final double longitude;
  final double distance;

  final String alias;
  final bool isClosed;
  final int reviewCount;

  final String url;
  final String imageUrl;

  final String address1;
  final String address2;
  final String address3;
  final String city;
  final String state;
  final String country;
  final String zip;

  // ignore: sort_constructors_first
  Business(
      {this.rating,
      this.price,
      this.phone,
      // ignore: non_constant_identifier_names
      this.display_phone,
      this.id,
      this.name,
      this.latitude,
      this.longitude,
      this.distance,
      this.alias,
      this.isClosed,
      this.reviewCount,
      this.url,
      this.imageUrl,
      this.address1,
      this.address2,
      this.address3,
      this.city,
      this.state,
      this.country,
      this.zip,
      });

  // ignore: sort_constructors_first
  factory Business.fromJson(Map<String, dynamic> json) {
    return Business(
      rating: json['rating'] as double,
      price: json['price'] as String,
      phone: json['phone'] as String,
      display_phone: json['display_phone'] as String,
      id: json['id'] as String,
      name: json['name'] as String,
      latitude: json['coordinates']['latitude'] as double,
      longitude: json['coordinates']['longitude'] as double,
      // ignore: unnecessary_cast
      distance: json['distance'] as double,
      alias: json['alias'] as String,
      isClosed: json['is_closed'] as bool,
      reviewCount: json['review_count'] as int,
      url: json['url'] as String,
      imageUrl: json['image_url'] as String,
      address1: json['location']['address1'] as String,
      address2: json['location']['address2'] as String,
      address3: json['location']['address3'] as String,
      city: json['location']['city'] as String,
      state: json['location']['state'] as String,
      country: json['location']['country'] as String,
      zip: json['location']['zip_code'] as String,
    );
  }
}
