import Felgo 3.0
import QtQuick 2.0
import "pages"
import "model"
import "logic"

App {
    // You get free licenseKeys from https://felgo.com/licenseKey
    // With a licenseKey you can:
    //  * Publish your games & apps for the app stores
    //  * Remove the Felgo Splash Screen or set a custom one (available with the Pro Licenses)
    //  * Add plugins to monetize, analyze & improve your apps (available with the Pro Licenses)
    //licenseKey: "<generate one from https://felgo.com/licenseKey>"

    Component.onCompleted: {
        if (isOnline) {
            logic.clearCache()
        }

        logic.fetchTodos()
        logic.fetchDraftTodos()
    }

    Logic {
        id: logic
    }

    // Model
    DataModel {
        id: dataModel
        dispatcher: logic

        onFetchTodosFailed: nativeUtils.displayMessageBox("Unable to load todos", error, 1)
        onFetchTodoDetailsFailed: NativeUtils.displayMessageBox("Unable to load photo" + id, error, 1)
        onStoreTodoFailed: NativeUtils.displayMessageBox("Failed to store" + viewHelper.formatTitle(todo))
    }

    ViewHelper {
        id: viewHelper
    }

    NavigationStack {
        id: navigation
        enabled: dataModel.userLoggedIn

        NavigationItem {
            title: qsTr("Todo List")
            icon: IconType.list

            NavigationStack {
                splitView: tablet
                initialPage: TodoListPage{}
            }
        }

    }

    LoginPage {
        visible: opacity > 0
        enabled: visible
        opacity: dataModel.userLoggedIn ? 0 : 1
        Behavior on opacity {
            NumberAnimation { duration: 250 }
        }
    }
}
