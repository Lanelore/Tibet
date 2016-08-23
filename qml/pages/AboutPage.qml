import QtQuick 2.0
import VPlayApps 1.0
import "../components"

PageBase {
  id: aboutPage
  title: "about venerable namgyel"

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
          text: "Namgyal Rinpoche, Karma Tenzin Dorje (1931–2003), born Leslie George Dawson in Toronto, Canada, was a Tibetan Buddhist lama in the Karma Kagyu tradition.

Namgyal Rinpoche was born Leslie George Dawson in 1931, October 11, and raised in Toronto, Canada by parents of Irish and Scottish descent and attended Jarvis Baptist Seminary, before going on to the University of Michigan in Ann Arbor, USA, where he studied philosophy and psychology and became active in Socialist politics. After visiting Moscow to address an international youth conference, he became disillusioned with politics, and moved to London in 1954.

While in London he studied Buddhism and in 1956 met the Sayadaw U Thila Wunta, a Burmese monk who accepted Leslie Dawson as a student. That same year he traveled to Bodh Gaya, India to rejoin the Sayadaw and received ordination as a sāmaṇera (novice monk). He continued on to Burma where he was ordained as Anandabodhi bhikkhu at the Shwedagon Pagoda in Yangon on 21 December 1958. He began intensive training and meditation practice under the guidance of U Thila Wunta and Mahasi Sayadaw, then in Thailand with Chao Khun Phra Rajasiddhimuni at Wat Mahadhatu in Bangkok. In Sri Lanka he studied the Pāli Canon, the Visuddhimagga, and other classical texts before receiving the title acharya (teacher of Dhamma)."
        }
      }
    }
  }
}
