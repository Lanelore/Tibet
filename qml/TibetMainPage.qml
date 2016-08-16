import QtQuick 2.4
import QtQuick.Controls 1.2

import VPlayApps 1.0

import "pages"

Page {
  // make page navigation public, so app-demo launcher can track navigation changes and log screens with Google Analytics
  property alias navigation: navigation

  Navigation {
    id: navigation

    NavigationItem {
      id: menuItem
      title: "Menu"
      icon: IconType.calculator

      NavigationStack {
        MenuPage { title: menuItem.title }
      }
    }

    NavigationItem {
      id: simpleListPage
      title: "Simple List"
      icon: IconType.list

      NavigationStack {
        splitView: tablet
        SimpleListPage { title: simpleListPage.title }
      }
    }
  }
}
