import QtQuick 2.0

import VPlayApps 1.0

ListPage {
  id: simpleListPage

  title: "Simple List"

  readonly property int numPerPage: 20
  property int numItems: numPerPage

  //create array of numItems entries with { id: <index>, text: <text> } objects
  model: Array.apply(null, new Array(numItems)).map(function(_undefined, index) {
    return {
      id: index,
      text: "Item #" + (index + 1),
      category: "Section " + Math.ceil((index + 1) / 10),
      visible: index % 7 !== 6 //hides every 7th item
    }
  })

  // build sections based on the category property of the model
  section.property: "category"

  onItemSelected: navigationStack.popAllExceptFirstAndPush(detailPageComponent, {item: item})

  listView.footer: VisibilityRefreshHandler {
    onRefresh: loadMoreTimer.start()
  }

  //fake loading with timer
  Timer {
    id: loadMoreTimer
    interval: 2000
    repeat: false
    onTriggered: {
      var pos = listView.getScrollPosition()
      numItems += numPerPage
      listView.restoreScrollPosition(pos)
    }
  }

  Component {
    id: detailPageComponent

    Page {
      id: detailPage

      property var item

      title: item.text

      Column {
        anchors.centerIn: parent
        spacing: dp(12)

        AppText {
          anchors.horizontalCenter: parent.horizontalCenter
          text: detailPage.title
          font.pixelSize: sp(18)
        }

        AppButton {
          anchors.horizontalCenter: parent.horizontalCenter
          text: "Push another"
          flat: false
          onClicked: navigationStack.push(detailPageComponent, { item: {
                                              text: "Sub-" + item.text
                                            } })
        }

        //as default back navigation is disabled, provide custom back function
        AppButton {
          anchors.horizontalCenter: parent.horizontalCenter
          text: "Return to previous page"
          flat: true
          onClicked: navigationStack.pop()
        }
      }
    }
  }
}
