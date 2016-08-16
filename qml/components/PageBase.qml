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

  // Drop a shadow on bottom and below the header
  Rectangle {
    id: shadow
    anchors.top: parent.top
    anchors.left: parent.left
    anchors.right: parent.right
    height: dp(25)

    gradient: Gradient {
      GradientStop { position: 0.0; color: "#30000000" }
      GradientStop { position: 0.4; color: "#10000000" }
      GradientStop { position: 1.0; color: "transparent" }
    }
  }

  // Drop a shadow on bottom and above the header
  Rectangle {
    id: shadow2
    anchors.top: parent.top
    anchors.left: parent.left
    anchors.right: parent.right
    height: dp(25)
    z: 10000

    gradient: Gradient {
      GradientStop { position: 0.0; color: "#30000000" }
      GradientStop { position: 0.4; color: "#10000000" }
      GradientStop { position: 1.0; color: "transparent" }
    }
  }
}
