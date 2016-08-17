import QtQuick 2.0
import QtQuick.Controls 1.2
import QtQuick.Layouts 1.1
import VPlayApps 1.0
import "../components"

PageBase {
  id: menuPage

  Image {
    fillMode: Image.PreserveAspectCrop
    anchors.fill: parent
    source: "../../assets/images/Sunset.jpg"
  }

  ListViewBase {
    model: [ "meditations", "teach me about", "help us to help", "how to meditate" ]
    menuColor: "#695230"
    interactive: false
    anchors.bottom: bottomItem.top
    anchors.left: parent.left
    anchors.right: parent.right
    height: children[0].height

    function option(pos){
      console.debug("Selected custom option: " + pos)
      switch(pos) {
      case 0:
        navigationStack.push(meditationPageComponent, {})
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
}
