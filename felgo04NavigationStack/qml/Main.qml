import Felgo 3.0
import QtQuick 2.0

App {
    // You get free licenseKeys from https://felgo.com/licenseKey
    // With a licenseKey you can:
    //  * Publish your games & apps for the app stores
    //  * Remove the Felgo Splash Screen or set a custom one (available with the Pro Licenses)
    //  * Add plugins to monetize, analyze & improve your apps (available with the Pro Licenses)
    //licenseKey: "<generate one from https://felgo.com/licenseKey>"

    id: app

    property int count: 0

    // main page
    NavigationStack {
        Page {
            id: mainPage
            title: "Main"

            Column {
                anchors.centerIn: parent

                // text to show the current count and button to push the second page
                AppText {
                    anchors.horizontalCenter: parent.horizontalCenter
                    text: "Count " + app.count
                }
                AppButton {
                    text: "Push Counter Page"
                    onClicked: mainPage.navigationStack.push(counterPageComponent)
                }
            }
        }
    }

    // inline-definition of a component, which is later pushed on the stack
    Component {
        id: counterPageComponent
        Page {
            title: "Change Count"
            property Page target: null

            Column {
                anchors.centerIn: parent

                // buttons to increase or decrease the count, which is displayed on the main page
                AppButton {
                    text: "Count ++"
                    onClicked: {
                        app.count++
                    }
                }
                AppButton {
                    text: "Count --"
                    onClicked: {
                        app.count--
                    }
                }
            }
        }
    }
}
