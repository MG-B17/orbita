abstract class Failure {
  final String errorMessage;
  Failure({required this.errorMessage});
}

class ServerFailure extends Failure{
  ServerFailure({required super.errorMessage});
}

class NetworkFailure extends Failure{
  NetworkFailure({required super.errorMessage});
}

class LoginFailure extends Failure{
  LoginFailure({required super.errorMessage});
}

class SingUpFailure extends Failure{
  SingUpFailure({required super.errorMessage});
}

class ResetPasswordFailure extends Failure{
  ResetPasswordFailure({required super.errorMessage});
}

class GetProfileFailure extends Failure{
  GetProfileFailure({required super.errorMessage});
}

class UpdateProfileFailure extends Failure{
  UpdateProfileFailure({required super.errorMessage});
}

class LogoutFailure extends Failure{
  LogoutFailure({required super.errorMessage});
}

class DashboardFailure extends Failure{
  DashboardFailure({required super.errorMessage});
}

class CameraDetailsFailure extends Failure{
  CameraDetailsFailure({required super.errorMessage});
}

class SiteSelectionFailure extends Failure{
  SiteSelectionFailure({required super.errorMessage});
}

class VideoDetectionFailure extends Failure{
  VideoDetectionFailure({required super.errorMessage});
}

class AddCameraFailure extends Failure{
  AddCameraFailure({required super.errorMessage});
}

class LiveCameraFailure extends Failure{
  LiveCameraFailure({required super.errorMessage});
}