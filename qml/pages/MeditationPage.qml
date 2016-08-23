import QtQuick 2.0
import VPlayApps 1.0
import "../components"

PageBase {
  id: meditationPage
  title: "meditations"

  property bool donationWindow: false

  bigFooter.visible: true

  // without Death process
  property var shortModel: [
    {text: "8 Worldly concerns", detail: "Please add a detailled description", background: "Sunset.png"},
    {text: "Compassionate mind", detail: "Please add a detailled description", background: "Boat.png"},
    {text: "Equanimity", detail: "Please add a detailled description"},
    {text: "Taking and giving others", detail: "Please add a detailled description"},
    {text: "May you be happy", detail: "Please add a detailled description"},
    {text: "Breathing meditation", detail: "Please add a detailled description"},
    {text: "Human rebirth", detail: "Please add a detailled description"},
    {text: "I meditation", detail: "Please add a detailled description"},
    {text: "Emptiness", detail: "Please add a detailled description"},
    {text: "Breathing delusions", detail: "Please add a detailled description"},
    {text: "Love for all beings", detail: "Please add a detailled description"},
    {text: "The mind of love", detail: "Please add a detailled description"},
    {text: "Karma", detail: "Please add a detailled description"},
    {text: "Impermanence", detail: "Please add a detailled description"},
    {text: "Bodhichitta", detail: "Please add a detailled description"},
    {text: "Thought transformation", detail: "Please add a detailled description"},
    {text: "Taking and giving self", detail: "Please add a detailled description"},
    {text: "Mothers kindness", detail: "Please add a detailled description"},
    {text: "Kindness to all being", detail: "Please add a detailled description"},
    {text: "Refuge", detail: "Please add a detailled description"},
    {text: "Guru", detail: "Please add a detailled description"},
    {text: "Guru 2", detail: "Please add a detailled description"}
  ]

  // with Death process
  property var longModel: [
    {text: "8 Worldly concerns", detail: "Please add a detailled description", background: "Sunset.png"},
    {text: "Compassionate mind", detail: "Please add a detailled description", background: "Boat.png"},
    {text: "Equanimity", detail: "Please add a detailled description"},
    {text: "Death process", detail: "Please add a detailled description"},
    {text: "Taking and giving others", detail: "Please add a detailled description"},
    {text: "May you be happy", detail: "Please add a detailled description"},
    {text: "Breathing meditation", detail: "Please add a detailled description"},
    {text: "Human rebirth", detail: "Please add a detailled description"},
    {text: "I meditation", detail: "Please add a detailled description"},
    {text: "Emptiness", detail: "Please add a detailled description"},
    {text: "Breathing delusions", detail: "Please add a detailled description"},
    {text: "Love for all beings", detail: "Please add a detailled description"},
    {text: "The mind of love", detail: "Please add a detailled description"},
    {text: "Karma", detail: "Please add a detailled description"},
    {text: "Impermanence", detail: "Please add a detailled description"},
    {text: "Bodhichitta", detail: "Please add a detailled description"},
    {text: "Thought transformation", detail: "Please add a detailled description"},
    {text: "Taking and giving self", detail: "Please add a detailled description"},
    {text: "Mothers kindness", detail: "Please add a detailled description"},
    {text: "Kindness to all being", detail: "Please add a detailled description"},
    {text: "Refuge", detail: "Please add a detailled description"},
    {text: "Guru", detail: "Please add a detailled description"},
    {text: "Guru 2", detail: "Please add a detailled description"}
  ]

  property var model1: [
    {text: "Breeze", detail: "The Colors Of The Wind", track: "Breeze.mp3", background: "Sunset.png"},
    {text: "Memories", detail: "Good Old Times", track: "Memories.mp3", background: "Boat.png"},
    {text: "Option3"},
    {text: "Option4"},
    {text: "Option5"},
    {text: "Option6"},
    {text: "Option7"},
    {text: "Option8"}
  ]

  property var model5: [
    {text: "FiveMinutes123456789012345678", locked: false},
    {text: "FiveMinutes2", locked: false},
    {text: "FiveMinutes3", locked: false},
    {text: "FiveMinutes4321234567890"},
    {text: "Five5"},
    {text: "FiveMinutes6"},
  ]

  property var model10: [
    {text: "TenMinutes1"},
    {text: "TenMinutes2"},
    {text: "TenMinutes3"},
    {text: "TenMinutes4"},
    {text: "TenMinutes5"},
    {text: "TenMinutes6"},
    {text: "TenMinutes7"},
    {text: "TenMinutes8"}
  ]

  property var model15: [
    {text: "Fifteen1"},
    {text: "Fifteen2"},
    {text: "Fifteen3"},
  ]

  ListViewBase {
    anchors.top: parent.top
    anchors.left: parent.left
    anchors.right: parent.right
    anchors.bottom: bigFooter.top
    model: {
      // The audio file Death process is only available in 10 and 15 minutes length
      if (optionSelected >= 10){
        return longModel
      } else {
        return shortModel
      }
      /*
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
      */
    }

    menuColor: "#695230"

    function option(pos, locked, title, detail, track, background){
      if (!locked){
        // push component with modelData text, image, sound file and more
        navigationStack.push(audioPageComponent, {title: title, detail: detail, track: track, background: background})
      } else {
        // ask whether to switch to the donation menu or not
        donationWindow = true
        nativeUtils.displayMessageBox(qsTr("This track is locked"), qsTr("Unlock this track by donating to the Tibetan Buddhist Foundation!"), 2)
      }
    }
  }

  // listen to the return value of the MessageBox
  Connections {
    target: nativeUtils
    onMessageBoxFinished: {
      if (accepted && donationWindow) {
        // switch to the donation page
        navigationStack.push(donationPageComponent, {})
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
        id: clockImage
        sourceSize.width: dp(26)
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
