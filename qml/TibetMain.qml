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

  TibetMainPage { }

  // main text font
  FontLoader {
    id: standardFont
    source: "../assets/fonts/HighThin.ttf"
  }

  onInitTheme: {
    Theme.normalFont = standardFont;
    //Theme.boldFont = boldFont;

    Theme.colors.backgroundColor = "#404040";
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
    Theme.listItem.minimumHeight = dp(50)
    Theme.listItem.fontSizeText = sp(20)
    Theme.listItem.selectedBackgroundColor = Theme.colors.tintColor
    Theme.listItem.showDisclosure = false

    // set white status bar for ios
    Theme.colors.statusBarStyle = Theme.colors.statusBarStyleWhite
  }
}
