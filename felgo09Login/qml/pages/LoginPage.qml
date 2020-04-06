import Felgo 3.0
import QtQuick 2.0
import QtQuick.Layouts 1.12

Page {
    id: loginPage
    title: qsTr("Login")
    backgroundColor: Qt.rgba(0, 0, 0, 0.75)
    useSafeArea: false

    Rectangle {
        id: loginForm
        anchors.centerIn: parent
        color: "white"
        width: content.width + dp(48)
        height: content.height + dp(16)
        radius: dp(4)
    }

    GridLayout {
        id: content
        anchors.centerIn: loginForm
        columnSpacing: dp(20)
        rowSpacing: dp(10)
        columns: 2

        AppText {
            Layout.topMargin: dp(8)
            Layout.bottomMargin: dp(12)
            Layout.columnSpan: 2
            Layout.alignment: Qt.AlignHCenter
            text: "Login"
        }

        AppText {
            text: qsTr("Email")
            font.pixelSize: sp(12)
        }

        AppTextField {
            id: txtUserName
            Layout.preferredWidth: dp(200)
            showClearButton: true
            font.pixelSize: sp(14)
            borderColor: Theme.tintColor
            borderWidth: !Theme.isAndroid ? dp(2) : 0
        }

        AppText {
            text: qsTr("Password")
            font.pixelSize: sp(12)
        }

        AppTextField {
            id: txtPassword
            Layout.preferredWidth: dp(200)
            showClearButton: true
            font.pixelSize: sp(14)
            borderColor: Theme.tintColor
            borderWidth: !Theme.isAndroid ? dp(2) : 0
            echoMode: TextInput.Password
        }

        Column {
            Layout.fillWidth: true
            Layout.columnSpan: 2
            Layout.topMargin: dp(12)

            AppButton {
                text: qsTr("Login")
                flat: false
                anchors.horizontalCenter: parent.horizontalCenter
                onClicked: {
                    loginPage.forceActiveFocus() // Q: What is "forceActiveFocus"?
                    // TODO: call login action
                }
            }

            AppButton {
                text: qsTr("No account yet? Register now")
                flat: true
                anchors.horizontalCenter: parent.horizontalCenter
                onClicked: {
                    loginPage.forceActiveFocus()
                    // TODO: call your logic action to register here
                    console.debug("registering...")
                }
            }
        }
    }
}
