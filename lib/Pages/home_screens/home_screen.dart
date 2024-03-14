import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:chatwithastrologer/Provider/astro_list_provider.dart';
import 'package:chatwithastrologer/Provider/banner_provider.dart';
import 'package:chatwithastrologer/Utils/api_constants.dart';
import 'package:chatwithastrologer/Utils/utils_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  BannerProvider? bannerProvider;
  var h = 0.0;
  var w = 0.0;
  Future<void> getBanner() async{
    await Provider.of<BannerProvider>(context, listen: false).getBanner();
    await Provider.of<AstroListProvider>(context, listen: false).getAstrolist();
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getBanner();
  }

  @override
  Widget build(BuildContext context) {
    h = MediaQuery.sizeOf(context).height;
    w = MediaQuery.sizeOf(context).width;
    final bannerProvider = Provider.of<BannerProvider>(context);
    final astrolistProvider = Provider.of<AstroListProvider>(context);
    return Scaffold(
      backgroundColor: const Color(0xFFFFF1E1),
      body: SingleChildScrollView(
        child: Column(
          children: [
            bannerProvider.loading  ?
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Shimmer.fromColors(
                baseColor: Colors.grey.shade400,
                highlightColor: Colors.white,
                child: Container(
                  width: MediaQuery.sizeOf(context).width,
                  height: h/6,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)
                  ),
                ),
              ),
            ) :
            CarouselSlider(
              items: bannerProvider.banners?.map((banner) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: w,
                      height: h/5,
                      margin: const EdgeInsets.all(5.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(7),
                        child: CachedNetworkImage(
                          imageUrl: '${banner.subCatImg}',
                          fit: BoxFit.cover,
                          placeholder: (context, url) => const PlaceholderImage(), // Placeholder widget
                          errorWidget: (context, url, error) => const ErrorImage(), // Error widget
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
              options: CarouselOptions(
                enlargeCenterPage: false,
                autoPlay: true,
                aspectRatio: w*0.007,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                viewportFraction: 1,
              ),
            ),
            SizedBox( height: h*0.01,),
            Container(
              width: w,
              height: h/7,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: h/3,
                      margin: EdgeInsets.only(left: 5, right: 5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 2,
                            offset: Offset(0, 1), // changes position of shadow
                          ),
                        ]
                      ),
                      child: InkWell(
                        onTap: (){},
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: h/150,
                              width: w*0.15,
                              color: Colors.orange.shade100,
                            ),
                            Container(
                              padding: EdgeInsets.all(5.0),
                              decoration: BoxDecoration(
                                color: Colors.orange.shade100,
                                shape: BoxShape.circle,

                              ),
                              child: Image.asset('assets/images/horoscope_icon.png', width: w*0.16, height: w*0.16,),
                            ),
                            Text('Horoscope', style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: w*0.03,
                              fontWeight: FontWeight.w600
                            ),),
                            Container(
                              height: h/150,
                              width: w*0.15,
                              color: Colors.orange.shade100,
                            ),
                          ],
                        ),
                      ),
                    ),
                    flex: 1,
                  ),
                  Expanded(
                    child: Container(
                      height: h/3,
                      margin: EdgeInsets.only(left: 5, right: 5),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 2,
                              offset: Offset(0, 1), // changes position of shadow
                            ),
                          ]
                      ),
                      child: InkWell(
                        onTap: (){},
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: h/150,
                              width: w*0.15,
                              color: Colors.orange.shade100,
                            ),
                            Container(
                              padding: EdgeInsets.all(5.0),
                              width: w*0.18, height: w*0.18,
                              decoration: BoxDecoration(
                                color: Colors.orange.shade100,
                                shape: BoxShape.circle,

                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: Image.asset('assets/images/kundli_icon.png', width: w*0.17, height: w*0.17,),
                              ),
                            ),
                            Text('Kundli', style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: w*0.03,
                                fontWeight: FontWeight.w600
                            ),),
                            Container(
                              height: h/150,
                              width: w*0.15,
                              color: Colors.orange.shade100,
                            ),
                          ],
                        ),
                      ),
                    ),
                    flex: 1,
                  ),
                  Expanded(
                    child: Container(
                      height: h/3,
                      margin: EdgeInsets.only(left: 5, right: 5),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 2,
                              offset: Offset(0, 1), // changes position of shadow
                            ),
                          ]
                      ),
                      child: InkWell(
                        onTap: (){},
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: h/150,
                              width: w*0.15,
                              color: Colors.orange.shade100,
                            ),
                            Container(
                              padding: EdgeInsets.all(0.0),
                              width: w*0.18, height: w*0.18,
                              decoration: BoxDecoration(
                                color: Colors.orange.shade100,
                                shape: BoxShape.circle,
                              ),
                                child: Image.asset('assets/images/match_making_icon.png', width: w*0.17, height: w*0.17,),
                            ),
                            Text('Match Making',
                              softWrap: false,
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: w*0.03,
                                letterSpacing: 0.001,
                                fontWeight: FontWeight.w600
                            ),),
                            Container(
                              height: h/150,
                              width: w*0.15,
                              color: Colors.orange.shade100,
                            ),
                          ],
                        ),
                      ),
                    ),
                    flex: 1,
                  ),
                  Expanded(
                    child: Container(
                      height: h/3,
                      margin: EdgeInsets.only(left: 5, right: 5),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 2,
                              offset: Offset(0, 1), // changes position of shadow
                            ),
                          ]
                      ),
                      child: InkWell(
                        onTap: (){},
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: h/150,
                              width: w*0.15,
                              color: Colors.orange.shade100,
                            ),
                            Container(
                              padding: EdgeInsets.all(0.0),
                              width: w*0.18, height: w*0.18,
                              decoration: BoxDecoration(
                                color: Colors.orange.shade100,
                                shape: BoxShape.circle,

                              ),
                              child: Image.asset('assets/images/numerology_icon.png', width: w*0.17, height: w*0.17,),
                            ),
                            Text('Numerology', style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: w*0.03,
                                fontWeight: FontWeight.w600
                            ),),
                            Container(
                              height: h/150,
                              width: w*0.15,
                              color: Colors.orange.shade100,
                            ),
                          ],
                        ),
                      ),
                    ),
                    flex: 1,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5.0, right: 5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Top astrologers', style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600
                  ),),
                  TextButton(
                      onPressed: (){},
                      child: Text('See all',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400
                        ),
                      )
                  )
                ],
              ),
            ),
            astrolistProvider.astrolistModel.records?.length == 0 ?
            Container(
              width: MediaQuery.sizeOf(context).width,
              height: 100,
              child: Center(
                child: Text('no astrologer found!'),
              ),
            ) :
            Container(
              width: w,
              height: h/5,
              child: astrolistProvider.loading ?
              ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 2,
                  itemBuilder: (BuildContext context, int index){
                    return Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Shimmer.fromColors(
                        baseColor: Colors.grey.shade400,
                        highlightColor: Colors.white,
                        child: Container(
                          decoration: ShapeDecoration(
                            color: Colors.grey,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          width: MediaQuery.sizeOf(context).width, height: 120,
                        ),
                      ),
                    );
                  }) :
              ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: astrolistProvider.astrolistModel.records!.length > 4 ? 4 : astrolistProvider.astrolistModel.records?.length,
                  itemBuilder: (BuildContext context, int Index){
                    final astrologerList = astrolistProvider.astrolistModel.records?[Index];
                    return InkWell(
                      onTap: ()
                      {
                       // Navigator.push(context, MaterialPageRoute(builder: (context) => astrologerDetailCall(id: '${astrologerList?.id}',)));
                      },
                      child: Container(
                        width: w/3,
                        height: h/2,
                        margin: EdgeInsets.only(left: 5, right: 5),
                        decoration: BoxDecoration(
                            color: Colors.amber.shade700,
                            borderRadius: BorderRadius.circular(10),
                        ),
                        child: Stack(
                          children: [
                            Positioned(
                              left: w*0.07,
                                right: w*0.07,
                                top: w*0.03,
                                child: SizedBox(
                                  width: w/5.5,
                                  height: w/5.5,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(h/15),
                                    child: CachedNetworkImage(
                                      imageUrl: '${astrologerList?.image}',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                            ),
                            Positioned(
                              top: h/12,
                                left: w/10,
                                right: w/10,
                                child: Container(
                                  padding: EdgeInsets.only(left: 5, right: 5, top: 2, bottom: 2),
                                  decoration: BoxDecoration(
                                      color: Colors.amber.shade700,
                                      borderRadius: BorderRadius.circular(20),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          spreadRadius: 2,
                                          blurRadius: 2,
                                          offset: Offset(0, 1), // changes position of shadow
                                        ),
                                      ]
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Icon(Icons.star_rounded,color: Colors.white, size: w*0.05,),
                                      Text('${double.parse('${astrologerList?.avgRating}').round()}',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500
                                      ),)
                                    ],
                                  ),
                                )
                            ),
                            Positioned(
                              top: h/8,
                                child: Text(
                                    '${astrologerList?.ownerName}',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: w*0.03,
                                  ),
                                )
                            ),
                          ],
                        ),
                      ),
                    );
                  }
              ),
            ),
          ],
        ),
      ),
    );
  }
}
