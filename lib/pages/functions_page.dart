import 'package:flutter/material.dart';
import 'package:meditator_app/models/function_data_model.dart';
import 'package:meditator_app/utils/colors.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class FunctionsPage extends StatefulWidget {
  final FunctionData functionData;
  const FunctionsPage({super.key, required this.functionData});

  @override
  State<FunctionsPage> createState() => _FunctionsPageState();
}

class _FunctionsPageState extends State<FunctionsPage> {

late YoutubePlayerController _controller ;

@override
  void initState() {
    // TODO: implement initState
    super.initState();

    //get video id from url
    final videoId = YoutubePlayer.convertUrlToId(widget.functionData.url) ?? " ";
    _controller = YoutubePlayerController(
      initialVideoId: videoId,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      )
    
    );
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.functionData.title),
      ),
      body: SafeArea(child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //todo: youtube player
              if(_controller.initialVideoId.isNotEmpty)
              AspectRatio(
                aspectRatio: 16/9,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: YoutubePlayer(controller: _controller),
                ),
                )
                else
                const Text("No video available!"), 
              const SizedBox(height: 40,),
              Text("Duration : ${widget.functionData.duration} min",style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w300,
                color: AppColors.primaryGrey,
              ),
              ),
              const SizedBox(height: 10,),
              Text("Category : ${widget.functionData.category}",style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w300,
                color: AppColors.primaryGreen,
              ),
              ),
              const SizedBox(height: 10,),
              Text(widget.functionData.description,style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w300,
                color: AppColors.primaryDarkBlue,
              ),)
            ],
          ),
        ),
      )),
    );
  }
}