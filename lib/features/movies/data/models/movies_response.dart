import 'data.dart';
import 'meta.dart';

class MoviesResponse {
 const MoviesResponse({
  required this.status,
  required this.statusMessage,
  required this.data,
  required this.meta,
  });

 factory MoviesResponse.fromJson(dynamic json) {
   return MoviesResponse(
     status: json['status'],
     statusMessage: json['status_message'],
     data: json['data'] != null ? Data.fromJson(json['data']) : null,
     meta: json['@meta'] != null ? Meta.fromJson(json['@meta']) : null,
   );

  }

 final String? status;
 final String? statusMessage;
 final Data? data;
 final Meta? meta;
}
