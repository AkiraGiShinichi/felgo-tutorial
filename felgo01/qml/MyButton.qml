import QtQuick 2.0

Rectangle {
    id: myButton
    width: 100
    height: 50
    color: mouseArea.pressed ? "#546632":"#32665a"

    property alias labelText: label.text
    signal clicked

    Text {
        id: label
        text: qsTr("Button")
        color: "white"
        anchors.centerIn: parent
    }

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        onClicked: {
            console.debug("button clicked")
            myButton.clicked()
        }
    }
}
