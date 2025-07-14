import 'package:facebook_ui/widgets/customstory.dart';
import 'package:flutter/material.dart';

class PostView extends StatefulWidget {
  const PostView({super.key});

  @override
  State<PostView> createState() => _PostViewState();
}

class _PostViewState extends State<PostView> {
  TextEditingController postContentController = TextEditingController();
  TextEditingController imageURLController = TextEditingController();

  List posts = [];

  deletepost(index) {
    posts.removeAt(index);
    setState(() {});
  }

  editPost(index, content, images) {
    posts[index] = {
      'content': content,
      'images': [images],
    };

    setState(() {});
  }

  addPost() {
    posts.add({
      'content': postContentController.text,
      'images': [imageURLController.text],
    });

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
          Divider(),
          TextField(
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
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Add Post'),
                        content: Container(
                          width: 400,
                          height: 250,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextField(
                                controller: postContentController,
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                  labelText: 'Content',
                                  hintText: 'Enter the content',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  filled: true,
                                  fillColor: Colors.grey[100],
                                ),
                              ),
                              SizedBox(height: 20),
                              TextField(
                                controller: imageURLController,
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                  labelText: 'URLs',
                                  hintText: 'Enter the URLs',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  filled: true,
                                  fillColor: Colors.grey[100],
                                ),
                              ),
                              SizedBox(height: 20),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  ElevatedButton(
                                    child: Text("Close"),
                                    onPressed: () =>
                                        Navigator.of(context).pop(),
                                  ),
                                  ElevatedButton(
                                      onPressed: () {
                                        addPost();
                                        Navigator.of(context).pop();
                                      },
                                      child: Text('Add'))
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 230,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              child: Row(
                children: [
                  // Create Story box
                  Container(
                    height: 400,
                    width: 115,
                    margin: EdgeInsets.only(right: 8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(13),
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(Icons.add_circle, color: Colors.blue),
                          SizedBox(height: 5),
                          Text("Create Story",
                              style: TextStyle(color: Colors.black)),
                        ],
                      ),
                    ),
                  ),

                  // Repeated Story tiles
                  StoryCustomTile(
                    profileImage:
                        "https://cdn.pixabay.com/photo/2024/11/22/13/20/man-9216455_1280.jpg",
                    storyImage:
                        "https://cdn.pixabay.com/photo/2020/06/28/00/04/chicago-5347435_1280.jpg",
                  ),
                  StoryCustomTile(
                    profileImage:
                        "https://cdn.pixabay.com/photo/2023/08/15/09/21/camera-8191564_1280.jpg",
                    storyImage:
                        "https://cdn.pixabay.com/photo/2016/11/29/04/54/photographer-1867417_1280.jpg",
                  ),
                  StoryCustomTile(
                    profileImage:
                        "https://images.pexels.com/photos/91227/pexels-photo-91227.jpeg",
                    storyImage:
                        "https://cdn.pixabay.com/photo/2015/05/18/23/53/backpacker-772991_1280.jpg",
                  ),
                  StoryCustomTile(
                    profileImage:
                        "https://images.pexels.com/photos/2379004/pexels-photo-2379004.jpeg",
                    storyImage:
                        "https://cdn.pixabay.com/photo/2024/07/13/07/40/cars-8891625_1280.jpg",
                  ),
                  StoryCustomTile(
                    profileImage:
                        "https://cdn.pixabay.com/photo/2017/06/19/17/24/boy-2420289_1280.jpg",
                    storyImage:
                        "https://cdn.pixabay.com/photo/2020/10/14/03/18/man-5653200_1280.jpg",
                  ),
                  StoryCustomTile(
                    profileImage:
                        "https://cdn.pixabay.com/photo/2017/03/27/13/28/man-2178721_1280.jpg",
                    storyImage:
                        "https://cdn.pixabay.com/photo/2020/04/25/20/33/mountain-5092625_1280.jpg",
                  ),
                  StoryCustomTile(
                    profileImage:
                        "https://cdn.pixabay.com/photo/2016/03/27/17/40/road-1283230_1280.jpg",
                    storyImage:
                        "https://cdn.pixabay.com/photo/2016/11/18/19/39/beach-1836597_1280.jpg",
                  ),
                  StoryCustomTile(
                    profileImage:
                        "https://cdn.pixabay.com/photo/2024/11/08/05/28/man-9182458_1280.jpg",
                    storyImage:
                        "https://cdn.pixabay.com/photo/2020/05/29/08/54/beach-5234306_1280.jpg",
                  ),
                  StoryCustomTile(
                    profileImage:
                        "https://cdn.pixabay.com/photo/2023/08/15/09/21/camera-8191564_1280.jpg",
                    storyImage:
                        "https://cdn.pixabay.com/photo/2021/07/09/08/44/football-6398660_1280.jpg",
                  ),
                  StoryCustomTile(
                    profileImage:
                        "https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg",
                    storyImage:
                        "https://cdn.pixabay.com/photo/2014/03/17/22/26/game-289470_1280.jpg",
                  ),
                  StoryCustomTile(
                    profileImage:
                        "https://cdn.pixabay.com/photo/2016/03/27/22/21/boy-1284509_1280.jpg",
                    storyImage:
                        "https://cdn.pixabay.com/photo/2023/10/23/17/03/audi-8336484_1280.jpg",
                  ),
                  StoryCustomTile(
                    profileImage:
                        "https://cdn.pixabay.com/photo/2023/05/03/10/20/man-7967210_1280.jpg",
                    storyImage:
                        "https://cdn.pixabay.com/photo/2016/11/21/15/08/playstation-1845880_1280.jpg",
                  ),
                  //
                ],
              ),
            ),
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
                      SizedBox(width: 160),
                      IconButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text('Edit Post'),
                                  content: Container(
                                    width: 400,
                                    height: 250,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        TextField(
                                          controller: postContentController,
                                          decoration: InputDecoration(
                                            labelText: 'Content',
                                            hintText: 'Enter the content',
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            filled: true,
                                            fillColor: Colors.grey[100],
                                          ),
                                        ),
                                        SizedBox(height: 20),
                                        TextField(
                                          controller: imageURLController,
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          decoration: InputDecoration(
                                            labelText: 'URLs',
                                            hintText: 'Enter the URLs',
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            filled: true,
                                            fillColor: Colors.grey[100],
                                          ),
                                        ),
                                        SizedBox(height: 20),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            ElevatedButton(
                                              child: Text("Close"),
                                              onPressed: () =>
                                                  Navigator.of(context).pop(),
                                            ),
                                            ElevatedButton(
                                                onPressed: () {
                                                  editPost(
                                                      index,
                                                      postContentController
                                                          .text,
                                                      imageURLController.text);
                                                  Navigator.of(context).pop();
                                                },
                                                child: Text('Edit'))
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                          icon: Icon(Icons.edit)),
                      IconButton(
                          onPressed: () {
                            deletepost(index);
                          },
                          icon: Icon(Icons.delete)),
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
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        onTap: (index) {
          setState(() {});
        },
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Friends',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.ondemand_video_outlined),
            label: 'Video',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: 'Menu',
          ),
        ],
      ),
    );
  }
}
