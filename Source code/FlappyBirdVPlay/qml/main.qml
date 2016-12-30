import VPlay 2.0
import QtQuick 2.0
import "Scene"
import "Entities"
import "IS"
import "Control"
import "Physic"

GameWindow {
  id:                       window
  width:                    640
  height:                   960

  property alias window:    window

  LoadingScene {
    id:                     loadingScreen
  }
  // set first scene is Loading Screen
  activeScene:              loadingScreen

  Component.onCompleted: {
    loadingScreen.opacity = 1
    getSource.start()
  }

  //we delay the loading of the game until image load is fully displayed for sure
  Timer {
    id: getSource
    interval: 500
    onTriggered: {
      loadSource.source = "GlobalSource.qml"
    }
  }

  // as soon as we set the source property, the loader will load the game
  Loader {
    id: loadSource
    onLoaded: {
      if(item) {
        hideLoadingScreen.start()
      }
    }
  }

  // give the game a little time to fully display before hiding the scene LoadingScene
  // just to be sure it looks smooth also on low-end devices
  Timer {
    id: hideLoadingScreen
    interval: 200
    onTriggered: {
      loadingScreen.opacity = 0
    }
  }
}
