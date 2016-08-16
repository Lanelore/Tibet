import QtQuick 2.0
import VPlayApps 1.0
import "../components"

PageBase {
  title: "Teach Me"

  ListView {
    id: moreView
    anchors.fill: parent
    //  interactive: false

    model: [ "Standort ändern", "Haus", "Katze", "Meditieren", "Hund", "Karotte", "Koala" ]
    property var menuColor: "#695230"

    delegate: RowBase {

      text: modelData
      anchors.left: parent.left
      anchors.right: parent.right

      style.backgroundColor: moreView.getColor(index + 1)

/*
      style.textColor: Theme.navigationAppDrawer.textColor
      style.activeTextColor: Theme.navigationAppDrawer.activeTextColor
      style.spacing: Theme.navigationAppDrawer.rowSpacing
      style.dividerHeight: Theme.navigationAppDrawer.dividerHeight
      style.dividerColor: "transparent"
      //style.backgroundColor: !active ? Theme.navigationAppDrawer.itemBackgroundColor : Theme.navigationAppDrawer.itemSelectedBackgroundColor
      style.selectedBackgroundColor: Theme.navigationAppDrawer.itemSelectedBackgroundColor
*/
      //   textItem.font.family: standardFont.name
      onSelected: moreView.option(index)
    }

    function option(pos){
      console.debug("Selected option: " + pos)
      switch(action) {
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

    function getColor(pos){
      console.debug("GetColor: " + pos)
      console.debug("model.length: " + model.length)

      var color
      var half = (model.length + 0.5) / 2
      var floorHalf = Math.ceil(half)
      var ceilHalf = Math.ceil(half)
      var halfPos

      if (pos < half){
        // if the option is in the darker upper half
        halfPos = floorHalf - pos
        console.debug("halfPos: " + halfPos + ", Ceilhalf: " + ceilHalf + ", Half: " + half)
        var darkness = halfPos / half * 1.5 + 1.0
        console.debug("darkness: " + darkness)
        // the shades vary between the actual color (1.0) and the maximum darkness/lightness (3.0 + 1.0)
        color = Qt.darker(menuColor, darkness)
      } else if (pos > half){
        // if the option is in the lighter lower half
        halfPos = pos - ceilHalf
        var lightness = halfPos / half * 0.8 + 1.0
        console.debug("lightness: " + lightness)
        // the shades vary between the actual color (1.0) and the maximum darkness/lightness (3.0 + 1.0)
        color = Qt.lighter(menuColor, lightness)
      } else {
        // if there's an uneven amount of options and the exact center
        color = menuColor
      }
      console.debug("return " + color)
      return color
    }
  }
}
