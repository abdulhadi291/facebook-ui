import 'package:flutter/material.dart';

class PostView extends StatefulWidget {
  const PostView({super.key});

  @override
  State<PostView> createState() => _PostViewState();
}

class _PostViewState extends State<PostView> {
  TextEditingController postContentController = TextEditingController();
  List posts = [];

  List<String> postImages = [
    'https://upload.wikimedia.org/wikipedia/commons/7/70/Neeulm_Valley_AJK_%28Arang_Kel%29.jpg',
    'https://i0.wp.com/stampedmoments.com/wp-content/uploads/2023/08/sonmarg-kashmir-2.jpg?fit=1024%2C576&ssl=1',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR1QOKzEBqT5eyMm2vaCI-UlTi3NsVWLM8v6w&s',
    'https://images.travelandleisureasia.com/wp-content/uploads/sites/3/2024/04/18152123/srinagar-1.jpeg?tr=w-480,f-jpg,pr-true'
  ];

  var imageIndex = 0;

  addPost() {
    posts.add({
      'content': postContentController.text,
      'images': [postImages[imageIndex]]
    });

    imageIndex++;
    if (imageIndex >= postImages.length) {
      imageIndex = 0;
    }

    postContentController.clear();
    setState(() {});
    print(posts);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF1877F2),
        title: Text(
          "Facebook",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 24,
            letterSpacing: -1,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.message_outlined),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          TextField(
            controller: postContentController,
            decoration: InputDecoration(
              hintText: 'Whats on your mind..',
              prefixIcon: Padding(
                padding: const EdgeInsets.all(10.0),
                child: ClipOval(
                  child: Image.network(
                    'https://cdn-icons-png.flaticon.com/512/6858/6858504.png',
                    width: 10,
                    height: 10,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              suffixIcon: IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  addPost();
                },
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
              child: ListView.builder(
            itemCount: posts.length,
            itemBuilder: (context, index) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(
                          'https://cdn-icons-png.flaticon.com/512/6858/6858504.png',
                        ),
                        radius: 20,
                      ),
                      SizedBox(width: 10),
                      Text(
                        "Abdul Hadi",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "${posts[index]['content']}",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 200,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(posts[index]['images'][0]),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextButton.icon(
                        onPressed: () {},
                        icon: Icon(Icons.thumb_up_alt_outlined,
                            color: Colors.grey),
                        label:
                            Text("Like", style: TextStyle(color: Colors.grey)),
                      ),
                      TextButton.icon(
                        onPressed: () {},
                        icon: Icon(Icons.comment_outlined, color: Colors.grey),
                        label: Text("Comment",
                            style: TextStyle(color: Colors.grey)),
                      ),
                      TextButton.icon(
                        onPressed: () {},
                        icon: Icon(Icons.share_outlined, color: Colors.grey),
                        label:
                            Text("Share", style: TextStyle(color: Colors.grey)),
                      ),
                    ],
                  ),
                  Divider(),
                  SizedBox(
                    height: 10,
                  ),
                ],
              );
            },
          ))
        ],
      ),
    );
  }
}
