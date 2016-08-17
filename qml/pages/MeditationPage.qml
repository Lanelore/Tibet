import QtQuick 2.0
import VPlayApps 1.0
import QtGraphicalEffects 1.0
import "../components"

PageBase {
  id: meditationPage
  title: "meditation"

  bigFooter.visible: true

  property var model1: [
    {text: "Option1", track: "Option1.mp3", background: "Sunset.png"},
    {text: "Option2", track: "Option2.mp3", background: "Boat.png"},
    {text: "Option3", track: "Option2.mp3"},
    {text: "Option4", track: "Option2.mp3"},
    {text: "Option5", track: "Option2.mp3"},
    {text: "Option6", track: "Option2.mp3"},
    {text: "Option7", track: "Option2.mp3"},
    {text: "Option8", track: "Option2.mp3"}
  ]

  property var model5: [
    {text: "FiveMinutes123456789012345678", track: "Option1.mp3"},
    {text: "FiveMinutes2", track: "Option2.mp3"},
    {text: "FiveMinutes3", track: "Option2.mp3"},
    {text: "FiveMinutes4321234567890", track: "Option2.mp3", locked: localStorage.unlocked <= 5},
    {text: "Five5", track: "Option2.mp3", locked: localStorage.unlocked <= 5},
    {text: "FiveMinutes6", track: "Option2.mp3", locked: localStorage.unlocked <= 5},
  ]

  property var model10: [
    {text: "TenMinutes1", track: "Option1.mp3"},
    {text: "TenMinutes2", track: "Option2.mp3"},
    {text: "TenMinutes3", track: "Option2.mp3"},
    {text: "TenMinutes4", track: "Option2.mp3"},
    {text: "TenMinutes5", track: "Option2.mp3"},
    {text: "TenMinutes6", track: "Option2.mp3"},
    {text: "TenMinutes7", track: "Option2.mp3"},
    {text: "TenMinutes8", track: "Option2.mp3"}
  ]

  property var model15: [
    {text: "Fifteen1", track: "Option1.mp3"},
    {text: "Fifteen2", track: "Option2.mp3"},
    {text: "Fifteen3", track: "Option2.mp3"},
  ]

  ListViewBase {
    anchors.top: parent.top
    anchors.left: parent.left
    anchors.right: parent.right
    anchors.bottom: bigFooter.top
    model: {
      switch (optionSelected) {
      case 1:
        return model1
      case 5:
        return model5
      case 10:
        return model10
      case 15:
        return model15
      }
    }

    menuColor: "#695230"

    function option(pos, locked, title, track, background){
      console.debug("Selected custom option: " + pos)

      if (!locked){
        // push component with modelData text, image and sound file
        console.debug("Switch To Audio Player")
        console.debug("Title: " + title + ", Track: " + track + ", Background: " + background)
        navigationStack.push(audioPageComponent, {title: title, track: track, background: background})
        //{text: "Option1", track: "Option1.mp3", background: "Sunset.png"}
      } else {
        console.debug("Switch to Donation Window")
      }
    }
  }

  Row {
    anchors.horizontalCenter: parent.horizontalCenter
    anchors.bottom: parent.bottom
    anchors.bottomMargin: dp(7)
    spacing: 0
    height: children[1].height
    z: 10

    Item {
      width: meditationPage.width/5
      height: parent.height

      Image {
        sourceSize.width: sp(26)
        sourceSize.height: dp(26)
        source: "../../assets/images/Clock.png"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.bottomMargin: dp(7)
      }
    }

    Repeater {
      model: [1, 5, 10, 15]
      delegate: MinuteOption {
        width: meditationPage.width/5
        number: modelData
        active: optionSelected == number
        onSelected: {
          optionSelected = number
        }
      }
    }
  }
}
