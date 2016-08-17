import QtQuick 2.0
import QtQuick.Controls 1.2
import QtQuick.Layouts 1.1
import VPlayApps 1.0
import "../components"

PageBase {
  id: audioPage

  bigFooter.visible: true

  property string title
  property string track
  property string background

  Image {
    fillMode: Image.PreserveAspectCrop
    anchors.fill: parent
    source: background ? "../../assets/images/" + background : "../../assets/images/Sunset.png"
  }
}
