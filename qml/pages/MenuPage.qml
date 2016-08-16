import QtQuick 2.0
import QtQuick.Controls 1.2
import QtQuick.Layouts 1.1
import VPlayApps 1.0
import "../components"

PageBase {
  id: menuPage
  title: "Menu"

  Image {
    fillMode: Image.PreserveAspectCrop
    anchors.fill: parent
    source: "../../assets/Sunset.jpg"
  }

  ListViewBase {
    model: [ "Teach Me", "Haus", "Katze", "Meditieren" ]
    menuColor: "#666666"
    interactive: false
    anchors.bottom: parent.bottom
    anchors.left: parent.left
    anchors.right: parent.right
    height: children[0].height

    function option(pos){
      console.debug("Selected custom option: " + pos)
      switch(pos) {
      case 0:
        navigationStack.push(teachPageComponent, {})
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
