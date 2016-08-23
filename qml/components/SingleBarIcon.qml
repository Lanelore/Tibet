import QtQuick 2.5
import VPlayApps 1.0

// a button which blocks input after the first click
IconButtonBarItem {
  id: singleBarIcon

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
}
