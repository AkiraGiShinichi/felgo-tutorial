import Felgo 3.0
import QtQuick 2.0

GameWindow {
    id: gameWindow

    // You get free licenseKeys from https://felgo.com/licenseKey
    // With a licenseKey you can:
    //  * Publish your games & apps for the app stores
    //  * Remove the Felgo Splash Screen or set a custom one (available with the Pro Licenses)
    //  * Add plugins to monetize, analyze & improve your apps (available with the Pro Licenses)
    //licenseKey: "<generate one from https://felgo.com/licenseKey>"

//    activeScene: scene

    // the size of the Window can be changed at runtime by pressing Ctrl (or Cmd on Mac) + the number keys 1-8
    // the content of the logical scene size (480x320 for landscape mode by default) gets scaled to the window size based on the scaleMode
    // you can set this size to any resolution you would like your project to start with, most of the times the one of your main target device
    // this resolution is for iPhone 4 & iPhone 4S
    screenWidth: 960
    screenHeight: 640

//    Rectangle {
//        width: gameWindow.width
//        height: gameWindow.height
//        color: "red"
//    }

    Scene {
        id: scene

        // the "logical size" - the scene content is auto-scaled to match the GameWindow size
        width: 480
        height: 320

        property int score: 0

        Rectangle {
            anchors.fill: scene.gameWindowAnchorItem
            color: "#324566"
        }

        Text {
            id: score
            text: qsTr("Score " + scene.score)
            color: "white"
            anchors.horizontalCenter: scene.gameWindowAnchorItem.horizontalCenter
            anchors.top: scene.gameWindowAnchorItem.top
        }

        Column {
            anchors.centerIn: scene
            spacing: 10

            MyButton {
                labelText: "Add 1"
                onClicked: {
                    scene.increaseScore(1)
//                    scene.score++
                }
            }

            MyButton {
                labelText: "Add 10"
                onClicked: { // "myButton.mouseArea.onClicked" connects "signal clicked", "signal clicked" connects this "onClicked". How?
                    scene.increaseScore(10)
                }
            }
        }

        Timer {
            interval: 1000
            running: true
            repeat: true
            onTriggered: {
                scene.increaseScore(1)
            }
        }

        Image {
            id: image
            source: "../assets/felgo-logo.png"
            width: 100
            height: 100
            x: 0
            y: 0
        }

        SequentialAnimation {
            id: imageAnimation

            NumberAnimation {
                targets: image
                properties: "x"
                from: 0
                to: 15
                duration: 150
            }

            NumberAnimation {
                targets: image
                properties: "x"
                from: 15
                to: 0
                duration: 150
            }
        }


        function increaseScore(amount) {
            scene.score += amount
            imageAnimation.start()
            console.log("increased " + amount + " " + scene.score)
        }

    }

}
