import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

import '../../../core/routes/app_routes.dart';
import '../../../core/theme/app_colors.dart';
import '../../music/Views/music_player_view.dart';
import '../../shared/models/jap_model.dart';
import '../../shared/models/song_model.dart';

class FeaturedMantras extends StatelessWidget {
  const FeaturedMantras({super.key});



  @override
  Widget build(BuildContext context) {



    final List<JapModel> japs = [
      JapModel(
        id: "1",
        godName: "Shree Swami Samarth",
        mantra: "Shree Swami Samarth",
        image: "assets/images/swami.jpeg",
        audio: "assets/audio/shree_swami_samarth.mp3",
      ),
      JapModel(
        id: "2",
        godName: "Lord Krishna",
        mantra: "Hare Krishna",
        image: "assets/images/krishna.jpeg",
        audio: "assets/audio/shree_krishna.mp3",
      ),
    ];

    return SizedBox(
      height: 195,

      child: ListView.builder(

        padding:
        const EdgeInsets.only(
          left: 16,
        ),

        scrollDirection: Axis.horizontal,

        itemCount: japs.length,

        itemBuilder: (context, index) {

          final jap = japs[index];

          return GestureDetector(
            onTap: () {
              // if(index==0){
              //   Get.toNamed(
              //     Routes.MUSIC,
              //     arguments: song,
              //   );
              // }
              // else{
              //   Get.toNamed(
              //       Routes.AUTOJAP,
              //       arguments: {
              //         'jap': jap,
              //         'target': 108,
              //       },
              //     );
              // }
              Get.toNamed(
                Routes.AUTOJAP,
                arguments: {
                  "jap": jap,
                  "target": 108,
                },
              );

            },
            child: Container(
            
              width: 290,
            
              margin: const EdgeInsets.only(
                right: 16,
              ),
            
              decoration: BoxDecoration(
            
                borderRadius: BorderRadius.circular(28),
            
                gradient: const LinearGradient(
            
                  begin: Alignment.topLeft,
            
                  end: Alignment.bottomRight,
            
                  colors: [
            
                    Color(0xffFFB300),
                    Color(0xffFF7043),
                  ],
                ),
            
                boxShadow: [
                  BoxShadow(
            
                    color: Colors.orange
                        .withOpacity(.25),
            
                    blurRadius: 20,
            
                    offset:
                    const Offset(0, 8),
                  ),
                ],
              ),
            
              child: Stack(
            
                children: [
            
                  Positioned(
                    right: -10, top: -15,
            
                    child: Opacity(
            
                      opacity: .08,
            
                      child: Text(
            
                        "ॐ",
            
                        style: TextStyle(
            
                          fontSize: 120,
            
                          fontWeight:
                          FontWeight.bold,
            
                          color:
                          Colors.white,
                        ),
                      ),
                    ),
                  ),
            
                  Padding(
            
                    padding:
                    const EdgeInsets.all(
                      20,
                    ),
            
                    child: Column(
            
                      crossAxisAlignment:
                      CrossAxisAlignment
                          .start,
            
                      children: [
            
                        Row(
            
                          children: [
            
                            // Container(
                            //
                            //   padding:
                            //   const EdgeInsets
                            //       .all(12),
                            //
                            //   decoration:
                            //   BoxDecoration(
                            //
                            //     color: Colors
                            //         .white
                            //         .withOpacity(
                            //         .18),
                            //
                            //     shape:
                            //     BoxShape.circle,
                            //   ),
                            //
                            //   child: Icon(
                            //
                            //     jap.image
                            //     as IconData,
                            //
                            //     color:
                            //     Colors.white,
                            //
                            //     size: 26,
                            //   ),
                            // ),
            
                            const Spacer(),
            
                            Container(
            
                              padding: const EdgeInsets
                                  .all(10),
            
                              decoration: BoxDecoration(
            
                                color: Colors
                                    .white
                                    .withOpacity(
                                    .18),
            
                                shape:
                                BoxShape.circle,
                              ),
            
                              child: const Icon(
            
                                Icons.play_arrow,
            
                                color:
                                Colors.white,
                              ),
                            ),
                          ],
                        ),
            
                        const Spacer(),
            
                        Text(
            
                          jap.godName,
            
                          style:
                          const TextStyle(
            
                            color:
                            Colors.white,
            
                            fontSize: 22,
            
                            fontWeight:
                            FontWeight.bold,
                          ),
                        ),
            
                        const SizedBox(
                          height: 6,
                        ),
            
                        Text(
            
                          jap.mantra,
            
                          style:
                          const TextStyle(
            
                            color:
                            Colors.white70,
            
                            fontSize: 14,
                          ),
                        ),
            
                        const SizedBox(
                          height: 16,
                        ),
            
                        Container(
            
                          padding:
                          const EdgeInsets
                              .symmetric(
            
                            horizontal: 12,
                            vertical: 6,
                          ),
            
                          decoration: BoxDecoration(
            
                            color:
                            Colors.white
                                .withOpacity(
                                .18),
            
                            borderRadius:
                            BorderRadius
                                .circular(
                              20,
                            ),
                          ),
            
                          child: const Text(
            
                            "Listen Now",
            
                            style: TextStyle(
            
                              color:
                              Colors.white,
            
                              fontWeight:
                              FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}