import 'package:flutter/material.dart';

class PostView extends StatefulWidget {
  const PostView({super.key});

  @override
  State<PostView> createState() => _PostViewState();
}

class _PostViewState extends State<PostView> {
  TextEditingController postContentController = TextEditingController();
  List posts = [];

  addPost() {
    posts.add({
      'content': postContentController.text,
      'images': [
        'https://cdn.pixabay.com/photo/2016/03/11/02/08/speedometer-1249610_1280.jpg',
        'https://cdn.pixabay.com/photo/2016/03/11/02/08/speedometer-1249610_1280.jpg',
        'https://cdn.pixabay.com/photo/2016/03/11/02/08/speedometer-1249610_1280.jpg',
        'https://cdn.pixabay.com/photo/2016/03/11/02/08/speedometer-1249610_1280.jpg',
        'https://cdn.pixabay.com/photo/2016/03/11/02/08/speedometer-1249610_1280.jpg',
        'https://cdn.pixabay.com/photo/2016/03/11/02/08/speedometer-1249610_1280.jpg',
        'https://cdn.pixabay.com/photo/2016/03/11/02/08/speedometer-1249610_1280.jpg',
        'https://cdn.pixabay.com/photo/2016/03/11/02/08/speedometer-1249610_1280.jpg',
      ]
    });
    postContentController.clear();
    setState(() {});
    print(posts);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Post Screen"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          TextField(
            controller: postContentController,
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {
              addPost();
            },
            child: Text("Add item"),
          ),
          Expanded(
              child: ListView.builder(
            itemCount: posts.length,
            itemBuilder: (context, index) {
              return Container(
                child: Column(
                  children: [
                    Text(
                      "${posts[index]['content']}",
                    ),
                    Image.network(
                      posts[index]['images'][0],
                    ),
                    Container(
                      height: 100,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(posts[index]['images'][0]),
                        ),
                      ),
                    )
                  ],
                ),
              );
            },
          ))
        ],
      ),
    );
  }
}
