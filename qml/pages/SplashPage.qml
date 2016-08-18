import QtQuick 2.0
import VPlayApps 1.0
import "../components"

PageBase {
  id: splashPage

  Behavior on opacity {
    NumberAnimation {easing.type: Easing.InOutQuad; duration: 400}
  }

  Image {
    id: splashImage
    source: "../../assets/images/Sunset.png"
    fillMode: Image.PreserveAspectCrop
    anchors.fill: parent
    z: 10
  }

  Text {
    text: "Tibetan\nBuddhist\nMeditations"
    horizontalAlignment: Text.AlignHCenter
    color: "#695230"
    font.family: standardFont.name
    font.pixelSize: sp(40)
    font.bold: true
    anchors.horizontalCenter: parent.horizontalCenter
    anchors.top: parent.top
    anchors.topMargin: dp(100)
    z: 10
  }
}
