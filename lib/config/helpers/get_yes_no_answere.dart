import 'package:dio/dio.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/infrastructure/models/yes_no_models.dart';

class GetYesNoAnswere {
  final _dio = Dio(); // Instancia de la clase Dio para manejar peticiones HTTP

  Future<Message> getAnswere () async {
    // Almacenar el resultado de la petición
    final response = await _dio.get('https://yesno.wtf/api');

    // Amacenar los datos de la respuesta
   final yesNoModel = YesNoModel.fromJson(response.data);

   return yesNoModel.toMessageEntity();

  }

}