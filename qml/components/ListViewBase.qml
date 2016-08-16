import QtQuick 2.0

ListView {
  id: moreView

  property string menuColor: "blue"

  delegate: RowBase {
    id: row
    text: modelData
    anchors.left: parent.left
    anchors.right: parent.right
    style.backgroundColor: moreView.getColor(index + 1)
    onSelected: moreView.option(index)
  }

  function option(pos){}

  function getColor(pos){
    var color
    var half = (model.length + 0.5) / 2
    var floorHalf = Math.ceil(half)
    var ceilHalf = Math.ceil(half)
    var halfPos

    if (pos < half){
      // if the option is in the darker upper half
      halfPos = floorHalf - pos
      var darkness = halfPos / half * 1.5 + 1.0
      // the shades vary between the actual color (1.0) and the maximum darkness/lightness (3.0 + 1.0)
      color = Qt.darker(menuColor, darkness)
    } else if (pos > half){
      // if the option is in the lighter lower half
      halfPos = pos - ceilHalf
      var lightness = halfPos / half * 0.8 + 1.0
      // the shades vary between the actual color (1.0) and the maximum darkness/lightness (3.0 + 1.0)
      color = Qt.lighter(menuColor, lightness)
    } else {
      // if there's an uneven amount of options and the exact center
      color = menuColor
    }
    return color
  }
}
