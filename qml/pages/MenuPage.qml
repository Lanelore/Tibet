import QtQuick 2.0
import QtQuick.Controls 1.2
import QtQuick.Layouts 1.1
import VPlayApps 1.0
import "../components"

PageBase {
  id: menuPage

  property bool exitWindow: false

  leftBarItem: NavigationBarItem {
    id: leftItem
    width: leftIcon.width

    SingleBarIcon {
      id: leftIcon
      iconSize: dp(Theme.navigationBar.titleTextSize)
      icon: IconType.close
      scale: 1.25
      click: function (){
        // ask if he really wants to exit the app
        exitWindow = true
        nativeUtils.displayMessageBox(qsTr("Really quit the application?"), "", 2)
      }
    }
  }

  Image {
    fillMode: Image.PreserveAspectCrop
    anchors.fill: parent
    source: "../../assets/images/Sunset.png"
  }

  ListViewBase {
    model: [
      {text: "meditations"},
      {text: "teach me about"},
      {text: "help us to help"},
      {text: "how to meditate"}
    ]
    menuColor: "#695230"
    interactive: false
    anchors.bottom: smallFooter.top
    anchors.left: parent.left
    anchors.right: parent.right
    height: children[0].height

    function option(pos){
      switch(pos) {
      case 0:
        optionSelected = 1
        navigationStack.push(meditationPageComponent, {})
        break;
      case 1:
        navigationStack.push(teachPageComponent, {})
        break;
      case 2:
        break;
      case 3:
        break;
      }
    }
  }

  Keys.onBackPressed: {
    if (navigationStack.currentTitle == "tibetan buddhist meditations"){
      console.debug("Title matches!")
      exitWindow = true
      nativeUtils.displayMessageBox(qsTr("Really quit the application?"), "", 2)
      event.accepted = true // consume the event
    }
  }
  /*
  // the menu scene is our start scene, so if back is pressed there we ask the user if he wants to quit the application
  Connections {
    target: getApplication()
    onBackButtonPressedGlobally: {
      if (navigationStack.currentTitle == "tibetan buddhist meditations"){
        console.debug("Title matches!")
        exitWindow = true
        nativeUtils.displayMessageBox(qsTr("Really quit the application?"), "", 2)
        event.accepted = true // consume the event
      }
    }
  }
*/
  // listen to the return value of the MessageBox
  Connections {
    target: nativeUtils
    onMessageBoxFinished: {
      // only quit if coming from the quit dialog, e.g. the GameNetwork might also show a messageBox
      if (accepted && exitWindow) {
        Qt.quit()
      }
    }
  }
}
