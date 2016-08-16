import QtQuick 2.0
import QtQuick.Controls 1.2

import VPlayApps 1.0

Page {
  AppDrawer {
    id: drawer

    z: 1 //put drawer on top of other content
    drawerPosition: drawerPositionRight

    Rectangle { //background for drawer
      anchors.fill: parent
      color: "white"
    }

    AppButton {
      anchors.centerIn: parent
      text: "Test"
      onClicked: {
        testTxt.text = "Button in drawer Clicked"
        drawer.close()
      }
    }
  }

  AppText {
    id: testTxt
    anchors.centerIn: parent
    font.pixelSize: sp(18)
    text: "Swipe from right to open drawer"
  }

  AppButton {
    text: "Open drawer manually"
    anchors.top: testTxt.bottom
    anchors.horizontalCenter: parent.horizontalCenter
    onClicked: drawer.open()
  }
}
