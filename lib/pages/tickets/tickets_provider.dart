import 'package:dio/dio.dart';
import 'package:fluttour/domain/models/ticket_model.dart';
import 'package:fluttour/services/api/api_status.dart';
import 'package:fluttour/services/api/base_response.dart';
import 'package:fluttour/services/api/request/ticket_request.dart';
import 'package:fluttour/services/api/response/ticket_response.dart';
import 'package:fluttour/services/safety/notifier_safety.dart';

class TicketsProvider extends ChangeNotifierSafety {
  TicketsProvider(this._ticketRequest);

  TicketRequest _ticketRequest;

  List<TicketModel> _ticketModelList;

  List<TicketModel> get ticketModelList => _ticketModelList;

  set ticketModelList(List<TicketModel> value) {
    _ticketModelList = value;
    notifyListeners();
  }

  Future<bool> getTickets() async {
    final Response<Map<String, dynamic>> result = await _ticketRequest.getTickets().timeout(const Duration(seconds: 30));
    final BaseResponse response = BaseResponse(result.data);
    ticketModelList = (result.data['data'] as List<dynamic>).map((e) => TicketModel.fromJson(e as Map<String, dynamic>)).toList();
    if (response.event == ApiEventStatus.SUCCESS) {
      return true;
    } else {
      throw DioError(
          error: response.describe ?? 'Get Tickets error',
          type: DioErrorType.RESPONSE
      );
    }
  }

  @override
  void resetState() {
  }
}