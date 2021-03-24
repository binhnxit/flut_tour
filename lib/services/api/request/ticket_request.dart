
import 'package:dio/dio.dart';
import 'package:fluttour/services/api/api_client.dart';

class TicketRequest extends APIClient {
  /// Get tickets
  Future<Response<Map<String, dynamic>>> getTickets({String userOrderId}) async {
    const String urlPath = 'api/v1/tickets';
    final Options options = await getAuthOptions(urlPath: urlPath);
    return wrapE(() => dio.get<Map<String, dynamic>>(apiBaseUrl + urlPath, options: options));
  }
}