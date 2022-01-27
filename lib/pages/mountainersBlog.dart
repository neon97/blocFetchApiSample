import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ftips_bloc_fetch_api/blocs/mountainer_bloc/mountainer_bloc.dart';
import 'package:ftips_bloc_fetch_api/blocs/mountainer_bloc/mountainer_event.dart';
import 'package:ftips_bloc_fetch_api/blocs/mountainer_bloc/mountainer_state.dart';
import 'package:ftips_bloc_fetch_api/models/MountainerModel/mountainers_model.dart';

class MountainersPage extends StatefulWidget {
  @override
  _MountainersPageState createState() => _MountainersPageState();
}

class _MountainersPageState extends State<MountainersPage> {
  final MountainersBlogBloc _blogsBloc = MountainersBlogBloc();

  @override
  void initState() {
    _blogsBloc.add(GetMountainersList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Mountainers Blogs List')),
      body: _buildListMountainers(),
    );
  }

  Widget _buildListMountainers() {
    return Container(
      margin: EdgeInsets.all(8.0),
      child: BlocProvider(
        create: (_) => _blogsBloc,
        child: BlocListener<MountainersBlogBloc, MountainerBlogState>(
          listener: (context, state) {
            if (state is MountainersError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message!),
                ),
              );
            }
          },
          child: BlocBuilder<MountainersBlogBloc, MountainerBlogState>(
            builder: (context, state) {
              if (state is MountainersInitial) {
                return _buildLoading();
              } else if (state is MountainersLoading) {
                return _buildLoading();
              } else if (state is MountainersLoaded) {
                return _buildCard(context, state.mountainersModel);
              } else if (state is MountainersError) {
                return Container();
              } else {
                return Container();
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _buildCard(BuildContext context, MountainersModel model) {
    return ListView.builder(
      itemCount: model.totalCount,
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.all(8.0),
          child: Card(
            child: Container(
              margin: EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  Text("Name: ${model.blogList![index].bloggerName}"),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildLoading() => Center(child: CircularProgressIndicator());
}
