import Felgo 3.0
import QtQuick 2.0
import com.yourcompany.xyz 1.0

App {
    // You get free licenseKeys from https://felgo.com/licenseKey
    // With a licenseKey you can:
    //  * Publish your games & apps for the app stores
    //  * Remove the Felgo Splash Screen or set a custom one (available with the Pro Licenses)
    //  * Add plugins to monetize, analyze & improve your apps (available with the Pro Licenses)
    //licenseKey: "<generate one from https://felgo.com/licenseKey>"

    NavigationStack {

        Page {
            title: qsTr("Integrate C++ & QML")



            Column {
                spacing: 10

                // Example 1 - Global Context Property
                AppButton {
                    text: "myGlobalObject.doSomething()"
                    onClicked: myGlobalObject.doSomething("TEXT FROM QML");
                }

                AppButton {
                    text: "myGlobalObject.counter + 1"
                    onClicked: myGlobalObject.counter += 1
                }

                AppText {
                    text: "Global Context Property Counter: " + myGlobalObject.counter
                }

                Image {
                    source: "../assets/felgo-logo.png"
                }

                // Example 2: Custom QML Type implemented with C++
                MyQMLType {
                    id: typeFromCpp

                    // 2.1: Property Binding for MyQMLType::message property
                    // NOTE: Similar to types created purely with QML, you may use property bindings to keep your property values updated
                    message: "counter / 2 = " + Math.floor(myGlobalObject.counter / 2)

                    // 2.2: Reacting to property changes
                    // NOTE: With the onMessageChanged signal, you can add code to handle property changes
                    onMessageChanged: console.log("typeFromCpp message changed to '" + typeFromCpp.message+"'")

                    // 2.3: Run code at creation of the QML component
                    // NOTE: The Component.onCompleted signal is available for every QML item, even for items defined with C++.
                    // The signal is fired when the QML Engine creates the item at runtime.
                    Component.onCompleted: myGlobalObject.counter = typeFromCpp.increment(myGlobalObject.counter)
                }

                // 2.1: Show typeFromCpp.message value, which is calculated automatically based on the myGlobalObject.counter value
                AppText {
                    text: "Custom QML Type Message:\n" + typeFromCpp.message
                }
            }

        }

    }
}
