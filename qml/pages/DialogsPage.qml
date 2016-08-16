import QtQuick 2.0
import QtQuick.Controls 1.4

import VPlayApps 1.0

Page {
  Column {
    anchors.centerIn: parent
    spacing: dp(12)

    AppButton {
      text: "Custom Dialog"
      anchors.horizontalCenter: parent.horizontalCenter
      onClicked: customDialog.open()
    }

    AppButton {
      id: confirmBtn
      text: "Confirm Dialog"
      anchors.horizontalCenter: parent.horizontalCenter
      onClicked: InputDialog.confirm(app, "Confirm this action?", function(ok) {
        if(ok) {
          confirmBtn.text = "Confirmed!"
        }
      })
    }

    AppButton {
      id: inputBtn
      text: "Input Text Dialog"
      anchors.horizontalCenter: parent.horizontalCenter
      onClicked: InputDialog.inputTextSingleLine(app,
                                                 "What do you think?", //message text
                                                 "Input here",         //hint text
                                                 function(ok, text) {
                                                   if(ok) {
                                                     inputBtn.text = "Input: " + text
                                                   }
                                                 })
    }
  }

  Dialog {
    id: customDialog
    title: "Do you think this is awesome?"
    positiveActionLabel: "Yes"
    negativeActionLabel: "No"
    onCanceled: title = "Think again!"
    onAccepted: close()

    Image {
      anchors.fill: parent
      source: "../../assets/vplay-logo.png"
      fillMode: Image.PreserveAspectFit
    }
  }
}
