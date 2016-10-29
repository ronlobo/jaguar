part of jaguar.src.serve;

//  TODO(kleak): add doc
class Jaguar {
  Configuration configuration;

  Jaguar(this.configuration) {
    hierarchicalLoggingEnabled = true;
    Logger.root.level = Level.ALL;

    Logger.root.onRecord.listen((LogRecord rec) {
      String dateStr = _dateFormatter.format(rec.time);
      print('@$dateStr ${rec.loggerName}: ${rec.message}');
    });
  }


  final DateFormat _dateFormatter = new DateFormat('MM-dd H:m');

  final Logger _log = new Logger('J');

  final Logger _logRequest = new Logger('J.Req');

  Future<Null> serve() async {
    _log.severe("Running on ${configuration.baseUrl}");
    await _serve();
  }

  Future<Null> handleRequest(HttpRequest request) async {
    _logRequest.info("Method: ${request.method} Url: ${request.uri}");
    try {
      for (int i = 0; i < configuration.apis.length; i++) {
        var apiClass = configuration.apis[i];
        bool result = await apiClass.handleApiRequest(request);
        if (result) break;
      }
    } catch (e) {
      print(e);
      request.response.write(e);
    } finally {
      await request.response.close();
    }
  }

  Future<Null> _serve([dynamic message]) async {
    bool share = configuration.multiThread;
    HttpServer server;
    if (configuration.securityContext != null) {
      server = await HttpServer.bindSecure(
          configuration.address, configuration.port, configuration.securityContext);
    } else {
      server = await HttpServer.bind(configuration.address, configuration.port,
          shared: share);
    }
    server.listen((HttpRequest request) => handleRequest(request));
  }
}
