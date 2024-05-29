import 'dart:io';

void main(List<String> args) async {
  final server = await HttpServer.bind(InternetAddress.anyIPv4, 8080);
  server.listen((event) async {
    await handle(event, event.response);
    event.response.close();
  });
  print('server listen on ${InternetAddress.anyIPv4.address}:8080');
}

Future<void> handle(HttpRequest req, HttpResponse res) async {
  res.headers.add('Content-Type', 'text/html');
  res.write('<h1>Ola</h1>');
}
