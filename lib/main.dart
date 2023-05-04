import 'dart:developer';

import 'package:dio_example/Network/DioNetworkManager.dart';
import 'package:dio_example/Network/Requests/NetworkRequest.dart';
import 'package:dio_example/Network/Responses/ArticleResponse.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<ArticleResponse> _list = [];
  bool _busy = false;
  final DioNetworkManager _networkManager = DioNetworkManager();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
              icon: const Icon(Icons.refresh),
              onPressed: () async {
                setState(() {
                  _busy = true;
                  _list = [];
                });

                try {
                  ArticleListResponse listResponse = await _networkManager.performRequest(
                      request: const NetworkRequest(
                          type: NetworkRequestType.GET,
                          path: '/v3/articles',
                          queryParams: {
                            '_limit': 100000
                          }
                      ),
                      arrayParser: ArticleListResponse.fromJson
                  );
                  setState(() {
                    _busy = false;
                    _list = listResponse.list;
                  });
                } catch(e) {
                  log(e.toString());

                  setState(() {
                    _busy = false;
                  });
                }
              },
          )
        ],
      ),
      body:
      _busy ?
      const Center(
        child: CircularProgressIndicator(),
      ) :
      ListView.builder(
          itemCount: _list.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(_list[index].title),
              subtitle: Text(_list[index].summary),
            );
          }
      )
    );
  }
}
