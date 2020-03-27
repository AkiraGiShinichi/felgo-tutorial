import Felgo 3.0
import QtQuick 2.0
import QtMultimedia 5.12

App {
    // You get free licenseKeys from https://felgo.com/licenseKey
    // With a licenseKey you can:
    //  * Publish your games & apps for the app stores
    //  * Remove the Felgo Splash Screen or set a custom one (available with the Pro Licenses)
    //  * Add plugins to monetize, analyze & improve your apps (available with the Pro Licenses)
    //licenseKey: "<generate one from https://felgo.com/licenseKey>"

    NavigationStack {

        Page {
            id: mainPage
            backgroundColor: "black"

            title: qsTr("Main Page")

            Camera {
                id: camera
                captureMode: Camera.CaptureStillImage

                imageCapture {
                    onImageCaptured: {
                        photoPreview.source = preview
                    }
                }
            }

            VideoOutput {
                anchors.fill: parent
                source: camera
                autoOrientation: true
            }

            AppImage {
                id: photoPreview
                source: "../assets/felgo-logo.png"
                height: 100
                width: 100
                anchors.bottom: parent.bottom
                anchors.left: parent.left
                property var mini: true

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        console.log("Clicked")
                        var properties = {source: photoPreview.source}
//                        var properties = {text: "NULL", source: photoPreview.source}
                        mainPage.navigationStack.push(previewImageComponent, properties)
//                        photoPreview.resizePreviewImage() // use this if want to resize previewImage by function
                    }
                }

                function resizePreviewImage() {
                    if (photoPreview.mini === true) {
                        console.log("mini preview")
                        photoPreview.mini = false
                        photoPreview.height = 200
                        photoPreview.width = 200
                    }
                    else {
                        console.log("full preview")
                        photoPreview.mini = true
                        photoPreview.height = 100
                        photoPreview.width = 100
                    }
                }
            }

            AppButton {
                id: snapButton
                text: "Snap"
                backgroundColor: "transparent"
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.bottom: parent.bottom
                onClicked: {
                    console.log("CaptureButton Clicked")
                    camera.imageCapture.capture()
                }
            }
        }

    }

    Component {
        id: previewImageComponent

        Page {
            id: previewImagePage

            property alias text: photoText.text
            property alias source: photoPreview.source

            AppImage {
                id: photoPreview
                source: "../assets/felgo-logo.png"
                anchors.fill: parent
            }

            AppText {
                id: photoText
                text: Qt.formatDateTime(new Date(), "yyyyMMdd_hhmmss")
            }

            AppButton {
                id: saveButton
                backgroundColor: "transparent"
                text: "Save"
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.bottom: parent.bottom
                onClicked: {
                    console.log("SaveButton Clicked")
                }
            }
        }
    }
}
