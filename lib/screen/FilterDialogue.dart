// import 'package:flutter/material.dart';

// // const brands = [
// //   'Samsung',
// //   'Apple',
// //   'Xiaomi'
// // ];
// const brands = [
// 'Aisha manzil',
// 'Ancholi',
// 'Buffer zone',
// 'Defence',
// 'Clifton', 
// 'Gulistan-e-jauhar',
// 'Gulshan-e-iqbal',
// 'Lalukhaith',
// 'Landi',
// 'Malir',
// 'Model colony',
// 'Malir cantt',
// 'Karimbaad',
// 'Nazimabad', 
// 'Neepa',
// 'North Karachi', 
// 'Quaidabad', 
// 'Sadarr',
// 'Shah re Faisal town',
// 'Surabhgoth',
// 'Water pump',
// ];
// // const colors = [
// //   'red',
// //   'yellow',
// //   'black',
// //   'blue',
// //   'white'
// // ];

// // const prices = [
// //   'Less or equal than 100',
// //   'Less or equal than 500',
// //   'Less or equal than 1000'
// // ];

// class FilterDialog extends StatefulWidget {
//   // final void Function(Map<String, List<String>?>) onApplyFilters;
//   // final Map<String, List<String>?> initialState;

//   const FilterDialog({
//     Key? key,
//     // required this.onApplyFilters,
//     // this.initialState = const {},
//   }) : super(key: key);

//   @override
//   State<FilterDialog> createState() => _FilterDialogState();
// }

// class _FilterDialogState extends State<FilterDialog> {
//   Map<String, List<String>?> filters = {};

//   @override
//   void initState() {
//     super.initState();
//     // filters = widget.initialState;
//   }

//   void _handleCheckFilter(bool checked, String key, String value) {
//     final currentFilters = filters[key] ?? [];
//     if(checked) {
//       currentFilters.add(value);
//     } else {
//       currentFilters.remove(value);
//     }
//     setState(() {
//       filters[key] = currentFilters;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SimpleDialog(
//       title: const Text('Filters',textAlign: TextAlign.center,),
//       contentPadding: const EdgeInsets.all(16),
//       children: [
//         Column(
//           mainAxisSize: MainAxisSize.min,
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             const Text('Select An Area'),
//             ...brands.map((el) =>
//                 CustomCheckboxTile(
//                   value: filters['brand']?.contains(el) ?? false,
//                   label: el,
//                   onChange: (check) => _handleCheckFilter(check, 'brand', el),
//                 ),
//             ).toList(),
//             // const Text('Select a price'),
//             // ...prices.map((el) =>
//             //     CustomCheckboxTile(
//             //       value: filters['price']?.contains(el) ?? false,
//             //       label: el,
//             //       onChange: (check) => _handleCheckFilter(check, 'price', el),
//             //     )
//             // ).toList(),
//             // const Text('Select a colors'),
//             // ...colors.map((el) =>
//             //     CustomCheckboxTile(
//             //       value: filters['color']?.contains(el) ?? false,
//             //       label: el,
//             //       onChange: (check) => _handleCheckFilter(check, 'color', el),
//             //     ),
//             // ).toList(),
//             const SizedBox(height: 24,),
//             ElevatedButton(
//               onPressed: () {
//                 // widget.onApplyFilters(filters);
//                 Navigator.of(context).pop();
//               },
//               child: const Text('APPLY'),
//             ),
//           ],
//         ),
//       ],
//     );
//   }
// }


// class CustomCheckboxTile extends StatelessWidget {
//   final String label;
//   final bool value;
//   final void Function(bool)? onChange;

//   const CustomCheckboxTile({
//     Key? key,
//     required this.label,
//     required this.value,
//     this.onChange,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         Checkbox(
//           visualDensity: VisualDensity.compact,
//           value: value,
//           onChanged: (_) {
//             if(onChange != null) {
//               onChange!(!value);
//             }
//           },
//         ),
//         Text(label),
//       ],
//     );
//   }
// }




import 'package:flutter/material.dart';
const brands = [
'Aisha manzil',
'Ancholi',
'Buffer zone',
'Defence',
'Clifton', 
'Gulistan-e-jauhar',
'Gulshan-e-iqbal',
'Lalukhaith',
'Landi',
'Malir',
'Model colony',
'Malir cantt',
'Karimbaad',
'Nazimabad', 
'Neepa',
'North Karachi', 
'Quaidabad', 
'Sadarr',
'Shah re Faisal town',
'Surabhgoth',
'Water pump',
];
 class FilterDialog extends StatefulWidget {
  // final void Function(Map<String, List<String>?>) onApplyFilters;

  // final Map<String, List<String>?> initialState;

  const FilterDialog({
    Key? key,
    // required this.onApplyFilters,
    // this.initialState = const {},
  }) : super(key: key);

  @override
  State<FilterDialog> createState() => _FilterDialogState();
}

class _FilterDialogState extends State<FilterDialog> {
  // Temporary storage of filters.
  Map<String, List<String>?> filters = {};
  bool needRefresh = false;

  // Variable for the ability to hide all elements of filtering by any parameter.
  // bool isClickedCountry = false;
  // bool isClickedCity = false;
  bool isClickedArea = false;

  List countryUser = [];
  List cityUser = [];

  @override
  void initState() {
    super.initState();
    // filters = widget.initialState;
  }

  // A function to be able to select an element to filter.
  void _handleCheckFilter(bool checked, String key, String value) {
    final currentFilters = filters[key] ?? [];
    if (checked) {
      currentFilters.add(value);
    } else {
      currentFilters.remove(value);
    }
    setState(() {
      filters[key] = currentFilters;
    });
  }

  // Building a dialog box with filters.
  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
        title: const Text('Filters',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 25,
              fontFamily: 'SuisseIntl',
              fontWeight: FontWeight.w600,
            )),
        contentPadding: const EdgeInsets.all(16),

        // Defining parameters for filtering.
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
            // const Text('Select An Area'),
            // ...brands.map((el) =>
            //     CustomCheckboxTile(
            //       value: filters['brand']?.contains(el) ?? false,
            //       label: el,
            //       onChange: (check) => _handleCheckFilter(check, 'brand', el),
            //     ),
            // ).toList(),
                InkWell(
                    onTap: () async {
                      // countryUser = await getUserCountryOptions();
                      countryUser = await brands;
                      setState(() {
                        isClickedArea = !isClickedArea;
                      });
                    },
                    child: Row(children: [
                      Text('Select An Area '.toString(),
                          style: const TextStyle(
                            fontSize: 18,
                          )),
                      SizedBox(
                        width: 80,
                      ),
                      isClickedArea
                          ? const Icon(Icons.arrow_circle_up)
                          : const Icon(Icons.arrow_circle_down)
                    ])),
                !isClickedArea
                    ? Container()
                    : Column(
                        children: countryUser
                            .map(
                              (el) => CustomCheckboxTile(
                                value: filters['brand']?.contains(el) ??
                                    false,
                                label: el,
                                onChange: (check) => _handleCheckFilter(
                                    check, 'brand', el),
                              ),
                            )
                            .toList()),
              ]),

              // Column(children: [
              //   InkWell(
              //       onTap: () async {
              //         cityUser = await getUserCityOptions();
              //         setState(() {
              //           isClickedCity = !isClickedCity;
              //         });
              //       },
              //       child: Row(children: [
              //         Text('Select a city'.toString(),
              //             style: const TextStyle(
              //               fontSize: 18,
              //             )),
              //         const SizedBox(
              //           width: 120,
              //         ),
              //         isClickedCity
              //             ? const Icon(Icons.arrow_circle_up)
              //             : const Icon(Icons.arrow_circle_down)
              //       ])),
              //   !isClickedCity
              //       ? Container()
              //       : Column(
              //           children: cityUser
              //               .map((el) => CustomCheckboxTile(
              //                     value: filters['cityUser']?.contains(el) ??
              //                         false,
              //                     label: el,
              //                     onChange: (check) =>
              //                         _handleCheckFilter(check, 'cityUser', el),
              //                   ))
              //               .toList())
              // ]),

              // Building a button to apply parameters.
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    // widget.onApplyFilters(filters);
                    needRefresh = true;
                  },
                  child: const Text('APPLY',
                      style: TextStyle(color: Colors.black)),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blue),
                  )),

              // Building a button to reset parameters.
              const SizedBox(
                height: 5,
              ), 
              ElevatedButton(
                  onPressed: () async {
                    setState(() {
                      filters.clear();
                    });
                    // widget.onApplyFilters(filters);
                  },
                  child: const Text('RESET FILTERS',
                      style: TextStyle(color: Colors.black)),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blue),
                  )),
            ],
          )
        ]);
  }
}

class CustomCheckboxTile extends StatelessWidget {
  final String label;
  final bool value;
  final void Function(bool)? onChange;

  const CustomCheckboxTile({
    Key? key,
    required this.label,
    required this.value,
    this.onChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          visualDensity: VisualDensity.compact,
          value: value,
          onChanged: (_) {
            if(onChange != null) {
              onChange!(!value);
            }
          },
        ),
        Text(label),
      ],
    );
  }
}