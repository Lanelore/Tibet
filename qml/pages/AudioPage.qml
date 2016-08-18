import QtQuick 2.0
import QtQuick.Controls 1.2
import QtQuick.Layouts 1.1
import VPlayApps 1.0
import QtMultimedia 5.6
import "../components"

PageBase {
  id: audioPage

  bigFooter.visible: true

  property string title
  property string detail
  property string track
  property string background
  property int length

  Image {
    fillMode: Image.PreserveAspectCrop
    anchors.fill: parent
    source: background ? "../../assets/images/" + background : "../../assets/images/Sunset.png"
  }

  MediaPlayer {
    id: mediaplayer
    source: track != "" ? "../../assets/audio/" + track : "../../assets/audio/Breeze.mp3"
    Component.onCompleted: play()
  }

  Rectangle {
    id: progress
    color: "black"
    height: dp(10)
    anchors.fill: bigFooter
    anchors.margins: dp(10)
    anchors.bottomMargin: bigFooter.height * 0.75
    z: 10
    radius: 3
    opacity: 0.8

    Rectangle {
      color: "grey"
      radius: 3
      anchors.fill: parent
      anchors.margins: dp(1)
      anchors.rightMargin: {
        var maxWidth = parent.width - anchors.margins * 2
        var pastLength = maxWidth / mediaplayer.duration * mediaplayer.position
        return maxWidth - pastLength
      }
    }
  }

  Item {
    id: textItems
    anchors.left: parent.left
    anchors.leftMargin: dp(10)
    anchors.top: progress.bottom
    anchors.topMargin: dp(6)
    anchors.right: parent.right
    anchors.rightMargin: anchors.leftMargin
    height: titleText.height + detailText.height + detailText.anchors.topMargin
    z: 10

    Text {
      id: titleText
      anchors.top: parent.top
      color: "white"
      font.family: standardFont.name
      font.pixelSize: sp(20)
      font.bold: true
      text: title ? title : "Meditation"
      elide: Text.ElideRight
      width: parent.width - timeRow.width * 1.5
    }

    Text {
      id: detailText
      anchors.top: titleText.bottom
      anchors.topMargin: dp(4)
      color: "white"
      font.family: standardFont.name
      font.pixelSize: sp(10)
      font.bold: true
      font.italic: true
      text: detail ? detail : "Lorem Ipsum etc. Apple Banana Coconut Donkey Elephant Frog Giraffe HD"
      elide: Text.ElideRight
      width: parent.width
    }
  }

  Row {
    id: timeRow
    spacing: dp(6)
    anchors.right: parent.right
    anchors.rightMargin: dp(10)
    anchors.top: progress.bottom
    anchors.topMargin: dp(8)
    height: clockImage.height
    z: 10

    Image {
      id: clockImage
      sourceSize.width: dp(16)
      sourceSize.height: dp(16)
      source: "../../assets/images/Clock.png"
    }

    Text {
      id: lengthText
      anchors.verticalCenter: parent.verticalCenter
      color: "white"
      font.family: standardFont.name
      font.pixelSize: sp(20)
      font.bold: true
      text: length ? length : 3
    }
  }
}
