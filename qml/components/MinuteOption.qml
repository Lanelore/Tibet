import QtQuick 2.0
import VPlayApps 1.0

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
    spacing: dp(3)
    width: dp(20)
    anchors.centerIn: parent

    Icon {
      color: "white"
      icon: IconType.caretdown
      scale: 1.5
      anchors.horizontalCenter: parent.horizontalCenter
      opacity: minuteOption.active ? 1.0 : 0

      Behavior on opacity {
        NumberAnimation {easing.type: Easing.InOutQuad; duration: 200}
      }
    }

    Text {
      text: number
      horizontalAlignment: Text.AlignHCenter
      color: "white"
      font.family: standardFont.name
      font.pixelSize: sp(36)
      font.bold: true
      anchors.horizontalCenter: parent.horizontalCenter

      Image {
        anchors.centerIn: parent
        source: "../../assets/images/Blur.png"
        width: dp(40)
        height: dp(45)
        opacity: minuteOption.active ? 0.15 : 0

        Behavior on opacity {
          NumberAnimation {easing.type: Easing.InOutQuad; duration: 200}
        }
      }
    }
  }
}
