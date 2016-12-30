import VPlay 2.0
import QtQuick 2.0

Item {
  width: sprite.width
  height: sprite.height

  SpriteSequenceVPlay {
    id: sprite
    anchors.centerIn: parent

    SpriteVPlay {
      name: "running"

      frameCount:       3
      frameRate:        4

      frameWidth:       368
      frameHeight:      90
      source: "../../assets/image/landSprite.png"

    }
  }

  function reset() {
    sprite.running = true
  }

  function stop() {
    sprite.running = false
  }
}
