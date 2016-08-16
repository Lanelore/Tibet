import QtQuick 2.0
import VPlayApps 1.0
import "../components"

PageBase {
  title: "Simple List"

  ListView {
    id: moreView
    anchors.fill: parent
    //  interactive: false

    model: [ "Standort ändern", "Haus", "Katze", "Meditieren" ]

    delegate: SimpleRow {
      text: modelData
      textItem.font.pixelSize: sp(16)
      anchors.left: parent.left
      anchors.right: parent.right

      // define styling
      active: {
        if (modelData.text == navigationStack.currentTitle) {
          return true;
        }else{
          return false;
        }
      }

      style.textColor: Theme.navigationAppDrawer.textColor
      style.activeTextColor: Theme.navigationAppDrawer.activeTextColor
      style.spacing: Theme.navigationAppDrawer.rowSpacing
      style.dividerHeight: Theme.navigationAppDrawer.dividerHeight
      style.dividerColor: Theme.navigationAppDrawer.dividerColor
      style.backgroundColor: !active ? Theme.navigationAppDrawer.itemBackgroundColor : Theme.navigationAppDrawer.itemSelectedBackgroundColor
      style.selectedBackgroundColor: Theme.navigationAppDrawer.itemSelectedBackgroundColor

      //   textItem.font.family: standardFont.name
      onSelected: moreView.option()
    }

    function option(){
      console.debug("Selected option: " + index)
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
  }
}
