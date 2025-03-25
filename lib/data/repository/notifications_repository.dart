import '../../core/client.dart';
import '../model/notifications_model.dart';

class NotificationsRepository{
  final ApiClient client;
  NotificationsRepository({required this.client});

  List<NotificationsModel> notification=[];

  Future<List<NotificationsModel>> fetchNotification()async{
    var rawNotification=await client.genericGetRequest<List<dynamic>>('/notifications/list');
    notification=rawNotification.map((e)=>NotificationsModel.fromJson(e)).toList();
    return notification;
  }
}