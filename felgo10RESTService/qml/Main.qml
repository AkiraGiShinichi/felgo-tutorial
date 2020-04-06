import Felgo 3.0
import QtQuick 2.0

App {
    // You get free licenseKeys from https://felgo.com/licenseKey
    // With a licenseKey you can:
    //  * Publish your games & apps for the app stores
    //  * Remove the Felgo Splash Screen or set a custom one (available with the Pro Licenses)
    //  * Add plugins to monetize, analyze & improve your apps (available with the Pro Licenses)
    //licenseKey: "<generate one from https://felgo.com/licenseKey>"

    Component.onCompleted: {
        HttpNetworkActivityIndicator.activationDelay = 0
        getIP()
    }

    NavigationStack {
        Page {
            title: qsTr("Main Page")
            rightBarItem: ActivityIndicatorBarItem {
                enabled: HttpNetworkActivityIndicator.enabled
                visible: enabled
            }

            AppText {
                id: ipText
                text: "SMT"
                anchors.centerIn: parent
            }
        }
    }

    function getIP() {
        HttpRequest.get("https://api.ipify.org?format=json")
        .then(function(res) {
            var responseJSON = res.body
            var ip = responseJSON.ip
            ipText.text = "IP: " + ip
        })
        .catch(function(err) {
            console.log("Error: " + err.message)
        })
    }
}
