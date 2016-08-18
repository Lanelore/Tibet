import VPlayApps 1.0
import "./pages"
import "./components"
import QtQuick 2.0
import VPlay 2.0
import QtPositioning 5.5
import VPlayPlugins 1.0


App {
  id: app

  // You get free licenseKeys from http://v-play.net/licenseKey
  // With a licenseKey you can:
  //  * Publish your games & apps for the app stores
  //  * Remove the V-Play Splash Screen or set a custom one (available with the Pro Licenses)
  //  * Add plugins to monetize, analyze & improve your apps (available with the Pro Licenses)
  //licenseKey: "<generate one from http://v-play.net/licenseKey>"

  property int optionSelected: 1

  TibetMainPage { }

  // other scenes are loaded at runtime, when finished menu is shown
  Loader {
    anchors.fill: parent
    id: mainItemLoader
    onLoaded: {
      if(item) {
        splash.opacity = 0;
      }
    }

    // start loading other scenes after 50 ms
    Timer {
      running: true
      interval: 50
      onTriggered: mainItemLoader.source = Qt.resolvedUrl("TibetMainPage.qml")
    }
  }

  SplashPage {
    id: splash
  }

  // main text font
  FontLoader {
    id: standardFont
    source: "../assets/fonts/Walkway.ttf"
  }

  onInitTheme: {
    Theme.normalFont = standardFont;
    //Theme.boldFont = boldFont;

    Theme.colors.backgroundColor = "#333333";
    Theme.colors.tintColor = "#eac879";

    Theme.navigationBar.titleColor = "white"
    Theme.navigationBar.titleAlignLeft = false;
    Theme.navigationBar.titleTextSize = sp(12);
    Theme.navigationBar.titleAlignBottom = false
    Theme.navigationBar.height = Theme.navigationBar.titleTextSize * 2.5
    Theme.navigationBar.itemColor = "white"
    Theme.navigationBar.backgroundColor = Theme.colors.backgroundColor
    Theme.navigationBar.dividerColor = "transparent"
    Theme.navigationBar.titleTextBold = true

    Theme.listItem.textColor = "white"
    Theme.listItem.dividerColor = "transparent"
    Theme.listItem.minimumHeight = sp(50)
    Theme.listItem.fontSizeText = sp(20)
    Theme.listItem.selectedBackgroundColor = Theme.colors.tintColor
    Theme.listItem.showDisclosure = false
    Theme.listItem.iconSize = dp(20)

    // set white status bar for ios
    Theme.colors.statusBarStyle = Theme.colors.statusBarStyleWhite
  }

  // define Storage item for loading/storing key-value data
  // ask the user for feedback after opening the app 5 times
  Storage {
    id: localStorage

    property int unlocked: 5

    // update app starts counter
    Component.onCompleted: {
      // uncomment this to clear the storage
      //localStorage.clearValue("unlocked")

      var stored = localStorage.getValue(unlocked)
      if (stored > 5){
        unlocked = stored
      }
    }
  }
}
