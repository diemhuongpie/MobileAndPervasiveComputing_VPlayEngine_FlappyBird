import VPlay 2.0
import QtQuick 2.0
import "../Entities"

EntityBase {
  id: pipe
  entityId: "pipe"

  // size gate
  property int                  sizeGate:             90

  // distance between each other pipe
  property int                  distanceGate:         90

  property double               delay:                0

  MultiResolutionImage {
    id:                         upperPipe
    source: "../../assets/image/pipe_green.png"

    // inverted
    mirrorY:                    true
  }
  MultiResolutionImage {
    id:                         downerPipe
    y:                          height+sizeGate
    source: "../../assets/image/pipe_green.png"
  }

  width:                        upperPipe.width
  height:                       upperPipe.height+sizeGate+downerPipe.height

  BoxCollider {
    id:                         colliderWithUpperPipe
    width:                      upperPipe.width
    height:                     upperPipe.height
    anchors.centerIn:           upperPipe
    bodyType:                   Body.Static
    collisionTestingOnlyMode:   true
    fixture.onBeginContact: {
    player.gameOver()
    }
  }

  BoxCollider {
    id:                         checkColltionGateway
    width:                      10
    height:                     sizeGate
    y:                          downerPipe.height
    x:                          downerPipe.width/2
    bodyType:                   Body.Static
    collisionTestingOnlyMode:   true
    fixture.onBeginContact: {
      gameScene.score++
      /*audioManager.play(audioManager.POINT)*/
    }
  }

  BoxCollider {
    id:                         colliderWithDownerPipe
    width:                      downerPipe.width
    height:                     downerPipe.height
    anchors.centerIn:           downerPipe
    bodyType:                   Body.Static
    collisionTestingOnlyMode:   true
    fixture.onBeginContact: {
    player.gameOver()
    }
  }

  MovementAnimation {
    id:         animation
    target:     parent

    property: "x"
    velocity:   -150

    running:    false

    // reset when posotion of pipe is outsize of screen.
    minPropertyValue: scene.gameWindowAnchorItem.x-pipe.width
    onLimitReached: {
      reset()
    }
  }

  Timer {
    id:             timeDelay
    interval:       delay*1000
    repeat:         false
    onTriggered: {
      animation.start()
    }
  }

  function rand(minimum, maximum) {
    return Math.random()*(maximum-minimum) + minimum
  }

  function reset() {
    pipe.x = scene.gameWindowAnchorItem.width + pipe.width/2
    pipe.y = rand(-distanceGate, distanceGate)- scene.height/3
  }

  function start() {
    timeDelay.restart()
  }

  function stop() {
    animation.stop()
    timeDelay.stop()
  }

  Component.onCompleted: {
    reset()
  }
}
