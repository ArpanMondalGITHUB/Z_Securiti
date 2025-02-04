import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:khanakhazana/features/map/presentation/bloc/current_location_bloc.dart';
import 'package:khanakhazana/features/map/presentation/widgets/custom_map_widget.dart';
import 'package:khanakhazana/global/common/widget/loader.dart';
import 'package:khanakhazana/global/utils/show_snackbar.dart';

class UserLocationPage extends StatefulWidget {
  const UserLocationPage({super.key});

  @override
  State<UserLocationPage> createState() => _UserLocationPageState();
}

class _UserLocationPageState extends State<UserLocationPage> {
  @override
  void initState() {
    super.initState();
    GetIt.I<CurrentLocationBloc>().add(FetchCurrentLocation());
  }

  @override
  Widget build(BuildContext context) {
    final locationbloc = GetIt.I<CurrentLocationBloc>();
    return Scaffold(
      body: BlocConsumer<CurrentLocationBloc, CurrentLocationState>(
        bloc: locationbloc,
        listener: (context, state) {
          if (state is CurrenLocationLoadingFailed) {
            return showSnakBar(context, state.message);
          }
        },
        builder: (context, state) {
          if (state is CurrentLocationLoading) {
            return const Center(
              child: Loader(),
            );
          } else if (state is CurrentLocationLoaded) {
            return Column(
              children: [
                Expanded(
                  flex: 3,
                  child: CustomMapWidget(
                    latitude: state.location.latitude,
                    longitude: state.location.longitude,
                    markerId: 'user-location',
                    infoWindow: 'your_location',
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    padding: const EdgeInsets.all(16.0),
                    alignment: Alignment.topCenter,
                    child: Text(
                      'Address: ${state.location.address}',
                      style: const TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            );
          }
          return const Center(child: Text('Fetching location...'));
        },
      ),
    );
  }
}
