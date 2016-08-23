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
      title: "tibetan buddhist meditations"
      icon: IconType.calculator

      NavigationStack {
        MenuPage { title: menuItem.title }
      }
    }
  }

  Component {
    id: meditationPageComponent
    MeditationPage {}
  }

  Component {
    id: audioPageComponent
    AudioPage {}
  }

  Component {
    id: donationPageComponent
    DonationPage {}
  }

  Component {
    id: teachPageComponent
    TeachPage {}
  }

  Component {
    id: webPageComponent
    WebPage {}
  }

  Component {
    id: helpPageComponent
    HelpPage {}
  }

  Component {
    id: aboutPageComponent
    AboutPage {}
  }

  Component {
    id: howToPageComponent
    HowToPage {}
  }
}
