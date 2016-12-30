import VPlay 2.0
import QtQuick 2.0
import "../Scene"
import "../IS"
import "../Entities"
import "../Physic"

Item {
  id: level

  Background {
    anchors.horizontalCenter:   parent.horizontalCenter
    y:                          scene.gameWindowAnchorItem.y+scene.gameWindowAnchorItem.height-height
  }

  Body {
    x:                          scene.gameWindowAnchorItem.x
    y:                          scene.gameWindowAnchorItem.y-20
    width:                      scene.gameWindowAnchorItem.width
    height:                     20
  }

  Body {
    y:                          grass.y
    x:                          scene.gameWindowAnchorItem.x
    width:                      scene.gameWindowAnchorItem.width
    height:                     20
  }

  Pipes {
    id:                         pipes1
    delay:                      0
  }

  Pipes {
    id:                         pipes2
    delay:                      1.5
  }

  Grass {
    id:                         grass
    anchors.horizontalCenter:   parent.horizontalCenter
    y:                          scene.gameWindowAnchorItem.y + scene.gameWindowAnchorItem.height - height
  }

  function reset() {
    pipes1.reset()
    pipes2.reset()
    grass.reset()
  }

  function stop() {
    pipes1.stop()
    pipes2.stop()
    grass.stop()
  }

  function start() {
    pipes1.start()
    pipes2.start()
  }
}
