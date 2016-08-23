import QtQuick 2.0
import VPlayApps 1.0
import "../components"

PageBase {
  id: helpPage
  title: "help us to help"

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
        source: "../../assets/images/Help.png"
        width: parent.width
        fillMode: Image.PreserveAspectFit
      }

      RowBase {
        style.backgroundColor: "#695230"
        text: "About Venerable Namgyel"
        //textItem.font.pixelSize: dp(14)

        onSelected: {
          navigationStack.push(aboutPageComponent, {})
        }
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
          text: "Venerable Lobsang Namgyel, has been based in India and Nepal, studying and teaching Buddhism there for more than 25 years, with such Masters as H.H. the Dalai Lama. He is the speaker of all the meditations inside this app.

All donations we will receive are being used to ….

certain project supporting Tibetan buddhism…..

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris tempus elementum tincidunt. Praesent hendrerit consectetur libero nec bibendum. Nam mollis nisi in augue vehicula, at imperdiet risus tempor. Sed vel enim non leo viverra ornare. Morbi fermentum vulputate enim, eu commodo lorem lobortis non. Sed at elit molestie, consectetur nisl blandit, hendrerit enim. Suspendisse potenti. Integer velit sem, ultrices sed tincidunt nec, varius eget nibh. Vestibulum vulputate lectus lorem. Aliquam condimentum, massa

DUMMY TEXT ONLY"
        }
      }

      RowBase {
        style.backgroundColor: "#4c641b"
        text: "Donate"
        //textItem.font.pixelSize: dp(14)

        onSelected: {
          navigationStack.push(donationPageComponent, {})
        }
      }
    }
  }
}
