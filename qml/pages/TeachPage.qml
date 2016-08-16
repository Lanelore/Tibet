import QtQuick 2.0
import VPlayApps 1.0
import "../components"

PageBase {
  id: teachPage
  title: "Teach Me"

  ListViewBase {
    anchors.fill: parent
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
}
