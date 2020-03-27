import Felgo 3.0
import QtQuick 2.0

App {
    // You get free licenseKeys from https://felgo.com/licenseKey
    // With a licenseKey you can:
    //  * Publish your games & apps for the app stores
    //  * Remove the Felgo Splash Screen or set a custom one (available with the Pro Licenses)
    //  * Add plugins to monetize, analyze & improve your apps (available with the Pro Licenses)
    //licenseKey: "<generate one from https://felgo.com/licenseKey>"

    Navigation {
        // enable both tabs and drawer for this demo
        // by default, tabs are shown on iOS and a drawer on Android
        navigationMode: navigationModeTabsAndDrawer

        NavigationItem {
            title: "Home"
            icon: IconType.home

            NavigationStack {
                Page {
                    title: "Main Page"
                }
            }
        }

        NavigationItem {
            title: "Lists"
            icon: IconType.list

            NavigationStack {
                Page {
                    title: "Lists"
                }
            }
        }

    }
}
