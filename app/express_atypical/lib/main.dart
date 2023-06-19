import 'dart:async';
import 'dart:io' show Platform;
import 'package:express_atypical/entities/icone.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

enum TtsState { playing, stopped, paused, continued }



class _MyAppState extends State<MyApp> {
  List<Icone> listaIcone = List.empty(growable: true);
  late FlutterTts flutterTts;
  String? language;
  String? engine;
  double volume = 0.8;
  double pitch = 1.0;
  double rate = 0.5;
  bool isCurrentLanguageInstalled = false;

  // String? _newVoiceText;
  int? _inputLength;

  TtsState ttsState = TtsState.stopped;

  get isPlaying => ttsState == TtsState.playing;
  get isStopped => ttsState == TtsState.stopped;
  get isPaused => ttsState == TtsState.paused;
  get isContinued => ttsState == TtsState.continued;

  bool get isIOS => !kIsWeb && Platform.isIOS;
  bool get isAndroid => !kIsWeb && Platform.isAndroid;
  bool get isWindows => !kIsWeb && Platform.isWindows;
  bool get isWeb => kIsWeb;

  @override
  initState() {
    super.initState();

    Icone icone1 = Icone();
    icone1.deIcone = "Mãe";
    icone1.deUrlImagem = "https://cdn-icons-png.flaticon.com/512/46/46108.png";
    listaIcone.add(icone1);
    Icone icone2 = Icone();
    icone2.deIcone = "Pai";
    icone2.deUrlImagem = "https://cdn-icons-png.flaticon.com/512/157/157674.png";
    listaIcone.add(icone2);
    Icone icone3 = Icone();
    icone3.deIcone = "Avó";
    icone3.deUrlImagem = "https://cdn-icons-png.flaticon.com/512/1320/1320787.png";

    listaIcone.add(icone3);
    Icone icone4 = Icone();
    icone4.deIcone = "Avô";
    icone4.deUrlImagem = "https://cdn-icons-png.flaticon.com/512/1692/1692103.png";
    listaIcone.add(icone4);
    Icone icone5 = Icone();
    icone5.deIcone = "Irmã";
    icone5.deUrlImagem = "https://cdn-icons-png.flaticon.com/512/115/115382.png";
    listaIcone.add(icone5);
    Icone icone6 = Icone();
    icone6.deIcone = "Irmão";
    icone6.deUrlImagem = "https://cdn-icons-png.flaticon.com/512/852/852596.png";
    listaIcone.add(icone6);   
    Icone icone7 = Icone();
    icone7.deIcone = "Alegria";
    icone7.deUrlImagem = "https://cdn-icons-png.flaticon.com/512/2074/2074607.png";

    listaIcone.add(icone7);
    Icone icone8 = Icone();
    icone8.deIcone = "Tristeza";
    icone8.deUrlImagem = "https://cdn-icons-png.flaticon.com/512/132/132246.png";
    listaIcone.add(icone8);
    Icone icone = Icone();
    icone.deIcone = "Raiva";
    icone.deUrlImagem = "https://cdn-icons-png.flaticon.com/512/4947/4947123.png";
    listaIcone.add(icone);
    Icone icone9 = Icone();
    icone9.deIcone = "Medo";
    icone9.deUrlImagem = "https://cdn-icons-png.flaticon.com/512/3441/3441750.png";
    listaIcone.add(icone9);
    Icone icone10 = Icone();
    icone10.deIcone = "Nojo";
    icone10.deUrlImagem = "https://static.vecteezy.com/system/resources/previews/014/655/280/original/disgusted-icon-free-vector.jpg";
    listaIcone.add(icone10);
    Icone icone11 = Icone();
    icone11.deIcone = "Surpresa";
    icone11.deUrlImagem = "https://cdn-icons-png.flaticon.com/512/185/185033.png";
    listaIcone.add(icone11);
    Icone icone12 = Icone();
    icone12.deIcone = "Cabeça";
    icone12.deUrlImagem = "https://cdn-icons-png.flaticon.com/512/4200/4200918.png";
    listaIcone.add(icone12);
    Icone icone13 = Icone();
    icone13.deIcone = "Pescoço";
    icone13.deUrlImagem = "https://cdn-icons-png.flaticon.com/512/5746/5746311.png";
    listaIcone.add(icone13);
    Icone icone14 = Icone();
    icone14.deIcone = "Barriga";
    icone14.deUrlImagem = "https://cdn-icons-png.flaticon.com/512/62/62276.png";
    listaIcone.add(icone14);
    Icone icone15 = Icone();
    icone15.deIcone = "Perna";
    icone15.deUrlImagem = "https://cdn-icons-png.flaticon.com/512/105/105376.png";
    listaIcone.add(icone15);
    Icone icone16 = Icone();
    icone16.deIcone = "Pé";
    icone16.deUrlImagem = "https://cdn-icons-png.flaticon.com/512/819/819016.png";
    listaIcone.add(icone16);
    Icone icone17 = Icone();
    icone17.deIcone = "Calor";
    icone17.deUrlImagem = "https://cdn-icons-png.flaticon.com/512/1536/1536260.png";
    listaIcone.add(icone17);
    Icone icone18 = Icone();
    icone18.deIcone = "Frio";
    icone18.deUrlImagem = "https://cdn-icons-png.flaticon.com/512/1684/1684425.png";
    listaIcone.add(icone18);
    Icone icone19 = Icone();
    icone19.deIcone = "Chuva";
    icone19.deUrlImagem = "https://cdn-icons-png.flaticon.com/512/3248/3248333.png";
    listaIcone.add(icone19);
    Icone icone20 = Icone();
    icone20.deIcone = "Tempestade";
    icone20.deUrlImagem = "https://cdn-icons-png.flaticon.com/512/1146/1146799.png";
    listaIcone.add(icone20);
    Icone icone21 = Icone();
    icone21.deIcone = "Neblina";
    icone21.deUrlImagem = "https://media.istockphoto.com/id/1245876110/pt/vetorial/fog-mist-or-haze-icon-for-weather-forecast-application-or-widget-color-version-on-light.jpg?s=170667a&w=0&k=20&c=ri88rlAMKBURw7nMYpOzJlxa3E9qGHX0Lbx96jc-JJ0=";
    listaIcone.add(icone21);
    // Icone icone = Icone();
    // icone.deIcone = "Banana";
    // icone.deUrlImagem = "https://upload.wikimedia.org/wikipedia/commons/a/af/Bananas_%28Alabama_Extension%29.jpg";
    //
    // Icone icone1 = Icone();
    // icone1.deIcone = "Comer";
    // icone1.deUrlImagem = "https://img.freepik.com/vetores-premium/feliz-garoto-garoto-comer-comida-saudavel_97632-1458.jpg?w=2000";
    //
    // listaIcone.add(icone);
    // listaIcone.add(icone1);
    initTts();
  }

  initTts() {
    flutterTts = FlutterTts();

    _setAwaitOptions();

    if (isAndroid) {
      _getDefaultEngine();
      _getDefaultVoice();
    }

    flutterTts.setStartHandler(() {
      setState(() {
        print("Playing");
        ttsState = TtsState.playing;
      });
    });

    if (isAndroid) {
      flutterTts.setInitHandler(() {
        setState(() {
          print("TTS Initialized");
        });
      });
    }

    flutterTts.setCompletionHandler(() {
      setState(() {
        print("Complete");
        ttsState = TtsState.stopped;
      });
    });

    flutterTts.setCancelHandler(() {
      setState(() {
        print("Cancel");
        ttsState = TtsState.stopped;
      });
    });

    flutterTts.setPauseHandler(() {
      setState(() {
        print("Paused");
        ttsState = TtsState.paused;
      });
    });

    flutterTts.setContinueHandler(() {
      setState(() {
        print("Continued");
        ttsState = TtsState.continued;
      });
    });

    flutterTts.setErrorHandler((msg) {
      setState(() {
        print("error: $msg");
        ttsState = TtsState.stopped;
      });
    });

    flutterTts.setLanguage("pt-PT");
  }

  Future _getDefaultEngine() async {
    var engine = await flutterTts.getDefaultEngine;
    if (engine != null) {
    //  print(engine);
    }
  }

  Future _getDefaultVoice() async {
    var voice = await flutterTts.getDefaultVoice;
    if (voice != null) {
    //  print(voice);
    }
  }

  Future _speak(String texto) async {
    await flutterTts.setVolume(volume);
    await flutterTts.setSpeechRate(rate);
    await flutterTts.setPitch(pitch);
    await flutterTts.speak(texto);
  }

  Future _setAwaitOptions() async {
    await flutterTts.awaitSpeakCompletion(true);
  }

  // Future _stop() async {
  //   var result = await flutterTts.stop();
  //   if (result == 1) setState(() => ttsState = TtsState.stopped);
  // }
  //
  // Future _pause() async {
  //   var result = await flutterTts.pause();
  //   if (result == 1) setState(() => ttsState = TtsState.paused);
  // }

  @override
  void dispose() {
    super.dispose();
    flutterTts.stop();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Express Atypical'),
        ),
        body: GridView.count(
            crossAxisCount:
            (MediaQuery.of(context).orientation == Orientation.portrait
                ? 3
                : 5),
            padding: EdgeInsets.all(4.0),
            crossAxisSpacing: 4.0,
            mainAxisSpacing: 4.0,
            children:
            montaListaIcones(listaIcone))
      ),
    );
  }

  Widget _btnSection() {
    return Container(
      padding: EdgeInsets.only(top: 50.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildButtonColumn(Colors.green, Colors.greenAccent, Icons.play_arrow,
              'PLAY', _speak),
        ],
      ),
    );
  }

  Column _buildButtonColumn(Color color, Color splashColor, IconData icon,
      String label, Function func) {
    return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
              icon: Icon(icon),
              color: color,
              splashColor: splashColor,
              onPressed: () => func()),
          Container(
              margin: const EdgeInsets.only(top: 8.0),
              child: Text(label,
                  style: TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.w400,
                      color: color)))
        ]);
  }

  List<Widget> montaListaIcones(
      List<Icone> listIcone) {
    return listIcone.map((data) {
      return Card(
          semanticContainer: true,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          color: Color.fromRGBO(212, 211, 209, 1),
          child: Material(
            // needed
            child: InkWell(
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //       builder: (context) =>
                //           DescricaoProduto(produtoSelecionado: data)),
                // );
                _speak(data.deIcone!);
              }, // needed
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(data.deUrlImagem!),
                      fit: BoxFit.fitWidth,
                      alignment: Alignment.topCenter,
                    )),
                child: FractionallySizedBox(
                  alignment: Alignment.bottomCenter,
                  widthFactor: 1,
                  heightFactor: 0.3,
                  child: Container(
                    decoration: new BoxDecoration(
                        color: Color.fromRGBO(250, 90, 22, 1),
                        borderRadius: new BorderRadius.only(
                            bottomLeft: const Radius.circular(4.0),
                            bottomRight: const Radius.circular(4.0))),
                    child: Center(
                      child: Text(
                        data.deIcone!,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'BebasNeue',
                            fontSize: 14),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ));
    }).toList();
  }
}
