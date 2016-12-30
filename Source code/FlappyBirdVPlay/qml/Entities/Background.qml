import VPlay 2.0
import QtQuick 2.0

Item {
  MultiResolutionImage {
    id:     background
    source: "../../assets/image/bg.png"
  }

  width:    background.width
  height:   background.height

  MultiResolutionImage {
    id:     rotor
    source: "../../assets/image/rotor.png"
    x:      178
    y:      318
  }

  MovementAnimation {
    target:     rotor
    property: "rotation"
    velocity:   90
    running:    true
  }
}
