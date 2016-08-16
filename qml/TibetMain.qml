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

  onInitTheme: {
    //Theme.normalFont = standardFont;
    //Theme.boldFont = boldFont;

    Theme.colors.backgroundColor = "#333333";
    Theme.colors.tintColor = "#ffd966";

    //Theme.navigationBar.height = app.width/10 // dp(50);
    Theme.navigationBar.titleColor = "white"
    Theme.navigationBar.titleAlignLeft = false;
    Theme.navigationBar.titleTextSize = sp(12);
   // Theme.navigationBar.titleBottomMargin = sp(3)
    Theme.navigationBar.titleAlignBottom = false
    Theme.navigationBar.height = Theme.navigationBar.titleTextSize * 2.5
    Theme.navigationBar.itemColor = "white"
    Theme.navigationBar.backgroundColor = "#333333"
    Theme.navigationBar.dividerColor = "transparent"

    Theme.listItem.textColor = "white"
    Theme.listItem.dividerColor = "transparent"
    Theme.listItem.minimumHeight = dp(40)
    Theme.listItem.fontSizeText = dp(14)
    Theme.listItem.selectedBackgroundColor = Theme.colors.tintColor
    Theme.listItem.showDisclosure = false

    // set white status bar for ios
    Theme.colors.statusBarStyle = Theme.colors.statusBarStyleWhite
  }
}
