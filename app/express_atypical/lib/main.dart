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
    icone1.deUrlImagem = "https://www.flaticon.com/br/icone-gratis/mae-e-filho_4605448?term=m%C3%A3e&page=1&position=15&origin=search&related_id=4605448";
    listaIcone.add(icone1);
    Icone icone2 = Icone();
    icone2.deIcone = "Pai";
    icone2.deUrlImagem = "https://www.flaticon.com/br/icone-gratis/pai-e-filho_4605441?term=pai&page=1&position=1&origin=search&related_id=4605441";
    listaIcone.add(icone2);
    Icone icone3 = Icone();
    icone3.deIcone = "Avó";
    icone3.deUrlImagem = "https://www.flaticon.com/br/icone-gratis/avo_375201?term=av%C3%B3&page=1&position=15&origin=search&related_id=375201";

    listaIcone.add(icone3);
    Icone icone4 = Icone();
    icone4.deIcone = "Avô";
    icone4.deUrlImagem = "https://www.flaticon.com/br/icone-gratis/avo_437545?term=av%C3%B4&page=1&position=8&origin=search&related_id=437545";
    listaIcone.add(icone4);
    Icone icone5 = Icone();
    icone5.deIcone = "Irmã";
    icone5.deUrlImagem = "https://www.flaticon.com/br/icone-gratis/menina_6406267?term=menina&page=1&position=9&origin=search&related_id=6406267";
    listaIcone.add(icone5);
    Icone icone6 = Icone();
    icone6.deIcone = "Irmão";
    icone6.deUrlImagem = "https://www.flaticon.com/br/icone-gratis/garoto_522396?term=menino&page=1&position=10&origin=search&related_id=522396";
    listaIcone.add(icone6);   
    Icone icone7 = Icone();
    icone7.deIcone = "Alegria";
    icone7.deUrlImagem = "https://www.flaticon.com/br/icone-gratis/risonho_4288831?term=alegria&page=1&position=3&origin=search&related_id=4288831";

    listaIcone.add(icone7);
    Icone icone8 = Icone();
    icone8.deIcone = "Tristeza";
    icone8.deUrlImagem = "https://www.flaticon.com/br/icone-gratis/infeliz_2691115?term=tristeza&page=1&position=3&origin=search&related_id=2691115";
    listaIcone.add(icone8);
    Icone icone = Icone();
    icone.deIcone = "Raiva";
    icone.deUrlImagem = "https://www.flaticon.com/br/icone-gratis/bravo_3260838?term=raiva&page=1&position=1&origin=search&related_id=3260838";
    listaIcone.add(icone);
    Icone icone9 = Icone();
    icone9.deIcone = "Medo";
    icone9.deUrlImagem = "https://www.flaticon.com/br/icone-gratis/paranoia_4897688?term=medo&related_id=4897688";
    listaIcone.add(icone9);
    Icone icone10 = Icone();
    icone10.deIcone = "Nojo";
    icone10.deUrlImagem = "https://www.flaticon.com/br/icone-gratis/que-nojo_7983573?term=que+nojo&page=1&position=1&origin=search&related_id=7983573";
    listaIcone.add(icone10);
    Icone icone11 = Icone();
    icone11.deIcone = "Surpresa";
    icone11.deUrlImagem = "https://www.flaticon.com/br/icone-gratis/surpreso_260113?term=surpresa&page=1&position=29&origin=search&related_id=260113";
    listaIcone.add(icone11);
    Icone icone12 = Icone();
    icone12.deIcone = "Cabeça";
    icone12.deUrlImagem = "https://www.flaticon.com/br/icone-gratis/dor-de-cabeca_6162739?term=cabe%C3%A7a&page=1&position=20&origin=search&related_id=6162739";
    listaIcone.add(icone12);
    Icone icone13 = Icone();
    icone13.deIcone = "Pescoço";
    icone13.deUrlImagem = "https://www.flaticon.com/br/icone-gratis/pescoco_5745568?term=pesco%C3%A7o&page=1&position=17&origin=search&related_id=5745568";
    listaIcone.add(icone13);
    Icone icone14 = Icone();
    icone14.deIcone = "Barriga";
    icone14.deUrlImagem = "https://www.flaticon.com/br/icone-gratis/dor-de-estomago_10665?term=barriga&page=1&position=5&origin=search&related_id=10665";
    listaIcone.add(icone14);
    Icone icone15 = Icone();
    icone15.deIcone = "Perna";
    icone15.deUrlImagem = "https://www.flaticon.com/br/icone-gratis/perna_2324788?term=perna&page=1&position=7&origin=search&related_id=2324788";
    listaIcone.add(icone15);
    Icone icone16 = Icone();
    icone16.deIcone = "Pé";
    icone16.deUrlImagem = "https://www.flaticon.com/br/icone-gratis/pe_2416863?term=p%C3%A9&page=1&position=4&origin=search&related_id=2416863";
    listaIcone.add(icone16);
    Icone icone17 = Icone();
    icone17.deIcone = "Calor";
    icone17.deUrlImagem = "https://www.flaticon.com/br/icone-gratis/quente_3313902?term=calor&page=1&position=3&origin=search&related_id=3313902";
    listaIcone.add(icone17);
    Icone icone18 = Icone();
    icone18.deIcone = "Frio";
    icone18.deUrlImagem = "https://www.flaticon.com/br/icone-gratis/termometro_2930143?term=frio&page=1&position=5&origin=search&related_id=2930143";
    listaIcone.add(icone18);
    Icone icone19 = Icone();
    icone19.deIcone = "Chuva";
    icone19.deUrlImagem = "https://www.flaticon.com/br/icone-gratis/chuva-pesada_4088914?term=chuva&page=1&position=2&origin=search&related_id=4088914";
    listaIcone.add(icone19);
    Icone icone20 = Icone();
    icone20.deIcone = "Tempestade";
    icone20.deUrlImagem = "https://www.flaticon.com/br/icone-gratis/tempestade_606806?term=tempestade&page=1&position=7&origin=search&related_id=606806";
    listaIcone.add(icone20);
    Icone icone21 = Icone();
    icone21.deIcone = "Neblina";
    icone21.deUrlImagem = "https://www.flaticon.com/br/icone-gratis/nevoa_2910041?term=neblina&page=1&position=3&origin=search&related_id=2910041";
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
