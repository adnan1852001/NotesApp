// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../layout/provider/my_provider.dart';
import '../models/DataBaseHelper.dart';
import '../models/Task.dart';
import '../shared/components/constants/widgets/addTaskDialog.dart';

class CategoryName extends StatelessWidget {
  const CategoryName({super.key});

  @override
  Widget build(BuildContext context) {
    var db = DBHelper();
    db.getAllTasks().then((value) {
      Provider.of<MyProvider>(context, listen: false).setTasks(value);
    });
    return Scaffold(
        backgroundColor: const Color(0xffE4E4E4),
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          title: const Text('Category Name',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20.0,
              )),
          iconTheme: const IconThemeData(
            color: Colors.black, // تعيين لون سهم الرجوع هنا
          ),
          actions: [
            GestureDetector(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AddTaskDialog(
                        db: db,
                        screen: const CategoryName(),
                        finalPop: false,
                      );
                    });
              },
              child: Container(
                width: 25,
                height: 25,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.black,
                ),
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(
              width: 17.0,
            )
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
                        bool isComplete = false;
                        if (value.tasks![position].isComplete!) {
                          isComplete = true;
                        } else {
                          isComplete = false;
                        }
                        return Stack(
                          alignment: Alignment.centerRight,
                          children: [
                            Stack(
                              alignment: Alignment.centerLeft,
                              children: [
                                Stack(
                                  alignment: Alignment.centerRight,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      height: 114.5,
                                      child: ListTile(
                                        title: Row(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: SingleChildScrollView(
                                                physics:
                                                    BouncingScrollPhysics(),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    SizedBox(
                                                      width: 200,
                                                      child: Text(
                                                        value.tasks![position]
                                                            .taskName!,
                                                        maxLines: 1,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: const TextStyle(
                                                            fontSize: 16.0,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 3,
                                                    ),
                                                    SizedBox(
                                                      width: 300,
                                                      child: Text(
                                                        value.tasks![position]
                                                            .description!,
                                                        maxLines: null,
                                                        style: const TextStyle(
                                                          fontSize: 14.0,
                                                          color:
                                                              Color(0xffA5A5A5),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      decoration: const BoxDecoration(
                                        color: Color(0xff6A90F2),
                                        borderRadius: BorderRadius.only(
                                          bottomRight: Radius.circular(5),
                                          topRight: Radius.circular(5),
                                        ),
                                      ),
                                      height: 114.5,
                                      width: 4,
                                    ),
                                  ],
                                ),
                                Container(
                                  decoration: const BoxDecoration(
                                    color: Color(0xff6A90F2),
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(5),
                                      topLeft: Radius.circular(5),
                                    ),
                                  ),
                                  height: 114.5,
                                  width: 4,
                                ),
                              ],
                            ),
                            Checkbox(
                              fillColor:
                                  MaterialStateProperty.resolveWith<Color>(
                                (Set<MaterialState> states) {
                                  if (states.contains(MaterialState.selected)) {
                                    // لون الخلفية عند التحديد
                                    return const Color(0xff98CE63);
                                  }
                                  // لون الخلفية قبل التحديد
                                  return const Color(0xffC4C4C5);
                                },
                              ),
                              shape: CircleBorder(),
                              value: isComplete,
                              onChanged: (value1) async {
                                await db.updateTask(
                                  Task(
                                    id: value.tasks![position].id,
                                    taskName: value.tasks![position].taskName,
                                    description:
                                        value.tasks![position].description,
                                    shortDescription:
                                        value.tasks![position].shortDescription,
                                    isComplete: value1,
                                  ),
                                );
                                var updatedTasks = await db.getAllTasks();
                                Provider.of<MyProvider>(context, listen: false)
                                    .setTasks(updatedTasks);
                              },
                            ),
                          ],
                        );
                      },
                    ),
                  )
                : const Center(child: CircularProgressIndicator());
          },
        ));
  }
}
