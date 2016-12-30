import VPlay 2.0
import QtQuick 2.0

EntityBase {
  entityType: "body"

  BoxCollider {
    width: parent.width
    height: parent.height
    bodyType: Body.Static
    fixture.onBeginContact: {
      player.gameOver()
    }
  }
}
