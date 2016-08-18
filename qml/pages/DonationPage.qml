import QtQuick 2.0
import VPlayApps 1.0
import "../components"

PageBase {
  id: donationPage
  title: "donation"

  Image {
    id: backgroundImage
    source: "../../assets/images/Forest.png"
    fillMode: Image.PreserveAspectCrop
    anchors.fill: parent
  }

  ListViewBase {
    model: [
      {text: "Donate $5", detailText: "Unlock all 5 min. meditations and help us greatly!"},
      {text: "Donate $10", detailText: "Unlock all 5 and 10 min. meditations and help us greatly!"},
      {text: "Donate $15", detailText: "Unlock all 5, 10 and 15 min. meditations and help us greatly!"},
      {text: "Donate any $", detailText: "Unlock all meditations and help us greatly!"},
    ]
    menuColor: "#4c641b"
    interactive: false
    anchors.bottom: smallFooter.top
    anchors.left: parent.left
    anchors.right: parent.right
    height: children[0].height

    function option(pos){
      switch(pos) {
      case 0:
        localStorage.unlocked = 5
        localStorage.setValue("unlocked", 5)
        break;
      case 1:
        localStorage.unlocked = 10
        localStorage.setValue("unlocked", 10)
        break;
      case 2:
        localStorage.unlocked = 15
        localStorage.setValue("unlocked", 15)
        break;
      case 3:
        localStorage.unlocked = 15
        localStorage.setValue("unlocked", 15)
        break;
      }
    }
  }
}
