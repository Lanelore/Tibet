import QtQuick 2.3
import QtQuick.Layouts 1.1
import QtQuick 2.0
import VPlayApps 1.0

Item {
  id: cell

  property var item: (typeof(modelData) !== "undefined" ) ? modelData : null // modelData is not defined for ListModel
  property string text: item && item.text || ""
  property string detailText: item && item.detailText || ""
  property string iconSource: item && item.icon || ""
  property string imageSource: item && item.image || ""
  property bool active: item && item.active || false
  property alias image: innerImage
  property alias icon: defaultIconItem
  property alias textItem: textLabel
  property alias detailTextItem: detailTextLabel
  property bool autoSizeImage: false
  property real imageMaxSize: width / 3
  property StyleSimpleRow style: StyleSimpleRow { }
  signal selected(int index)
  property real radius: 0
  property real contentHeight: innerGrid.height

  enabled: (!item || item.enabled !== false)
  visible: ((item === null || item.visible === undefined) ? true : item.visible)
  width: parent ? parent.width : 0
  height: visible || !parent.visible ? 2 * gridWrapper.y + gridWrapper.height : 0

  // default hover effect
  Rectangle {
    color: cellArea.pressed && !Theme.isAndroid ? cell.style.selectedBackgroundColor : cell.style.backgroundColor
    anchors.fill: parent
    radius: parent.radius

    Behavior on color {
      ColorAnimation { duration: 150; easing.type: Easing.InOutQuad }
    }
  }

  RippleMouseArea {
    id: cellArea
    enabled: cell.enabled
    anchors.fill: parent
    circularBackground: false
    radius: parent.radius
    clip: true

    onReleased: selected(typeof index !== "undefined" ? index : 0)

    // use selected background color of the style for the ripple background
    backgroundColor: setAlpha(cell.style.selectedBackgroundColor, 0.5)
    fillColor: setAlpha(cell.style.selectedBackgroundColor, 0.5)

    function setAlpha(color, alpha) {
      return Qt.rgba(color.r,color.g,color.b, alpha)
    }
  }

  // wrapper for grid to center it vertically
  Item {
    id: gridWrapper
    y: Math.max(0, (dp(cell.style.minimumHeight) - innerGrid.height)) * 0.5
    width: parent.width
    height: innerGrid.height

    // Main cell content inside this item
    GridLayout {
      id: innerGrid

      // Auto-break after 3 columns, so we do not have to set row & column manually
      columns: 4
      rowSpacing: dp(5)
      columnSpacing: dp(cell.style.indent)
      x: dp(cell.style.indent)
      width: parent.width - 2 * x

      // Top spacer
      Item {
        id: topSpacer
        Layout.preferredWidth: parent.width
        Layout.preferredHeight: dp(cell.style.spacing) - parent.rowSpacing
        Layout.minimumHeight: 0
        Layout.fillWidth: true
        Layout.columnSpan: 4
      }

      RoundedImage {
        id: innerImage

        fillMode: Image.PreserveAspectFit
        visible: imageSource.length > 0
        source: imageSource
        smooth: true

        radius: 0

        Layout.preferredWidth: Layout.preferredHeight
        Layout.preferredHeight: Math.min(cell.autoSizeImage
                                         ? (textLabel.height + detailTextLabel.height + innerGrid.rowSpacing)
                                         : dp(cell.style.imageSize),
                                           imageMaxSize)
        Layout.alignment: Qt.AlignCenter
        Layout.rowSpan: cell.autoSizeImage ? 2 : 1
      }

      Item {
        id: innerIcon
        Layout.preferredWidth: dp(cell.style.iconSize)
        Layout.preferredHeight: dp(cell.style.iconSize)
        Layout.alignment: Qt.AlignHCenter

        visible: !innerImage.visible && (iconSource.length > 0 || innerIcon.navItem)

        // prepare properties for custom icon component (hidden feature used by Navigation)
        readonly property bool tabControl: false // custom icon is also created for tab control
        readonly property bool selected: active
        readonly property NavigationItem navItem: cell.item && cell.item._vplayNavItem || null

        // default child is an the default icon item
        Icon {
          id: defaultIconItem
          icon: iconSource
          size: dp(cell.style.iconSize - 5)
          color: textLabel.color
          anchors.centerIn: parent
          visible: iconSource.length > 0
        }

        Component.onCompleted: {
          // create custom or default icon
          if(innerIcon.navItem && navItem.iconComponent)
            navItem.iconComponent.createObject(innerIcon)
        }
      }

      Item {
        // wrapper item for text handles available space in layout
        visible: textLabel.text.length > 0
        Layout.columnSpan: parent.columns - //count visible items in this row
                           [innerImage, innerIcon, innerDisclosure].reduce(function(val, item) {
                             return val + (item.visible ? 1 : 0)
                           }, 0)
        Layout.fillWidth: true
        Layout.preferredWidth: parent.width
        Layout.preferredHeight: textLabel.height
        Layout.alignment: Qt.AlignCenter

        // actual text item
        Text {
          id: textLabel
          elide: Text.ElideRight
          maximumLineCount: 1
          color: active ? cell.style.activeTextColor : cell.style.textColor
          font.family: Theme.normalFont.name
          font.pixelSize: sp(cell.style.fontSizeText)
          text: cell.text

          // calculate additional margin needed to align with title in navigation bar
          property real titleAlignmentMargin:
              dp(Theme.navigationBar.titleLeftMargin + Theme.navigationBar.defaultIconSize + Theme.navigationBar.defaultBarItemPadding)
              - parent.x + dp(5)

          // add x offset margin to align with navigation bar title text
          //x: Theme.navigationBar.titleAlignLeft && (innerIcon.visible || innerImage.visible) && titleAlignmentMargin > 0 ? titleAlignmentMargin : 0
          anchors.centerIn: parent
        }
      }

      Text {
        id: innerDisclosure
        visible: cell.style.showDisclosure && cell.enabled
        color: cell.style.disclosureColor
        font.family: Theme.iconFont.name
        font.pixelSize: dp(22)
        wrapMode: Text.WordWrap
        text: IconType.angleright
      }

      Item {
        visible: detailTextLabel.text.length > 0
        Layout.preferredWidth: parent.width
        Layout.preferredHeight: detailTextLabel.height
        Layout.fillWidth: true
        Layout.columnSpan: cell.autoSizeImage ? (parent.columns - 1) : parent.columns

        Text {
          id: detailTextLabel
          color: active ? cell.style.activeTextColor : cell.style.detailTextColor
          font.family: Theme.normalFont.name
          font.pixelSize: sp(cell.style.fontSizeDetailText)
          wrapMode: Text.WordWrap
          text: cell.detailText

          x: cell.autoSizeImage ? textLabel.x : 0
          width: parent.width - x
          anchors.verticalCenter: parent.verticalCenter
        }
      }

      Item {
        id: bottomSpacer
        Layout.preferredWidth: parent.width
        Layout.preferredHeight: dp(cell.style.spacing) - parent.rowSpacing + divider.height
        Layout.minimumHeight: divider.height
        Layout.columnSpan: 4
        Layout.fillWidth: true
      }
    } // grid layout

  }

  // Bottom cell divider
  Rectangle {
    id: divider

    property real leftSpacing: innerImage.visible | innerIcon.visible  ? (innerImage.width + innerIcon.width + dp(cell.style.dividerLeftSpacing)) : 0

    // TODO: The check should also contain ListView.nextSection === ListView.section for iOS that draws the bottom divider
    // in the last row of a section full width, the attached properties are however not set on Qt 5.5.1 as of now
    // https://bugreports.qt.io/browse/QTBUG-45206
    x: (cell.style.dividerLeftSpacing > 0) ? leftSpacing + dp(cell.style.dividerLeftSpacing) : 0
    width: parent.width - x
    color: cellArea.pressed && Theme.isIos ? cell.style.selectedBackgroundColor : cell.style.dividerColor
    height: px(cell.style.dividerHeight)
    anchors.bottom: parent.bottom
  }
}
