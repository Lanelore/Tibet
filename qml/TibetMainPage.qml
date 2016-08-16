import QtQuick 2.4
import QtQuick.Controls 1.2
import VPlayApps 1.0
import "pages"

Page {
  // make page navigation public, so app-demo launcher can track navigation changes and log screens with Google Analytics
  property alias navigation: navigation

  Navigation {
    id: navigation
    navigationMode: navigationModeNone

    NavigationItem {
      id: menuItem
      title: "Menu"
      icon: IconType.calculator

      NavigationStack {
        MenuPage { title: menuItem.title }
      }
    }
  }

  Component {
    id: teachPageComponent
    TeachPage {}
  }
}
