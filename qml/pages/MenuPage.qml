import QtQuick 2.0
import QtQuick.Controls 1.2
import QtQuick.Layouts 1.1
import VPlayApps 1.0
import "../components"

PageBase {
  id: widgetsPage
  property bool activated: true

  Item {
    anchors.top: parent.top
    anchors.bottom: parent.bottom
    width: parent.width

    ScrollIndicator {
      flickable: scroll
      z: 1
    }

    Flickable {
      id: scroll
      anchors.fill: parent

      contentHeight: scrollCol.height + dp(8)
      clip: true

      Column  {
        id: scrollCol
        width: parent.width

        Repeater {
          model: [
            { text: "Widget test",
              detailText: "Some of the widgets available in V-Play AppSDK",
              icon: IconType.tablet },
            { text: "Shown are:",
              detailText: "ListPage, NavigationBar with different items, Switch, AppButton, AppText",
              icon: IconType.question },
            { text: "Swipe list rows for options",
              detailText: "Implemented using a simple SwipeOptionsContainer with leftOption and rightOption",
              icon: IconType.list }
          ]

          delegate: SwipeOptionsContainer {
            id: container
            height: row.height

            enabled: !(isSnapped && isRight)

            //the actual list item
            SimpleRow {
              id: row
              style.showDisclosure: false
            }

            //left swipe option (when swiping list item to right)
            leftOption: SwipeButton {
              text: "Option"
              icon: IconType.gear
              height: row.height
              onClicked: {
                row.item.text = "Option clicked"
                row.itemChanged()

                //hide left option when clicked
                container.hideOptions()
              }
            }

            //right swipe option (when swiping list item to left)
            rightOption: AppActivityIndicator {
              width: row.height
              anchors.centerIn: parent
            }

            //hide right option after timer finishes
            onRightOptionShown: hideTimer.start()

            property Timer hideTimer: Timer {
              running: false
              interval: 1000
              onTriggered: container.hideOptions()
            }
          }
        }

        Row {
          anchors.horizontalCenter: parent.horizontalCenter

          AppSwitch {
            id: sw
            anchors.verticalCenter: parent.verticalCenter

            checked: widgetsPage.activated
            updateChecked: false //always keep the property binding
            onToggled: {
              widgetsPage.activated = !widgetsPage.activated

              navigationStack.push(teachPageComponent); //jsonData: modelData.subcategory

            }
          }

          AppActivityIndicator {
            anchors.verticalCenter: parent.verticalCenter

            animating: widgetsPage.activated
          }
        }

        GridLayout {
          id: tintColorRow

          anchors.horizontalCenter: parent.horizontalCenter

          property color defaultColor
          Component.onCompleted: defaultColor = Theme.tintColor

          columnSpacing: dp(12)
          columns: 2
          rowSpacing: dp(12)

          AppText {
            text: "Change Tint Color:"

            Layout.columnSpan: 2
            Layout.fillWidth: true

          }

          Repeater {
            model: [tintColorRow.defaultColor, "#FF3B30", "#4CD964", "#FF9500"]

            Rectangle {
              color: modelData

              Layout.preferredWidth: dp(64)
              Layout.preferredHeight: dp(48)
              MouseArea {
                anchors.fill: parent
                onClicked: tintColorAnim.start(color)
              }
            }
          }
        }

        PropertyAnimation {
          id: tintColorAnim
          target: Theme.colors
          property: "tintColor"
          duration: 300
          easing.type: Easing.InOutQuad

          function start(color) {
            to = color
            running = true
          }
        }
      }
    }

    ScrollIndicator {
      flickable: scroll
    }
  }
}
