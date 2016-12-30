import VPlay 2.0
import QtQuick 2.0
import "../Control"

Row {
  signal playPressed()

  spacing:                      18
  anchors.horizontalCenter:     parent.horizontalCenter
  height:                       menuItem.height

  ImgButton {
    id:                         menuItem
    onClicked: {
      playPressed()
    }
    source: "../../assets/image/playAgain.png"
  }
}
