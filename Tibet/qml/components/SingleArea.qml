import QtQuick 2.0

// mouseArea stops input after one click
MouseArea {
  id: singleArea

  property var click: function () {};

  onPressed: {
    if (singleTimer.running) return;
    singleTimer.start()
    click()
  }

  Timer {
    id: singleTimer
    interval: 500
    repeat: false
    running: false
  }
}
