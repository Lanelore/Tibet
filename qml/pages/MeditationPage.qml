import QtQuick 2.0
import VPlayApps 1.0
import QtGraphicalEffects 1.0
import "../components"

PageBase {
  id: meditationPage
  title: "meditations"

  property int optionSelected: 1

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
    height: dp(60)
    z: 10

    MouseArea {
      anchors.fill: parent
    }

    Row {
      anchors.horizontalCenter: parent.horizontalCenter
      anchors.bottom: parent.bottom
      anchors.bottomMargin: -dp(10)
      spacing: 0

      Icon {
        size: sp(30)
        color: "white"
        width: meditationPage.width/5
        height: width
        icon: IconType.clocko
      }

      MinuteOption {
        width: meditationPage.width/5
        number: 1
        active: optionSelected == number
        onSelected: {
          optionSelected = number
        }
      }

      MinuteOption {
        width: meditationPage.width/5
        number: 5
        active: optionSelected == number
        onSelected: {
          optionSelected = number
        }
      }

      MinuteOption {
        width: meditationPage.width/5
        number: 10
        active: optionSelected == number
        onSelected: {
          optionSelected = number
        }
      }

      MinuteOption {
        width: meditationPage.width/5
        number: 15
        active: optionSelected == number
        onSelected: {
          optionSelected = number
        }
      }
    }
  }
}
