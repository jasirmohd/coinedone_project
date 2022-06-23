import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:student_dashboard/bloc/student_bloc.dart';
import 'package:student_dashboard/model/student_model.dart';
import 'package:student_dashboard/res/drawable.dart';
import 'package:student_dashboard/utils/percentage_converter.dart';
import 'package:student_dashboard/utils/time_converter.dart';
import 'package:student_dashboard/widgets/app_bar/app_bar_widget.dart';
import 'package:student_dashboard/widgets/button/elevated_button_widget.dart';
import 'package:student_dashboard/widgets/button/text_button_widget.dart';
import 'package:student_dashboard/widgets/percent_indicator/percentage_indicator_widget.dart';
import 'package:student_dashboard/widgets/row/device_row_widget.dart';
import 'package:student_dashboard/widgets/row/text_row_widget.dart';
import 'package:student_dashboard/widgets/text/text_widget.dart';

import '../res/strings.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  DashboardScreenState createState() => DashboardScreenState();
}

class DashboardScreenState extends State<DashboardScreen> {
  final StudentBloc _studentBloc = StudentBloc();

  @override
  void initState() {
    _studentBloc.add(GetStudentData());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        text: 'Michael',
        leadingColor: Colors.pinkAccent.shade100,
        onTap: onTap,
        leadingSize: 35,
        icon: Icons.settings_outlined,
        iconSize: 25,
      ),
      body: Container(
        margin: const EdgeInsets.all(8.0),
        child: BlocProvider(
          create: (_) => _studentBloc,
          child: BlocListener<StudentBloc, StudentBlocState>(
            listener: (context, state) {
              if (state is StudentError) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.message!),
                  ),
                );
              }
            },
            child: BlocBuilder<StudentBloc, StudentBlocState>(
              builder: (context, state) {
                if (state is StudentInitial) {
                  return _buildLoading();
                } else if (state is StudentLoading) {
                  return _buildLoading();
                } else if (state is StudentLoaded) {
                  return _bodyWidget(context, state.studentModel);
                } else if (state is StudentError) {
                  return Container();
                } else {
                  return Container();
                }
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLoading() => const Center(child: CircularProgressIndicator());

  Widget _bodyWidget(BuildContext context, StudentModel model) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: TextWidget(
                text: Strings.tDashboard,
                textSize: 22,
                textWeight: FontWeight.bold,
              ),
            ),
          ),
          _circularPercentBarWidget(context, model.data!.screenTime!),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: _screenTimeTextRowWidget(context, model.data!.screenTime),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Divider(
              thickness: 3,
              color: Colors.grey.shade200,
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Center(
              child: TextWidget(
                text: Strings.tFreeTimeUsage,
                textWeight: FontWeight.bold,
                textSize: 22,
              ),
            ),
          ),
          _linearPercentBarWidget(context, model.data!.freeTime),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
            child: ButtonWidget(
              text: Strings.tExtendFreeTime,
              onTap: onTap,
              textColor: Colors.blue,
              buttonColor: Colors.white,
            ),
          ),
          TextButtonWidget(
            text: Strings.tChangeTimeRestrictions,
            onTap: onTap,
            labelColor: Colors.blue,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Divider(
              thickness: 3,
              color: Colors.grey.shade200,
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Center(
              child: TextWidget(
                text: Strings.tByDevice,
                textSize: 22,
                textWeight: FontWeight.bold,
              ),
            ),
          ),
          _deviceListWidget(context, model.data!.devices!),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButtonWidget(
              text: 'See All Devices',
              onTap: onTap,
              labelColor: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }

  void onTap() {}

  ///circular percentage bar widget
  Widget _circularPercentBarWidget(BuildContext context, dynamic screenTime) {
    return Container(
      height: MediaQuery.of(context).size.height / 3,
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.center,
      child: Stack(
        children: [
          PercentageIndicatorWidget(
              percentValue: PercentageConverter()
                  .convertPercent(screenTime!.total!, screenTime!.total!),
              text: TimeConverter().timeConvert(screenTime!.total!),
              valueColor: Colors.blue),
          PercentageIndicatorWidget(
              percentValue: PercentageConverter()
                  .convertPercent(screenTime!.free!, screenTime!.total!),
              text: TimeConverter().timeConvert(screenTime!.total!),
              valueColor: Colors.orange.shade500),
          PercentageIndicatorWidget(
              // backgroundColor: Colors.blue.shade300,
              percentValue: PercentageConverter()
                  .convertPercent(screenTime!.study!, screenTime!.total!),
              text: TimeConverter().timeConvert(screenTime!.total!),
              valueColor: Colors.green),
        ],
      ),
    );
  }

  ///devices list widget
  Widget _deviceListWidget(BuildContext context, List<Device> devicesList) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: DeviceRowWidget(
            image: Drawable.filePath + Drawable.phoneImage,
            device: devicesList[0].name!,
            time: TimeConverter().timeConvert(devicesList[0].usage!),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: DeviceRowWidget(
            image: Drawable.filePath + Drawable.laptopImage,
            device: devicesList[1].name!,
            time: TimeConverter().timeConvert(devicesList[1].usage!),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: DeviceRowWidget(
            image: Drawable.filePath + Drawable.tabletImage,
            device: devicesList[2].name!,
            time: TimeConverter().timeConvert(devicesList[2].usage!),
          ),
        ),
      ],
    );
  }

  ///linear percentage bar widget
  Widget _linearPercentBarWidget(BuildContext context, dynamic freeTime) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 45.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWidget(
                        text: 'Used',
                        textWeight: FontWeight.bold,
                        textSize: 16,
                      ),
                      TextWidget(
                        text: TimeConverter().timeConvert(
                          freeTime.usage!,
                        ),
                        textWeight: FontWeight.bold,
                        textColor: Colors.green.shade900,
                        textSize: 22,
                      ),
                    ],
                  ),
                )),
            Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 45.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      TextWidget(
                        text: 'Max',
                        textWeight: FontWeight.bold,
                        textSize: 16,
                      ),
                      TextWidget(
                        text: TimeConverter().timeConvert(freeTime!.limit!),
                        textWeight: FontWeight.bold,
                        textSize: 22,
                      ),
                    ],
                  ),
                )),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: LinearPercentIndicator(
            percent: PercentageConverter()
                .convertPercent(freeTime!.usage!, freeTime!.limit!),
            progressColor: Colors.green,
            lineHeight: 30,
            barRadius: const Radius.circular(25),
          ),
        ),
      ],
    );
  }

  ///screen time details row widget
  Widget _screenTimeTextRowWidget(BuildContext context, dynamic screenTime) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20.0),
      alignment: Alignment.center,
      child: Row(
        children: [
          Expanded(
              flex: 2,
              child: TextRowWidget(
                  time:
                      TimeConverter().timeConvert(screenTime!.screenTimeClass!),
                  text: 'Class',
                  containerColor: Colors.blue)),
          Expanded(
              flex: 2,
              child: TextRowWidget(
                  time: TimeConverter().timeConvert(screenTime!.study!),
                  text: 'Study',
                  containerColor: Colors.orange.shade500)),
          Expanded(
              flex: 2,
              child: TextRowWidget(
                  time: TimeConverter().timeConvert(screenTime!.free!),
                  text: 'Free-Time',
                  containerColor: Colors.green.shade500)),
        ],
      ),
    );
  }
}
