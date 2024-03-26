import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:got/constant/app_color.dart';
import 'package:got/controller/home_controller.dart';
import 'package:got/model/data_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:got/widget/text_widget.dart';

class DataPage extends StatelessWidget {
  final int page;
  const DataPage({super.key, required this.page});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find<HomeController>();
    return page == 8
        ? Obx(
            () => Scaffold(
              backgroundColor: controller.isDarkMode.value
                  ? AppColor.blackColor
                  : AppColor.whiteColor,
              body: SafeArea(
                  child: Column(
                children: [
                  Expanded(
                    child: CachedNetworkImage(
                      imageUrl:
                          'https://i0.wp.com/insidefilmroom.com/wp-content/uploads/2019/04/giphy.gif?resize=480%2C269&ssl=1',
                      imageBuilder: (context, imageProvider) => Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      placeholder: (context, url) =>
                          const Center(child: CircularProgressIndicator()),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  )
                ],
              )),
            ),
          )
        : Obx(
            () => Scaffold(
              backgroundColor: controller.isDarkMode.value
                  ? AppColor.blackColor
                  : AppColor.whiteColor,
              body: SafeArea(
                  bottom: false,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 16.0, horizontal: 24.0),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Obx(
                            () => BigText(
                              text: titles[page],
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                              color: controller.isDarkMode.value
                                  ? AppColor.darkBlue
                                  : AppColor.lightBlue,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Obx(
                            () => BigText(
                              text: subTitles[page],
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                              textDecoration: TextDecoration.underline,
                              color: controller.isDarkMode.value
                                  ? AppColor.darkBlue
                                  : AppColor.lightBlue,
                            ),
                          ),
                          const SizedBox(height: 32),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Expanded(
                                  child: Obx(
                                () => Text(
                                  body[page],
                                  style: TextStyle(
                                    fontSize: 16,
                                    height: 1.5,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'Droid Sans',
                                    color: controller.isDarkMode.value
                                        ? AppColor.darkBlue
                                        : AppColor.lightBlue,
                                  ),
                                ),
                              )),
                            ],
                          ),
                          const SizedBox(height: 16.0),
                          SizedBox(
                            height: 400,
                            width: double.infinity,
                            child: CachedNetworkImage(
                              imageUrl: images[page],
                              imageBuilder: (context, imageProvider) =>
                                  Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: imageProvider,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              placeholder: (context, url) => const Center(
                                  child: CircularProgressIndicator()),
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                            ),
                            // Image.network(
                            //   images[page],
                            //   fit: BoxFit.cover,
                            // )
                          ),
                          const SizedBox(height: 16.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Obx(
                                () => Text(
                                  (page + 1).toString(),
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontFamily: 'Droid Sans',
                                      color: controller.isDarkMode.value
                                          ? AppColor.darkBlue
                                          : AppColor.lightBlue,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16.0),
                        ],
                      ),
                    ),
                  )),
            ),
          );
  }
}
