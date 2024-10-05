import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscurePassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _login() {
    if (_emailController.text.isEmpty || _passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please fill in all fields")),
      );
      return;
    }
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SecondScreen()),
    );

    _emailController.clear();
    _passwordController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFFDDE5F2),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 50),
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  color: const Color(0xFFF414688),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.ac_unit, color: Colors.white, size: 60),
              ),
              const SizedBox(height: 20),
              const SizedBox(height: 50),
              Container(
                width: 350,
                height: 100,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        const SizedBox(width: 20),
                        const Text(
                          "Email Address",
                          style: TextStyle(color: Colors.grey, fontSize: 15),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const SizedBox(width: 20),
                        const Icon(Icons.mail, size: 25),
                        const SizedBox(width: 20),
                        Expanded(
                          child: TextField(
                            controller: _emailController,
                            decoration: const InputDecoration(
                              hintText: "Enter your email",
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  color: Colors.white60,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              const SizedBox(height: 20),
              // Password TextField
              Container(
                width: 350,
                height: 100,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 15),
                    Row(
                      children: [
                        const SizedBox(width: 20),
                        const Text(
                          "Password",
                          style: TextStyle(color: Colors.grey, fontSize: 15),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const SizedBox(width: 20),
                        const Icon(Icons.lock, size: 25),
                        const SizedBox(width: 20),
                        Expanded(
                          child: TextField(
                            controller: _passwordController,
                            obscureText: _obscurePassword,
                            decoration: InputDecoration(
                              hintText: "..................",
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        IconButton(
                          icon: Icon(
                            _obscurePassword
                                ? Icons.visibility
                                : Icons.visibility_off,
                            size: 25,
                            color: Colors.grey,
                          ),
                          onPressed: () {
                            setState(() {
                              _obscurePassword = !_obscurePassword; // Toggle visibility
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  color: Colors.white60,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              const SizedBox(height: 20),
              // Login Button
              Container(
                width: 350,
                height: 60,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFF414688),
                  ),
                  onPressed: _login,
                  child: const Center(
                    child: Text(
                      "Login",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // Footer Row
              Row(
                children: [
                  const SizedBox(width: 35),
                  const Text(
                    "Signup",
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const Spacer(),
                  const Text(
                    "Forget Password",
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(width: 20),
                ],
              ),
            ],
          ),
        ),
      ),
      backgroundColor: const Color(0xFFFDDE5F2),
    );
  }
}

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  int _selectedIndex = 0; // Track the selected index

  final List<Widget> _screens = [
    const CategoryScreen(title: "Home"), const CategoryScreen(title: "cart"),
    const CategoryScreen(title: "add"), const CategoryScreen(title: "money"),
    const CategoryScreen(title: "Profile"),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Update the selected index
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        backgroundColor: const Color(0xFFFDDE5F2),
      ),
      body: _screens[_selectedIndex], // Display the selected screen
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[BottomNavigationBarItem(
          icon: Container(
            color: _selectedIndex == 0 ? Colors.deepPurpleAccent : Colors.transparent,
            child: Icon(
              Icons.home,
              color: _selectedIndex == 0 ? Colors.white : Colors.grey,
            ),
          ),
          label: '',
        ),
          BottomNavigationBarItem(
            icon: Container(
              color: _selectedIndex == 1 ? Colors.deepPurpleAccent : Colors.transparent,
              child: Icon(
                Icons.credit_card,
                color: _selectedIndex == 1 ? Colors.white : Colors.grey,
              ),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Container(
              color: _selectedIndex == 2 ? Colors.deepPurpleAccent : Colors.transparent,
              child: Icon(
                Icons.add,
                color: _selectedIndex == 2 ? Colors.white : Colors.grey,
              ),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Container(
              color: _selectedIndex == 3 ? Colors.deepPurpleAccent : Colors.transparent,
              child: Icon(
                Icons.person,
                color: _selectedIndex == 3 ? Colors.white : Colors.grey,
              ),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Container(
              color: _selectedIndex == 4 ? Colors.deepPurpleAccent : Colors.transparent,
              child: Icon(
                Icons.settings,
                color: _selectedIndex == 4 ? Colors.white : Colors.grey,
              ),
            ),
            label: '',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color(0xFFF414688),
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}

class CategoryScreen extends StatelessWidget {
  final String title;

  const CategoryScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: (() {
        if (title == "add") {
          return _buildAddContent();
        } else if (title == "cart") {
          return _buildpayment();
        } else {
          return _buildTitleContent();
        }
      })(),
    );
  }

  Widget _buildAddContent() {
    // Customize this widget for the "add" category
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Container(
              width:350,height: 350,
              child: Column(
                children: [
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      SizedBox(width: 10),
                      Icon(Icons.list),
                      SizedBox(width: 280,),
                      Icon(Icons.settings),
                    ],
                  ),
                  SizedBox(height: 30,),
                  Container(
                    width: 120,
                    height: 120,
                    child: 
                    ClipRRect(
                        borderRadius:BorderRadius.circular(100),
                        child:
                    Image.asset('images/photo_٢٠٢٣-٠٥-١٣_٠٤-٠٢-٠٠.jpg')
                    ),
                    decoration: BoxDecoration( 
                      shape: BoxShape.circle,
                    ),
                  ), SizedBox(height: 5,),
                  Text("ALiBesar",style: TextStyle(color: Colors.deepPurpleAccent,fontSize: 20,fontWeight:FontWeight.bold),),
                  Text("Ux/Ui Desinger",style: TextStyle(color: Colors.black,fontSize: 15),)
                ,
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                   children: [
                     Column(
                       children: [

                         Text("£8900",style: TextStyle(
                             fontSize: 20,color: Colors.deepPurpleAccent
                         ),),
                         SizedBox(height: 10,),
                         Text("Home")
                       ],
                     ),
                     Container(
                       width: 1,
                       height: 50,
                       decoration: BoxDecoration(
                         color: Colors.black87,
                       ),
                     ),
                     Column(
                       children: [

                         Text("£5500",style: TextStyle(
                         fontSize: 20,color: Colors.deepPurpleAccent
                     ),),
                         SizedBox(height: 10,),
                         Text("Expenex")
                       ],
                     ),
                     Container(
                       width: 1,
                       height: 50,
                       decoration: BoxDecoration(
                         color: Colors.black87,
                       ),
                     ),
                     Column(
                       children: [
                         Text("£890",style: TextStyle(
                           fontSize: 20,color: Colors.deepPurpleAccent
                         ),),
                         SizedBox(height: 10,),
                         Text("Leon")
                       ],
                     )
                   ],
                 )
                ],
              ),
              decoration: BoxDecoration(
                color:   Colors.white70,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            SizedBox(height: 10,),
            Row(
              children: [
                SizedBox(width: 50,),
                Text("Overveiw",style: TextStyle(
                    color: Color(0xFFF414688),fontSize: 25,fontWeight: FontWeight.w900
                ),),
                SizedBox(width: 10,),
                Icon(Icons.notifications_outlined,color: Colors.black,),
                SizedBox(width: 90,),
                Text("sep 13,2020",style: TextStyle(
                    color: Color(0xFFF414688)
                ),)
              ],
            ),
            SizedBox(height: 10,),
            Container(
              width: 370,
              height: 90,
              decoration: BoxDecoration(
                color: Colors.white70,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  SizedBox(height: 10,),
                  ListTile(
                    trailing: Text("£150",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                    title: Text("Sent",style: TextStyle(fontWeight: FontWeight.bold),),
                    subtitle: Text("Sending payment to client"),
                    leading: Icon(Icons.call_received_rounded,size: 52,),

                    selectedColor: Colors.white70,

                  ),
                ],
              )
            ),
            SizedBox(height: 10,),
            Container(
                width: 370,
                height: 90,
                decoration: BoxDecoration(
                  color: Colors.white70,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    SizedBox(height: 10,),
                    ListTile(
                      trailing: Text("£250",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                      title: Text("Receive",style: TextStyle(fontWeight: FontWeight.bold)),
                      subtitle: Text("Receive Salary from company"),
                      leading: Icon(Icons.call_made,size: 52,),

                      selectedColor: Colors.white70,

                    ),
                  ],
                )
            ),
            SizedBox(height: 10,),
            Container(
                width: 370,
                height: 90,
                decoration: BoxDecoration(
                  color: Colors.white70,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    SizedBox(height: 10,),
                    ListTile(
                      trailing: Text("£400",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                      title: Text("Loan",style: TextStyle(fontWeight: FontWeight.bold)),
                      subtitle: Text("Loan for the Car"),
                      leading: Icon(Icons.monetization_on,size: 52,),

                      selectedColor: Colors.white70,

                    ),
                  ],
                )
            )
          ],
        ),
      ),
        backgroundColor: const Color(0xFFFDDE5F2),
    );
  }

  Widget _buildTitleContent() {
    return Text(
      title,
      style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
    );
  }

  Widget _buildpayment() {
    return  Scaffold(
       
      body: Center(
        child: Column(

           children: [
             SizedBox(height: 5,),
             Row(
               children: [
                 SizedBox(width: 20,),
                 Align( alignment: Alignment.topLeft,
                   child: Text("Recent Transaction",style: TextStyle(
                       color: Color(0xFFF414688),fontSize: 25,fontWeight: FontWeight.bold
                   ),),
                 ),
                 SizedBox(width: 100,),
                 Text("See all")
               ],
             )
             ,SizedBox(height: 10,),
             Row(
               children: [
                 SizedBox(width: 20,),
                 Container(
                   width: 70,height: 30,
                   child:
                   Center(child: Text("All",style: TextStyle(color:Colors.white),)),
                   decoration: BoxDecoration(
                       color: Colors.deepPurple,
                     borderRadius: BorderRadius.circular(20)
                   ),
                 ),
                 SizedBox(width: 30,),
                 Container(   width: 70,height: 30,
                   child:
                   Center(child:Text("Income",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold))),
                   decoration: BoxDecoration(
                       color: Colors.white70,
                       borderRadius: BorderRadius.circular(20)
                   ),
                 ),SizedBox(width: 30,),
                 Container(   width: 70,height: 30,
                   child:
                   Center(child:Text("Exponse",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold),)),
                   decoration: BoxDecoration(
                       color: Colors.white70,
                       borderRadius: BorderRadius.circular(20)
                   ),
                 ),
               ],
             )
            ,SizedBox(height: 10,),
            Row(
             children: [
               SizedBox(width: 25,),
               Align(
                 alignment: Alignment.topLeft,
                 child: Text("Today",style: TextStyle(
                     color: Color(0xFFF414688),fontSize: 25,fontWeight: FontWeight.w500
                 ),),
               ),

             ]
            ),
             SizedBox(height: 20,),
             Container(
                 width: 370,
                 height: 100,
                 decoration: BoxDecoration(
                   color: Colors.white70,
                   borderRadius: BorderRadius.circular(20),
                 ),
                 child: Column(
                   children: [
                     SizedBox(height: 10,),
                     ListTile(
                       trailing: Text("£30.00",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                       title: Text("Payment",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25)),
                       subtitle: Text("payment from Andres"),
                       leading: Icon(Icons.mail_outlined,size: 52,),

                       selectedColor: Colors.white70,

                     ),

                   ],
                 )
             ),SizedBox(height: 30,),
             //////////////



             Container(
               width: 400,
               height: 350,
             child: Center(
               child: Stack(
                 children: [
                   Center(
                     child: Container(
                       width: 300,
                       height: 300,
                       decoration: BoxDecoration(
                         shape: BoxShape.circle,
                         color: Color(0xFFFDDE5F2),
                         border: Border(
                           top: BorderSide(color: Colors.black12,width: 2),
                             right: BorderSide(color: Colors.black12,width: 2),
                             bottom: BorderSide(color: Colors.black12,width: 2),
                             left: BorderSide(color: Colors.black12,width: 2)
                         )
                       ),
                     ),
                   ),
                   Center(
                     child: Container(
                       width: 220,
                       height: 220,
                       decoration: BoxDecoration(
                           color: Colors.blueGrey.shade200,
                         shape: BoxShape.circle
                       ),
                     ),
                   ),
                   Center(
                     child: Container(
                       width: 180,
                       height: 180,
                       decoration: BoxDecoration(
                           color: Colors.white ,
                           shape: BoxShape.circle
                       ),
                     ),
                   ),
                   Center(
                     child: Container(
                       width: 150,
                       height: 150,
                       decoration: BoxDecoration(
                           color: Color(0xFFF484E6B),
                           shape: BoxShape.circle
                       ),
                     ),

                   ),
                   Center(
                     child: Container(
                       width: 135,
                       height: 135,
                       decoration: BoxDecoration(
                           color: Colors.white,
                           shape: BoxShape.circle
                       ),
                     ),

                   ),Center(
                     child: Container(
                       width: 110,
                       height: 110,
                       child:
                       ClipRRect(
                           borderRadius:BorderRadius.circular(200),
                           child:
                           Image.asset('images/photo_٢٠٢٣-٠٥-١٣_٠٤-٠٢-٠٠.jpg')
                       ),
                       decoration: BoxDecoration(
                           color: Color(0xFFFF6C5CD),
                           shape: BoxShape.circle
                       ),
                     ),

                   ),
                   Padding(
                     padding: const EdgeInsets.only(left: 150),
                     child: Container(
                       width: 90,
                       height: 90,
                       child:
                       ClipRRect(
                           borderRadius:BorderRadius.circular(200),
                           child:
                           Image.asset('images/photo_٢٠٢٣-٠٥-١٣_٠٤-٠٢-٠٠.jpg')
                       ),
                       decoration: BoxDecoration(
                           color: Color(0xFFFF6C5CD),
                           shape: BoxShape.circle
                       ),
                     ),
                   ),
                   Padding(
                     padding: const EdgeInsets.only(top: 110),
                     child: Container(
                       width: 90,
                       height: 90,
                       child:
                       ClipRRect(
                           borderRadius:BorderRadius.circular(200),
                           child:
                           Image.asset('images/photo_٢٠٢٣-٠٥-١٣_٠٤-٠٢-٠٠.jpg')
                       ),
                       decoration: BoxDecoration(
                           color: Color(0xFFFF6C5CD),
                           shape: BoxShape.circle
                       ),
                     ),
                   ),
                   Padding(
                     padding: const EdgeInsets.only(top: 250,left: 60),
                     child: Container(
                       width: 90,
                       height: 90,
                       child:
                       ClipRRect(
                           borderRadius:BorderRadius.circular(200),
                           child:
                           Image.asset('images/photo_٢٠٢٣-٠٥-١٣_٠٤-٠٢-٠٠.jpg')
                       ),
                       decoration: BoxDecoration(
                           color: Color(0xFFFF6C5CD),
                           shape: BoxShape.circle
                       ),
                     ),
                   ),
                   Padding(
                     padding: const EdgeInsets.only(top: 250,left: 250),
                     child: Container(
                       width: 90,
                       height: 90,
                       child:
                       ClipRRect(
                           borderRadius:BorderRadius.circular(200),
                           child:
                           Image.asset('images/photo_٢٠٢٣-٠٥-١٣_٠٤-٠٢-٠٠.jpg')
                       ),
                       decoration: BoxDecoration(
                           color: Color(0xFFFF6C5CD),
                           shape: BoxShape.circle
                       ),
                     ),
                   ),
                   Padding(
                     padding: const EdgeInsets.only(top: 110,left: 300),
                     child: Container(
                       width: 90,
                       height: 90,
                       child:
                       ClipRRect(
                           borderRadius:BorderRadius.circular(200),
                           child:
                           Image.asset('images/photo_٢٠٢٣-٠٥-١٣_٠٤-٠٢-٠٠.jpg')
                       ),
                       decoration: BoxDecoration(
                           color: Color(0xFFFF6C5CD),
                           shape: BoxShape.circle
                       ),
                     ),
                   ),

                 ],

               ),
             ),
             color: Color(0xFFFDDE5F2)

             ),







             //////////////////
             SizedBox(height: 20,),Container(

               width: 350,
               height: 70,
               child: ElevatedButton(
                 style: ElevatedButton.styleFrom(
                   backgroundColor: const Color(0xFFF414688),
                 ),
                 onPressed:(){},
                 child: const Center(
                   child: Text(
                     "See Detalils",
                     style: TextStyle(color: Colors.white,fontSize: 20),
                   ),
                 ),
               ),
             ),
          ],
        ),
      ),
      backgroundColor: const Color(0xFFFDDE5F2),
    );
  }
}
