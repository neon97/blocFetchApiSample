import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ftips_bloc_fetch_api/blocs/mountainer_bloc/mountainer_event.dart';
import 'package:ftips_bloc_fetch_api/blocs/mountainer_bloc/mountainer_state.dart';
import 'package:ftips_bloc_fetch_api/resources/api_repository.dart';

class MountainersBlogBloc
    extends Bloc<MountainersBlogEvent, MountainerBlogState> {
  MountainersBlogBloc() : super(MountainersInitial()) {
    final ApiRepository _apiRepository = ApiRepository();

    on<GetMountainersList>((event, emit) async {
      try {
        emit(MountainersLoading());
        final mList = await _apiRepository.fetchMountainersList();
        emit(MountainersLoaded(mList));
        if (mList.status == 'false') {
          emit(MountainersError(mList.message));
        }
      } on NetworkError {
        emit(MountainersError("Failed to fetch data. is your device online?"));
      }
    });
  }
}
