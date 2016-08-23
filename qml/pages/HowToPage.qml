import QtQuick 2.0
import VPlayApps 1.0
import "../components"

PageBase {
  id: howToPage
  title: "how to meditate"

  Flickable {
    anchors.top: parent.top
    anchors.left: parent.left
    anchors.right: parent.right
    anchors.bottom: smallFooter.top
    contentHeight: contentColumn.height + contentColumn.anchors.margins * 2

    Rectangle {
      anchors.fill: parent
      color: "white"
    }

    Column {
      id: contentColumn
      anchors.top: parent.top
      anchors.left: parent.left
      anchors.right: parent.right

      Image {
        source: "../../assets/images/Namgyel.png"
        width: parent.width
        fillMode: Image.PreserveAspectFit
      }

      Item {
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.margins: dp(20)
        height: infoText.height + infoText.anchors.topMargin * 2

        Text {
          id: infoText
          anchors.left: parent.left
          anchors.right: parent.right
          anchors.top: parent.top
          anchors.topMargin: dp(20)
          wrapMode: Text.WordWrap
          font.pixelSize: sp(12)
          text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus interdum, metus sed elementum feugiat, mi turpis commodo mauris, non accumsan nibh neque nec ligula. Donec quis iaculis velit, id finibus felis. Praesent ut diam elit. Integer tincidunt risus eros. Aenean ac erat dictum, posuere sem sed, porttitor turpis. Quisque ac enim mollis, ornare mauris et, ultrices mauris. Pellentesque ut massa non diam mattis placerat eget eu eros.

Sed urna erat, lacinia sed consectetur id, sagittis eu quam. Praesent sapien diam, pellentesque vel egestas at, auctor maximus ex. Nam at nunc sed dui tincidunt convallis. Phasellus maximus finibus tortor a varius. Praesent id velit enim. Sed sed fermentum lorem. Duis ac mollis neque. Phasellus fringilla leo sed est luctus fermentum. Fusce placerat vel velit in hendrerit. Curabitur augue enim, pulvinar a cursus a, tempus id nisi. Nam pretium aliquam consectetur. Nam ut sem ac urna malesuada tempor. Nulla blandit ligula quis arcu lobortis congue. Donec vitae semper nisl.

Aliquam erat augue, scelerisque non justo ut, ultrices iaculis felis. Phasellus iaculis sem nec ornare mattis. Maecenas enim lacus, semper at metus vel, molestie porttitor eros. Phasellus quam urna, vehicula et egestas quis, lobortis quis urna. Duis imperdiet dignissim est, vel mollis augue rhoncus sed. Cras libero risus, ultrices non euismod ut, placerat eget nisl. Ut congue non erat in porttitor. Quisque eu enim ex. Duis id vulputate nulla, at tempor mauris. Fusce erat leo, rhoncus sit amet ex non, luctus congue sapien."
        }
      }
    }
  }
}
