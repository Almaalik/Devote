//
//  SoundPlayer.swift
//  Devote
//
//  Created by Abdul Maalik on 16/09/23.
//

import Foundation
import AVFoundation

var audioPlayer: AVAudioPlayer?

func playSound(sound: String, type: String) {
    if let path = Bundle.main.path(forResource: sound, ofType: type) {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            audioPlayer?.play()
        } catch {
            print("Could not find and play audio")
        }
    }
}
