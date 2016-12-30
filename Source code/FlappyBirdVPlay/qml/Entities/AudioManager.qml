import VPlay 2.0
import QtQuick 2.0

Item {
  id:           audioManager

  property int  DIE:        11
  property int  HIT:        22
  property int  POINT:      33
  property int  SWOOSHING:  44
  property int  WING:       55


  function play(clipID) {

    switch(clipID) {
    case DIE:
      die.play()
      break
    case HIT:
      hit.play()
      break
    case POINT:
      point.play()
      break
    case SWOOSHING:
      swoosh.play()
      break
    case WING:
      wing.play()
      break
    }
  }


  SoundEffectVPlay {
    id: die
    source: "../../assets/audio/sfx_die.wav"
  }
  SoundEffectVPlay {
    id: hit
    source: "../../assets/audio/sfx_hit.wav"
  }
  SoundEffectVPlay {
    id: point
    source: "../../assets/audio/sfx_point.wav"
  }
  SoundEffectVPlay {
    id: swoosh
    source: "../../assets/audio/sfx_swooshing.wav"
  }
  SoundEffectVPlay {
    id: wing
    source: "../../assets/audio/sfx_wing.wav"
  }
}
