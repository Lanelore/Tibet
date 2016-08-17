import QtQuick 2.0
import VPlayApps 1.0
import QtGraphicalEffects 1.0

Item {
  id: minuteOption
  width: minuteColumn.width
  height: minuteColumn.height

  property bool active: false
  property int number: 0
  signal selected

  SingleArea {
    anchors.fill: parent
    click: function (){
      selected()
    }
  }

  Column {
    id: minuteColumn
    spacing: dp(5)
    width: dp(20)
    anchors.centerIn: parent

    Icon {
      color: "white"
      width: number.width
      height: width
      icon: IconType.caretdown
      anchors.horizontalCenter: parent.horizontalCenter
      opacity: minuteOption.active ? 1.0 : 0
    }

    Text {
      text: number
      color: "white"
      font.family: standardFont.name
      font.pixelSize: sp(30)
      font.bold: true
      anchors.horizontalCenter: parent.horizontalCenter

      Image {
        anchors.centerIn: parent
        source: "../../assets/images/Blur.png"
        width: dp(50)
        fillMode: Image.PreserveAspectFit
        opacity: minuteOption.active ? 0.15 : 0
      }
    }
  }
}
