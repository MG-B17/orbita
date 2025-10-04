class ServerException implements Exception{}

class NetworkException implements Exception{}

class  LoginException implements Exception{
  final String error ;
  LoginException({required this.error});
}

class SingUpException implements Exception{
 final  String error;

  SingUpException({required this.error});
}

class GetUserDataException implements Exception{
  final String message ;

  GetUserDataException({required this.message});
}

class UpdateUserDataException implements Exception{
  final String message ;

  UpdateUserDataException({required this.message});
}


class LogoutException implements Exception{
  final String message ;

  LogoutException({required this.message});
}

class ResetPasswordException implements Exception{
  final String message ;

  ResetPasswordException({required this.message});
}

class DashboardException implements Exception{
  final String message ;

  DashboardException({required this.message});
}

class CameraDetailsException implements Exception{
  final String message ;

  CameraDetailsException({required this.message});
}

class SiteSelectionException implements Exception{
  final String message ;

  SiteSelectionException({required this.message});
}

class VideoDetectionException implements Exception{
  final String message ;

  VideoDetectionException({required this.message});
}

class AddCameraException implements Exception{
  final String message ;

  AddCameraException({required this.message});
}

class LiveCameraException implements Exception{
  final String message ;

  LiveCameraException({required this.message});
}