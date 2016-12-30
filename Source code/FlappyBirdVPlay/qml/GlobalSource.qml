import VPlay 2.0
import QtQuick 2.0

import "Entities"
import "Scene"
import "Physic"
import "IS"
import "Control"

Item {
  id:                               sourceEntry

  //property alias    audioManager:   audioManager
  property alias    entityManager:  entityManager


  property int      coins

  MenuScene {
    id: menuScene
    onGamePressed: {
      sourceEntry.state = "game"
    }
    onBackButtonPressed: {
      nativeUtils.displayMessageBox("Really quit the game?", "", 2);
    }
  }

  GamePlayScene {
    id: gameScene

    onMenuPressed: {
      mainItem.state = "menu"
    }
  }

  EntityManager {
    id: entityManager
    // entities shall only be created in the gameScene
    entityContainer: gameScene.entityContainer
  }

  /*AudioManager {
    id: audioManager
  }*/

  state: "menu"

  states: [
    State {
      name: "menu"
      PropertyChanges {target: menuScene; opacity: 1}
      PropertyChanges {target: window; activeScene: menuScene}
      /*StateChangeScript {
        script: {
          audioManager.play(audioManager.SWOOSHING)
        }
      }*/
    },
    State {
      name: "game"
      PropertyChanges {target: gameScene; opacity: 1}
      PropertyChanges {target: window; activeScene: gameScene}
      StateChangeScript {
        script: {
          gameScene.enterScene()
          /*audioManager.play(audioManager.SWOOSHING)*/
        }
      }
    }
  ]
}
