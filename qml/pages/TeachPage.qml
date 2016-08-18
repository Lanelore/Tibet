import QtQuick 2.0
import VPlayApps 1.0
import "../components"

PageBase {
  id: teachPage
  title: "teach me about"

  ListViewBase {
    model: [
      {text: "Impermanence", url: "http://tricycle.org/magazine/tibetan-buddhist-meditation/"},
      {text: "Equanimity", url: "http://www.wikihow.com/Practice-Tibetan-Buddhism"},
      {text: "8 worldly winds"},
      {text: "The mind of love"},
      {text: "The mind of love"},
      {text: "The mind of love"},
      {text: "The mind of love"}
    ]
    menuColor: "#695230"
    anchors.top: parent.top
    anchors.left: parent.left
    anchors.right: parent.right
    anchors.bottom: smallFooter.top

    function option(pos, text, url){
      navigationStack.push(webPageComponent, {title: text, selectedUrl: url})
    }
  }
}
