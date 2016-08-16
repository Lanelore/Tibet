import QtQuick 2.0
import VPlayApps 1.0

Page {
  id: page

  property alias leftItem: leftItem
  property alias rightItem: rightItem

  leftBarItem: NavigationBarItem {
    id: leftItem
    width: leftIcon.width
    visible: canNavigateBack

    SingleBarIcon {
      id: leftIcon
      iconSize: dp(Theme.navigationBar.titleTextSize)
      icon: IconType.chevronleft
      click: function (){
        navigationStack.pop()
      }
    }
  }

  rightBarItem: NavigationBarItem {
    id: rightItem
    width: rightIcon.width

    SingleBarIcon {
      id: rightIcon
      iconSize: dp(Theme.navigationBar.titleTextSize)
      icon: IconType.questioncircle
      click: function (){
        console.debug("Question clicked")
      }
    }
  }

  // Drop a shadow on bottom of header
  Rectangle {
    id: shadow
    anchors.top: parent.top
    anchors.left: parent.left
    anchors.right: parent.right
    height: dp(25)
    // z: 100000

    gradient: Gradient {
      GradientStop { position: 0.0; color: "#80000000" }
      GradientStop { position: 0.5; color: "#30000000" }
      GradientStop { position: 1.0; color: "transparent" }
    }
  }
}
