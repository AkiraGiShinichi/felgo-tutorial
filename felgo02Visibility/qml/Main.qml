import Felgo 3.0
import QtQuick 2.0

App {
    // You get free licenseKeys from https://felgo.com/licenseKey
    // With a licenseKey you can:
    //  * Publish your games & apps for the app stores
    //  * Remove the Felgo Splash Screen or set a custom one (available with the Pro Licenses)
    //  * Add plugins to monetize, analyze & improve your apps (available with the Pro Licenses)
    //licenseKey: "<generate one from https://felgo.com/licenseKey>"

//    1. Add or remove a component from my layout by visibility
//    Page {
//      AppText {
//        id: appTextItem
//        text: "Some Text"
//        anchors.centerIn: parent
//      }
//      AppButton {
//         text: "A Button"
//         visible: !appTextItem.visible // hide button if text is visible and vice versa
//         onClicked: console.log("Button clicked!")
//         anchors.centerIn: parent
//      }

//      AppButton {
//        anchors.bottom: parent.bottom
//        flat: false
//        text: "Toggle"
//        onClicked: appTextItem.visible = !appTextItem.visible // show/hide text
//      }
//    }

//    2. Animate the visibility
    Page {
      // button at the bottom allows to toggle the text
      AppButton {
       anchors.horizontalCenter: parent.horizontalCenter
       anchors.bottom: parent.bottom
       text: "Toggle Text Item"
       onClicked: textItem.opacity = textItem.visible ? 0 : 1 // toggle textItem visibility
      }

      // centered text which fades when opacity changes
      AppText {
        id: textItem
        anchors.centerIn: parent
        text: "Hello World!"
        visible: opacity != 0 // also set invisible when fully transparent

        // when opacity changes ...
        Behavior on opacity {
          NumberAnimation { duration: 500 } // ... animate to reach new value within 500ms
        }
      }
    }

//    3. Animate the movements & colors
    NavigationStack {
      Page {
        title: "Complex Animation"

        AppButton {
          anchors.centerIn: parent
          text: "Move!"
          flat: false
          onClicked: {
            // Start the animation by calling start() of the top-most item
            complexAnimation.start()
          }
        }

        Rectangle {
          id: rectangle
          width: dp(100)
          height: dp(100)
          color: "black"
        }

        // All child animations will be executed one after the other
        SequentialAnimation {
          // You can start the whole animation by calling start() of the top-most item
          id: complexAnimation

          // 1. Move to right
          NumberAnimation {
            target: rectangle
            property: "x"
            to: dp(400)
            duration: 1000
          }

          // 2. Move down and change color
          // All child animations will be executed in parallel
          ParallelAnimation {
            NumberAnimation {
              target: rectangle
              property: "y"
              to: dp(200)
              duration: 1000
              easing.type: Easing.InOutQuad
            }
            ColorAnimation {
              target: rectangle
              property: "color"
              to: "blue"
              duration: 1000
            }
          }

          // 3. Move left, change color and rotate
          // All child animations will be executed in parallel
          ParallelAnimation {
            NumberAnimation {
              target: rectangle
              property: "x"
              to: 0
              duration: 1000
            }
            ColorAnimation {
              target: rectangle
              property: "color"
              to: "black"
              duration: 1000
            }
            NumberAnimation {
              target: rectangle
              property: "rotation"
              from: 0
              to: 360
              duration: 1000
            }
          }

          // 4. Move up
          NumberAnimation {
            target: rectangle
            property: "y"
            to: 0
            duration: 1000
            easing.type: Easing.InBack
          }
        }
      }
    }
}
