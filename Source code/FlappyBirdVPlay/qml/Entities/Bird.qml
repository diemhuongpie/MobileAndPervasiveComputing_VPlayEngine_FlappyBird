import VPlay 2.0
import QtQuick 2.0

EntityBase {
  id: player
  entityType: "player"

  property real upwardforce:    -280
  property int  resetX:         0000
  property int  resetY:         0000

  width:        spriteBird.width
  height:       spriteBird.height

  signal gameOver()

  Component.onCompleted: reset()

  SpriteSequenceVPlay {
    id: spriteBird

    anchors.centerIn: parent

    SpriteVPlay {
      name: "idle"
      frameCount:   3
      frameRate:    10

      frameWidth:   34
      frameHeight:  24
      source: "../../assets/image/birdSprite.png"
    }
  }

  CircleCollider {
    id:                 bounding

    radius:             spriteBird.height/2
    anchors.centerIn:   parent

    bodyType:           Body.Dynamic
  }

  function reset() {
    spriteBird.x                    = resetX
    spriteBird.y                    = resetY
    bounding.body.linearVelocity    = Qt.point(0,0)
    spriteBird.running              = true
  }

  function push() {
    /*audioManager.play(audioManager.WING)*/
    bounding.body.linearVelocity    = Qt.point(0,0)
    var localForwardVector          = bounding.body.toWorldVector(Qt.point(0, upwardforce));
    bounding.body.applyLinearImpulse(localForwardVector, bounding.body.getWorldCenter());
  }

  onGameOver: {
  spriteBird.running                = false
  }
}
