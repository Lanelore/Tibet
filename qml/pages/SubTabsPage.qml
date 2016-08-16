import QtQuick 2.0

import VPlayApps 1.0

Page {
  TabControl {
    NavigationItem {
      title: "Tab #1"
      icon: IconType.arrowleft

      Page {
        AppText {
          anchors.centerIn: parent
          font.pixelSize: sp(18)
          text: "Sub Tab #1"
        }
      }
    }
    NavigationItem {
      title: "Tab #2"
      icon: IconType.arrowright

      Page {
        AppText {
          anchors.centerIn: parent
          font.pixelSize: sp(18)
          text: "Sub Tab #2"
        }
      }
    }
  }
}

