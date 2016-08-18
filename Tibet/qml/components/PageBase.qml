import QtQuick 2.0
import VPlayApps 1.0

Page {
  id: page

  property alias leftItem: leftItem
  property alias rightItem: rightItem
  property alias smallFooter: smallFooter
  property alias bigFooter: bigFooter

  titleItem: null

  leftBarItem: NavigationBarItem {
    id: leftItem
    width: leftIcon.width
    visible: canNavigateBack

    SingleBarIcon {
      id: leftIcon
      iconSize: dp(Theme.navigationBar.titleTextSize)
      icon: IconType.caretleft
      scale: 1.5
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
    id: headerShadow
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
    id: headerShadow2
    anchors.top: parent.top
    anchors.left: parent.left
    anchors.right: parent.right
    height: dp(25)
    z: 10

    gradient: Gradient {
      GradientStop { position: 0.0; color: "#30000000" }
      GradientStop { position: 0.4; color: "#10000000" }
      GradientStop { position: 1.0; color: "transparent" }
    }
  }

  // the small footer on the bottom
  Rectangle {
    id: smallFooter
    color: Theme.colors.backgroundColor
    anchors.bottom: parent.bottom
    anchors.left: parent.left
    anchors.right: parent.right
    height: dp(20)
    z: 10
  }

  // the big footer on the bottom
  Rectangle {
    id: bigFooter
    color: Theme.colors.backgroundColor
    anchors.bottom: parent.bottom
    anchors.left: parent.left
    anchors.right: parent.right
    height: dp(70)
    z: 10
    visible: false

    MouseArea {
      anchors.fill: parent
    }

    // Drop a shadow on above and behind (z) the footer
    Rectangle {
      id: footerShadow
      anchors.bottom: bigFooter.top
      anchors.left: parent.left
      anchors.right: parent.right
      height: dp(25)

      gradient: Gradient {
        GradientStop { position: 1.0; color: "#30000000" }
        GradientStop { position: 0.6; color: "#10000000" }
        GradientStop { position: 0.0; color: "transparent" }
      }
    }

    // Drop a shadow on above and in front (z) of the footer
    Rectangle {
      id: footerShadow2
      anchors.bottom: bigFooter.top
      anchors.left: parent.left
      anchors.right: parent.right
      height: dp(25)
      z: 10
      opacity: 0.3

      gradient: Gradient {
        GradientStop { position: 1.0; color: "#30000000" }
        GradientStop { position: 0.6; color: "#10000000" }
        GradientStop { position: 0.0; color: "transparent" }
      }
    }
  }
}
