import Felgo 3.0
import QtQuick 2.0

App {

  NavigationStack {

    Page {
      id: pageMain

      title: qsTr("My First App")

      AppText {
        id: txtWelcome
        text: "Welcome to Felgo!"
        anchors.centerIn: parent
      }

      AppImage {
          anchors.horizontalCenter: txtWelcome.horizontalCenter
          anchors.bottom: txtWelcome.top

          source: "../assets/felgo-logo.png"
      }

      AppButton {
          id: btnSwitchPage

          anchors.horizontalCenter: parent.horizontalCenter
          text: "Second Page"

          onClicked: {
              pageMain.navigationStack.push(Qt.resolvedUrl("DetailPage.qml"))
          }
      }
    }
  }
}
