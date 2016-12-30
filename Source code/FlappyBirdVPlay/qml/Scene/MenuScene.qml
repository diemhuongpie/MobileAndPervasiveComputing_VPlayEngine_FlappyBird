import QtQuick 2.0
import VPlay 2.0
import "../Entities"
import "../Scene"

BaseScene {
  id:                           scene

  signal                        gamePressed()

  Background {
    anchors.horizontalCenter:   scene.gameWindowAnchorItem.horizontalCenter
    anchors.bottom:             scene.gameWindowAnchorItem.bottom
  }

  MultiResolutionImage {
    anchors.top:                parent.top
    anchors.topMargin:          60
    anchors.horizontalCenter:   scene.gameWindowAnchorItem.horizontalCenter
    source: "../../assets/image/logo.png"
  }

  Grass {
    id:                         ground
    anchors.horizontalCenter:   scene.gameWindowAnchorItem.horizontalCenter
    anchors.bottom:             scene.gameWindowAnchorItem.bottom
  }

  Bird {
    resetX:                     scene.gameWindowAnchorItem.width/2
    resetY:                     scene.gameWindowAnchorItem.height/2
  }

  Menu {
    anchors.bottom:             ground.top
    onPlayPressed:              gamePressed()
  }

  onEnterPressed: {
    gamePressed()
  }
}
