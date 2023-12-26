// import 'dart:developer';

// import 'package:get_it/get_it.dart';
// import 'package:nylo_framework/nylo_framework.dart';
// import 'package:fluent_ui/fluent_ui.dart';
// // import 'package:vbot/service/app_service.dart';

// import '../../../../../bootstrap/helpers.dart';
// import '../../../../app/windows/splash_window.dart';
// import '../../../../main.dart';
// import '../../../../models/error_model.dart';
// import '../../../../models/user.dart';

// class BearerAuthInterceptor extends QueuedInterceptor {
// //  AuthInterceptor(this._tokenService);

// //    final TokenService _tokenService;

//   late final Dio _dio = Dio();
//   String get baseUrl => getEnv('API_BASE_URL');

//   @override
//   void onError(DioError err, ErrorInterceptorHandler handler) async {
//     if (err.error == "Http status error [401]") {
//       backToLogin();
//       return;
//     } else {
//       if (err.response != null) {
//         if (err.response!.statusCode == 403 ||
//             err.response!.statusCode == 401) {
//           final options = err.requestOptions;
//           final accessToken = await _regenerateAccessToken();

//           if (accessToken == null || accessToken.isEmpty) {
//             backToLogin();
//             return;
//             // return handler.reject(err);
//           } else {
//             options.headers.addAll({"Authorization": "Bearer $accessToken"});
//             try {
//               final _res = await fetch(options);
//               return handler.resolve(_res);
//             } on DioError catch (e) {
//               handler.next(e);
//               return;
//             }
//           }
//         } else {
//           handler.next(err);
//         }
//       } else {
//         handler.next(err);
//       }
//     }
//   }

//   @override
//   void onRequest(
//       RequestOptions options, RequestInterceptorHandler handler) async {
//     final String? accessToken = await readAuthToken();
//     if (accessToken != null) {
//       options.headers.addAll({"Authorization": "Bearer $accessToken"});
//     }

//     log("NEW ACCESS TOKENN $accessToken");

//     handler.next(options);
//   }

//   @override
//   void onResponse(Response response, ResponseInterceptorHandler handler) {
//     ErrorModel? error = ErrorModel.fromJson(response.data);
//     if (error.status == 0) {
//       handler.reject(DioError(
//           requestOptions: response.requestOptions, response: response));
//       // handler.next(response);
//     } else {
//       handler.next(response);
//     }
//   }

//   Future<Response<dynamic>> fetch(RequestOptions options) =>
//       _dio.fetch(options);

//   Future<String?> _regenerateAccessToken() async {
//     try {
//       var dio =
//           Dio(); // should create new dio instance because the request interceptor is being locked

//       // get refresh token from local storage
//       final refreshToken = await readRefreshToken();

//       // make request to server to get the new access token from server using refresh token
//       final response = await dio.post("$baseUrl/api/User/refreshToken",
//           data: {"refresh_token": "$refreshToken"});

//       if (response.statusCode == 200 || response.statusCode == 201) {
//         TokenModel token = TokenModel.fromJson(response.data);
//         await token.save(SharedKey.authUser);

//         return token.accessToken;
//       } else if (response.statusCode == 401 || response.statusCode == 403) {
//         // it means your refresh token no longer valid now, it may be revoked by the backend

//         return null;
//       } else {
//         // print(response.statusCode);
//         return null;
//       }
//     } on DioError {
//       return null;
//     } catch (e) {
//       return null;
//     }
//   }

//   backToLogin() {
//     AppService appData = GetIt.instance.get<AppService>();
//     NyStorage.deleteAll();
//     appData.isSipLogin = false;
//     appData.resetAllData();

//     navigatorKey.currentState?.pushAndRemoveUntil(
//         FluentPageRoute<void>(
//             builder: (BuildContext context) => const SplashWindow()),
//         ModalRoute.withName('/'));
//   }
// }
