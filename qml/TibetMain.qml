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
  licenseKey: "4C8B988AABEB8122133E6E422A19FEF9ABCCADF641A650F55084DF71EABBCF1649801EA59619C6A5751F125019A0DEF0960939FD7490E8990E50E876C01B4FAE6DFE4BB2461A33EC53E64284FE3B35B9F5BFC5834EC11F63AE6B9BBF461A0FAF7A69CFE610A0CF179827D9B46CE3D72A72A8C82D4BA2FEED77DC013B05BC6EF8554797FC9422C5BDF7BBF139216A879760B1B03532B11844827156480F218AE4259E5985A88FEB2176388883FE7322C4B83DBD38D5C43E31F38779C779D2EE9A924454C5148FF39758F9FCB9527C93D8C0EB0F5233E8F8CC6AAFBCE0596F730000186A9E69436CC3DFF569106A653DBC7FDFBFAFA80531181D50B511349FA790FFD9BA1016EDAD7D79FEE4169E483AF5B06F4E4EE6AB0A18CA649BF8357D3AE4"

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
    Theme.listItem.minimumHeight = sp(40)
    Theme.listItem.fontSizeText = sp(16)
    Theme.listItem.selectedBackgroundColor = Theme.colors.tintColor
    Theme.listItem.showDisclosure = false
    Theme.listItem.iconSize = Theme.listItem.fontSizeText
    Theme.listItem.detailTextColor = "white"

    // set white status bar for ios
    Theme.colors.statusBarStyle = Theme.colors.statusBarStyleWhite
  }

  // define Storage item for loading/storing key-value data
  // ask the user for feedback after opening the app 5 times
  Storage {
    id: localStorage

    // the app starts with only 1 minute tracks unlocked, with the exception of specific 5 minute tracks
    property int unlocked: 1

    // update app starts counter
    Component.onCompleted: {
      // uncomment this to clear the storage
      //localStorage.clearValue("unlocked")

      var stored = localStorage.getValue("unlocked")
      if (stored > 1){
        unlocked = stored
      }
    }
  }
}
