import 'package:flutter/material.dart';

class NewestBookContainerLoading extends StatelessWidget {
  const NewestBookContainerLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 125,
      child: Row(
        children: [
          AspectRatio(
            aspectRatio: 2.5 / 4,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.grey,
              ),
            ),
          ),
          const SizedBox(
            width: 30,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * .5,
                  child:  Container(color: Colors.grey,child: const Text("*****",style: TextStyle(color: Colors.grey),),),
                ),
                const SizedBox(
                  height: 3,
                ),
                 Container(color: Colors.grey,child: const Text("*****",style: TextStyle(color: Colors.grey),),),
                const SizedBox(
                  height: 3,
                ),
                Row(
                  children: [
                     Container(color: Colors.grey,child: const Text("*****",style: TextStyle(color: Colors.grey),),),
                    const Spacer(),
                     Container(color: Colors.grey,child: const Text("*****",style: TextStyle(color: Colors.grey),),),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
