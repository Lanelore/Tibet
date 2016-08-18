import QtQuick 2.5
import VPlayApps 1.0
import QtGraphicalEffects 1.0

// a button which blocks input after the first click
IconButtonBarItem {
  id: singleBarIcon

  property string imageSource: "" //"../../assets/Icon.png"
  property string imageColor: "transparent"

  property var click: function () {};

  onClicked: {
    if (singleTimer.running) return;
    singleTimer.start()
    click()
  }

  // button gets disabled for 500ms after one click
  // avoid the pushing of mulitple pages
  Timer {
    id: singleTimer
    interval: 500
    repeat: false
    running: false
  }

  Image {
    id: iconImage
    width: iconSize
    height: iconSize
    anchors.centerIn: parent
    source: imageSource
    visible: imageSource != ""
  }
}
