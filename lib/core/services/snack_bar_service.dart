import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SnackBarService{

  static void showSuccessMessage(String msg) {

    BotToast.showCustomNotification(toastBuilder: (void Function() cancelFunc)
    {
return Material(
  color: Colors.transparent,
  child: Container(

    width: double.maxFinite,
    height: msg.length >80?100:75,
    padding: const EdgeInsets.only(right: 8),
    margin: const EdgeInsets.only(
        left: 24,
        right: 24
    ),
    decoration: BoxDecoration(
      color: Colors.white60,
      borderRadius: BorderRadius.circular(12),),
    child: msg.length>80
        ? Row(
      children: [
        Container(
          height: double.infinity,
          width: 10,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              bottomLeft: Radius.circular(12),
            )
          ),
        ),
        Expanded(
          flex: 1,
            child: Lottie.asset("assets/icons/success_checkmark_02.json",
            repeat: false,
            height: 250,
            width: 250,
            fit: BoxFit.fitWidth),

        ),
        Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
               const Text("Success",
                textAlign: TextAlign.start,
                maxLines: 3,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                  color: Colors.black,
                ),
               ),
                Text( msg,
                  textAlign: TextAlign.start,
                  maxLines: 3,
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.black54,
                  ),
                )
              ],
            )

        ),
        const VerticalDivider(
          color: Colors.black26,
          thickness: 2,
        ),
        Expanded(
            flex: 1,
            child: IconButton(
              onPressed: cancelFunc,
              icon: const Text("close",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black54,
                ),

              ),

        )
        )
      ]

        ):
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: double.infinity,
              width: 10,
              decoration: const BoxDecoration(
                color: Color(0xFF46c234),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    bottomLeft: Radius.circular(12),
                  )
              ),
            ),
            Expanded(
              flex: 1,
              child: Lottie.asset("assets/icons/success_checkmark_02.json",
                  repeat: false,
                  height: 250,
                  width: 250,
                  fit: BoxFit.fitWidth),

            ),
            Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Success",
                      textAlign: TextAlign.start,
                      maxLines: 3,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                        color: Colors.black,
                      ),
                    ),
                    Text( msg,
                      textAlign: TextAlign.start,
                      maxLines: 3,
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.black54,
                      ),
                    )
                  ],
                )

            ),
            const VerticalDivider(
              color: Colors.black26,
              thickness: 2,
            ),
            Expanded(
                flex: 1,
                child: IconButton(
                  onPressed: cancelFunc,
                  icon: const Text("close",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black54,
                    ),

                  ),

                )
            )

          ],
          
        )
  ),





  );
    },
      duration: const Duration(seconds: 10),
      dismissDirections: [DismissDirection.endToStart],
    );
  }
  static void showFailedMessage(String msg) {

    BotToast.showCustomNotification(toastBuilder: (void Function() cancelFunc)
    {
return Material(
  color: Colors.transparent,
  child: Container(

    width: double.maxFinite,
    height: msg.length >80?100:75,
    padding: const EdgeInsets.only(right: 8),
    margin: const EdgeInsets.only(
        left: 24,
        right: 24
    ),
    decoration: BoxDecoration(
      color: Colors.white60,
      borderRadius: BorderRadius.circular(12),),
    child: msg.length>80
        ? Row(
      children: [
        Container(
          height: double.infinity,
          width: 10,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              bottomLeft: Radius.circular(12),
            )
          ),
        ),
        Expanded(
          flex: 1,
            child: Lottie.asset("assets/icons/falied.json",
            repeat: false,
            height: 250,
            width: 250,
            fit: BoxFit.fitWidth),

        ),
        Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
               const Text("Failed",
                textAlign: TextAlign.start,
                maxLines: 3,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                  color: Colors.black,
                ),
               ),
                Text( msg,
                  textAlign: TextAlign.start,
                  maxLines: 3,
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.black54,
                  ),
                )
              ],
            )

        ),
        const VerticalDivider(
          color: Colors.black26,
          thickness: 2,
        ),
        Expanded(
            flex: 1,
            child: IconButton(
              onPressed: cancelFunc,
              icon: const Text("close",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black54,
                ),

              ),

        )
        )
      ]

        ):
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: double.infinity,
              width: 10,
              decoration: const BoxDecoration(
                color: Color(0xfffa0202),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    bottomLeft: Radius.circular(12),
                  )
              ),
            ),
            Expanded(
              flex: 1,
              child: Lottie.asset("assets/icons/falied.json",
                  repeat: false,
                  height: 250,
                  width: 250,
                  fit: BoxFit.fitWidth),

            ),
            Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Failed",
                      textAlign: TextAlign.start,
                      maxLines: 3,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                        color: Colors.black,
                      ),
                    ),
                    Text( msg,
                      textAlign: TextAlign.start,
                      maxLines: 3,
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.black54,
                      ),
                    )
                  ],
                )

            ),
            const VerticalDivider(
              color: Colors.black26,
              thickness: 2,
            ),
            Expanded(
                flex: 1,
                child: IconButton(
                  onPressed: cancelFunc,
                  icon: const Text("close",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black54,
                    ),

                  ),

                )
            )

          ],

        )
  ),





  );
    },
      duration: const Duration(seconds: 10),
      dismissDirections: [DismissDirection.endToStart],
    );
  }
}