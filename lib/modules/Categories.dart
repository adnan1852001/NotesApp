import 'package:flutter/material.dart';
import 'package:notes/modules/category_name.dart';
import 'package:notes/modules/settings.dart';
import 'package:provider/provider.dart';

import '../layout/provider/my_provider.dart';
import '../models/DataBaseHelper.dart';
import '../shared/components/constants/widgets/addTaskDialog.dart';
import '../shared/components/constants/widgets/editTaskDialog.dart';
import '../shared/network/remote/back_navigator.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    var db = DBHelper();
    db.getAllTasks().then((value) {
      Provider.of<MyProvider>(context, listen: false).setTasks(value);
    });
    return Scaffold(
        backgroundColor: const Color(0xffE4E4E4),
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color(0xff6A90F2),
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AddTaskDialog(
                    db: db,
                    screen: const Categories(),
                    finalPop: true,
                  );
                });
          },
          child: Icon(Icons.add),
        ),
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          title: const Text('Categories',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20.0,
              )),
          actions: [
            IconButton(
                onPressed: () {
                  BackNavigator(context, nextScreen: Settings());
                },
                icon: const Padding(
                  padding: EdgeInsets.only(right: 20.0),
                  child: Icon(
                    Icons.settings,
                    color: Colors.black,
                    size: 30,
                  ),
                ))
          ],
        ),
        body: Consumer<MyProvider>(
          builder: (context, value, child) {
            return value.tasks != null
                ? Padding(
                    padding: const EdgeInsets.only(
                      left: 18.0,
                      right: 18.0,
                      bottom: 18.0,
                      top: 35.0,
                    ),
                    child: ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      itemCount: value.tasks!.length,
                      separatorBuilder: (_, int position) => Text(''),
                      itemBuilder: (_, int position) {
                        return InkWell(
                          onTap: () {
                            //Category Name
                            BackNavigator(context,
                                nextScreen: const CategoryName());
                          },
                          child: Stack(
                            alignment: Alignment.centerRight,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                height: 80,
                                child: ListTile(
                                  title: Row(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 8.0),
                                        child: CircleAvatar(
                                          radius: 27,
                                          backgroundColor: Color(0xff6A90F2),
                                          child: Text(
                                            value.tasks![position].taskName!
                                                .substring(0, 1)
                                                .toUpperCase(),
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 22,
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 10.0),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            width: 200,
                                            child: Text(
                                              value.tasks![position].taskName!,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: const TextStyle(
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 150,
                                            child: Text(
                                              value.tasks![position]
                                                  .shortDescription!,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: const TextStyle(
                                                fontSize: 14.0,
                                                color: Color(0xffA5A5A5),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(width: 10.0),
                                      GestureDetector(
                                        onTap: () {
                                          Widget cancelButton = MaterialButton(
                                            child: Text("Cancel"),
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                          );
                                          Widget continueButton =
                                              MaterialButton(
                                            child: Text("Yes"),
                                            onPressed: () {
                                              db.deleteTask(
                                                  value.tasks![position].id!);
                                              Navigator.of(context)
                                                  .pushAndRemoveUntil(
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              Categories()),
                                                      (Route<dynamic> route) =>
                                                          false);
                                            },
                                          );

                                          AlertDialog alert = AlertDialog(
                                            title: Text("Delete Task?"),
                                            content: const Text(
                                                "Are you want to delete this Task?"),
                                            actions: [
                                              cancelButton,
                                              continueButton,
                                            ],
                                          );

                                          showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return alert;
                                            },
                                          );
                                        },
                                        child: const Icon(
                                          Icons.delete,
                                          color: Color(0xffD84040),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return EditTaskDialog(
                                          db: db,
                                          title:
                                              value.tasks![position].taskName!,
                                          sDescription: value.tasks![position]
                                              .shortDescription!,
                                          description: value
                                              .tasks![position].description!,
                                        );
                                      });
                                },
                                child: Container(
                                  decoration: const BoxDecoration(
                                    color: Color(0xff6A90F2),
                                    borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(5),
                                      topRight: Radius.circular(5),
                                    ),
                                  ),
                                  height: 80,
                                  width: 20,
                                  child: const Icon(
                                    Icons.edit,
                                    size: 18,
                                    color: Colors.white,
                                  ),
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  )
                : const Center(child: CircularProgressIndicator());
          },
        ));
  }
}
