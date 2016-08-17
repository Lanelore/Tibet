import QtQuick 2.0
import VPlayApps 1.0
import "../components"

PageBase {
  id: meditationPage
  title: "meditations"

  ListViewBase {
    anchors.top: parent.top
    anchors.left: parent.left
    anchors.right: parent.right
    anchors.bottom: minuteSelection.top
    model: [ "Standort ändern", "Haus", "Katze", "Meditieren", "Hund", "Karotte", "Koala" ]
    menuColor: "#695230"

    function option(pos){
      console.debug("Selected custom option: " + pos)
      switch(pos) {
      case 0:
        break;
      case 1:
        break;
      case 2:
        break;
      case 3:
        break;
      }
    }
  }

  // the footer on the bottom
  Rectangle {
    id: minuteSelection
    color: Theme.colors.backgroundColor
    anchors.bottom: parent.bottom
    anchors.left: parent.left
    anchors.right: parent.right
    height: dp(50)
    z: 10
  }

  Icon {

  }

  Text {
    text: "5"
    color: "white"
    font.family: standardFont.name
    font.pixelSize: sp(24)
    font.bold: true
    anchors.horizontalCenter: parent.horizontalCenter
    anchors.bottom: parent.bottom
    anchors.bottomMargin: dp(10)
    z: 10
  }
}
