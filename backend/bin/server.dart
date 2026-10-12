import 'dart:convert';
import 'dart:io';

import 'package:backend/backend.dart';
import 'package:shared/shared.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as shelf_io;
import 'package:shelf_router/shelf_router.dart';

void main(List<String> args) async {
  setupBackendServiceLocator();
  final backendService = serviceLocator<BackendService>();

  final router = Router();

  // Health check
  router.get('/api/health', (Request request) {
    return Response.ok(
      jsonEncode({'status': 'operational', 'system': 'Beyond the Horizon Telemetry'}),
      headers: {'content-type': 'application/json'},
    );
  });

  // Auth: Sign In
  router.post('/api/auth/signin', (Request request) async {
    try {
      final payload = jsonDecode(await request.readAsString()) as Map<String, dynamic>;
      final dto = SignInRequestDto.fromMap(payload);
      final responseDto = await backendService.auth.signIn(dto);
      return Response.ok(
        jsonEncode(responseDto.toMap()),
        headers: {'content-type': 'application/json'},
      );
    } catch (e) {
      return Response.badRequest(
        body: jsonEncode({'error': e.toString()}),
        headers: {'content-type': 'application/json'},
      );
    }
  });

  // Auth: Sign Up
  router.post('/api/auth/signup', (Request request) async {
    try {
      final payload = jsonDecode(await request.readAsString()) as Map<String, dynamic>;
      final dto = SignUpRequestDto.fromMap(payload);
      final responseDto = await backendService.auth.signUp(dto);
      return Response(
        201,
        body: jsonEncode(responseDto.toMap()),
        headers: {'content-type': 'application/json'},
      );
    } catch (e) {
      return Response.badRequest(
        body: jsonEncode({'error': e.toString()}),
        headers: {'content-type': 'application/json'},
      );
    }
  });

  // Middleware pipeline
  final handler = const Pipeline()
      .addMiddleware(logRequests())
      .addHandler(router.call);

  final port = int.tryParse(Platform.environment['PORT'] ?? '8080') ?? 8080;
  final server = await shelf_io.serve(handler, InternetAddress.anyIPv4, port);
  print('Beyond the Horizon Backend running on port ${server.port}');
}
