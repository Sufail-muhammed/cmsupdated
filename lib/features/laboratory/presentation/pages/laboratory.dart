import 'package:cms_app/features/dental/presentation/pages/dental_test_add.dart';
import 'package:flutter/material.dart';
import 'package:cms_app/common/widgets/tablets_table.dart';
import 'package:cms_app/common/sized_box/sized_box.dart';

class Laboratory extends StatefulWidget {
  const Laboratory({super.key});

  @override
  _LaboratoryState createState() => _LaboratoryState();
}

class _LaboratoryState extends State<Laboratory> with SingleTickerProviderStateMixin {
  bool _isFabVisible = false;
  bool _isTableVisible = false;
  bool _isTableVisible2  = false;

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this); // `this` now refers to a TickerProvider
  }

  void _toggleFab() {
    setState(() {
      _isFabVisible = !_isFabVisible;
    });
  }

  void _toggleTableVisibility() {
    setState(() {
      _isTableVisible = !_isTableVisible;
    });
  }
  void _toggleTableVisibility2() {
    setState(() {
      _isTableVisible2 = !_isTableVisible2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff01BFE1),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      SizedBoxes.normalSizedBox,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            style: ButtonStyle(
                              minimumSize: WidgetStateProperty.all(const Size(10, 10)),
                              backgroundColor: WidgetStateProperty.all(const Color(0xffF1FDFF)),
                            ),
                            onPressed: () {},
                            icon: const Icon(
                              Icons.arrow_back_ios,
                              color: Color(0xff0867A6),
                              size: 16,
                            ),
                            constraints: const BoxConstraints(
                              maxHeight: 30,
                              maxWidth: 30,
                            ),
                            padding: EdgeInsets.zero,
                          ),
                          const Text(
                            "Prescription",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.white
                            ),
                          ),
                          const SizedBox(),
                        ],
                      ),
                      SizedBoxes.normalSizedBox,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              Container(
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Colors.white,
                                    width: 4.0,
                                  ),
                                ),
                              ),
                              const CircleAvatar(
                                backgroundImage: AssetImage("assets/doctordp.jpg"),
                                radius: 27,
                              ),
                            ],
                          ),
                          SizedBoxes.smallSizedBox,
                          const Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Muhammed Janees",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Male |  39 years old |  +98 76 54 32 10",
                                style:
                                TextStyle(color: Colors.white, fontSize: 10),
                              ),
                              Text(
                                "View Details",
                                style: TextStyle(fontSize: 9),
                              )
                            ],
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Image(
                            image: AssetImage("assets/whatsapp.png"),
                            width: 30,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBoxes.normalSizedBox,
                Container(
                  width: double.infinity,
                  height: 1000,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)
                      )
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        SizedBoxes.smallSizedBox,
                        TabBar(
                          controller: _tabController,
                          indicatorColor: Colors.transparent,
                          labelColor: const Color(0xff0867A6),
                          unselectedLabelColor: const Color(0xff9BCCD5),
                          tabs: const [
                            Tab(text: "Payment"),
                            Tab(text: "Attachment"),
                            Tab(text: "Laboratory"),
                          ],
                        ),
                        SizedBoxes.smallSizedBox,

                        Expanded(
                          child: TabBarView(
                            controller: _tabController,
                            children: [
                              _buildPaymentView(),
                              _buildAttachmentView(),
                              _buildLaboratoryView(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Stack(
            children: [
              if (_isFabVisible)
                Positioned(
                  bottom: 80,
                  left: MediaQuery.of(context).size.width / 2 - 75,
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: const Color(0xff01BFE1),
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.white12,
                              blurRadius: 10,
                              offset: Offset(10, 10),
                            ),
                          ],
                        ),
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.sticky_note_2_outlined, color: Colors.white),
                            SizedBox(width: 8),
                            Text("Pathology Test",style: TextStyle(color: Colors.white),),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: const Color(0xff01BFE1),
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 8,
                              offset: Offset(0, 5),
                            ),
                          ],
                        ),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const DentalTestAdd(),));
                          },
                          child: const Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.sticky_note_2_outlined, color: Colors.white),
                              SizedBox(width: 8),
                              Text("Dental Test",style: TextStyle(color: Colors.white),),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              Positioned(
                bottom: 15,
                left: MediaQuery.of(context).size.width / 2 - 28,
                child: FloatingActionButton(
                  onPressed: _toggleFab,
                  backgroundColor: const Color(0xff01BFE1),
                  shape: const CircleBorder(),
                  child: Icon(_isFabVisible ? Icons.close : Icons.add, color: Colors.white,),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildChip(String label) {
    return Chip(
      label: Text(
        label,
        style: const TextStyle(color: Color(0xff01BFE1), fontSize: 9),
      ),
      backgroundColor: const Color(0xffF1FDFF),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: const BorderSide(color: Colors.transparent)
      ),
    );
  }

  Widget _buildPaymentView() {
    return Column(
      children: [
        SizedBoxes.smallSizedBox,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RichText(
              textAlign: TextAlign.center,
              text: const TextSpan(
                style: TextStyle(fontWeight: FontWeight.bold),
                children: [
                  TextSpan(
                    text: 'Dr.',
                    style: TextStyle(color: Colors.blue),
                  ),
                  TextSpan(
                    text: 'Muhammed Iqbal',
                  ),
                ],
              ),
            ),
            Container(
              width: 100,
              height: 25,
              color: const Color(0xff01BFE1),
              child: const Center(child: Text("21- Apr - 2024", style: TextStyle(color: Colors.white))),
            ),
          ],
        ),
        SizedBoxes.normalSizedBox,
        Align(
          alignment: Alignment.centerLeft,
          child: Wrap(
            spacing: 8.0,
            runSpacing: 4.0,
            children: <Widget>[
              _buildChip('CBC'),
              _buildChip('Vitamins'),
              _buildChip('Cholesterol'),
              _buildChip('Renal Function'),
              _buildChip('Thyroid & Parathyroid'),
              _buildChip('Liver & Gastrointestinal'),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Text(
              '₹3000',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(0xff0867A6),
              ),
            ),
            IconButton(
              color: Colors.transparent,
              icon: Icon(
                _isTableVisible ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                color: const Color(0xff0867A6),
              ),
              onPressed: _toggleTableVisibility,
            ),
          ],
        ),
        if (_isTableVisible) CustomDataTable(),

        SizedBoxes.smallSizedBox,
        const Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RichText(
              textAlign: TextAlign.center,
              text: const TextSpan(
                style: TextStyle(fontWeight: FontWeight.bold),
                children: [
                  TextSpan(
                    text: 'Dr.',
                    style: TextStyle(color: Colors.blue),
                  ),
                  TextSpan(
                    text: 'Ram Chathran ',
                  ),
                ],
              ),
            ),
            Container(
              width: 100,
              height: 25,
              color: const Color(0xff01BFE1),
              child: const Center(child: Text("21- Apr - 2024", style: TextStyle(color: Colors.white))),
            ),
          ],
        ),
        SizedBoxes.normalSizedBox,
        Align(
          alignment: Alignment.centerLeft,
          child: Wrap(
            spacing: 8.0,
            runSpacing: 4.0,
            children: <Widget>[
              _buildChip('CBC'),
              _buildChip('Vitamins'),
              _buildChip('Cholesterol'),
              _buildChip('Renal Function'),
              _buildChip('Thyroid & Parathyroid'),
              _buildChip('Liver & Gastrointestinal'),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Text(
              '₹6000',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(0xff0867A6),
              ),
            ),
            IconButton(
              color: Colors.transparent,
              icon: Icon(
                _isTableVisible2 ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                color: const Color(0xff0867A6),
              ),
              onPressed: _toggleTableVisibility2,
            ),
          ],
        ),
        if (_isTableVisible2) CustomDataTable(),
        const Divider(),
      ],
    );
  }


  Widget _buildAttachmentView() {
    return Column(
      children: [
        // Existing content for the Attachment section
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RichText(
              textAlign: TextAlign.center,
              text: const TextSpan(
                style: TextStyle(fontWeight: FontWeight.bold),
                children: [
                  TextSpan(
                    text: 'Dr.',
                    style: TextStyle(color: Colors.blue),
                  ),
                  TextSpan(
                    text: 'Muhammed Iqbal',
                  ),
                ],
              ),
            ),
            Container(
              width: 100,
              height: 25,
              color: const Color(0xff01BFE1),
              child: const Center(child: Text("21- Apr - 2024", style: TextStyle(color: Colors.white))),
            ),
          ],
        ),
        SizedBoxes.normalSizedBox,
        Align(
          alignment: Alignment.centerLeft,
          child: Wrap(
            spacing: 8.0,
            runSpacing: 4.0,
            children: <Widget>[
              _buildChip('X-ray'),
              _buildChip('MRI'),
              _buildChip('CT Scan'),
              _buildChip('Blood Test'),
              _buildChip('Urine Test'),
            ],
          ),
        ),
        const Divider(),
      ],
    );
  }

  Widget _buildLaboratoryView() {
    return Column(
      children: [
        // Existing content for the Laboratory section
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RichText(
              textAlign: TextAlign.center,
              text: const TextSpan(
                style: TextStyle(fontWeight: FontWeight.bold),
                children: [
                  TextSpan(
                    text: 'Dr.',
                    style: TextStyle(color: Colors.blue),
                  ),
                  TextSpan(
                    text: 'Muhammed Iqbal',
                  ),
                ],
              ),
            ),
            Container(
              width: 100,
              height: 25,
              color: const Color(0xff01BFE1),
              child: const Center(child: Text("21- Apr - 2024", style: TextStyle(color: Colors.white))),
            ),
          ],
        ),
        SizedBoxes.normalSizedBox,
        Align(
          alignment: Alignment.centerLeft,
          child: Wrap(
            spacing: 8.0,
            runSpacing: 4.0,
            children: <Widget>[
              _buildChip('CBC'),
              _buildChip('Urinalysis'),
              _buildChip('Blood Sugar'),
              _buildChip('Liver Function Test'),
              _buildChip('Kidney Function Test'),
              _buildChip('Lipid Profile'),
            ],
          ),
        ),
        const Divider(),
      ],
    );
  }
}
