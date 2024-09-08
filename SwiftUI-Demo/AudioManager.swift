//
//  AudioManager.swift
//  SwiftUI-Demo
//
//  Created by Manjit Bedi on 2024-09-08.
//

import AVFoundation


class AudioManager {
    static var player: AVAudioPlayer!

    class func playWinSpeech() {
        // Create an utterance.
        let utterance = AVSpeechUtterance(string: "Woo hoo")

        // Retrieve the British English voice.
        let voice = AVSpeechSynthesisVoice()

        // Assign the voice to the utterance.
        utterance.voice = voice

        // Create a speech synthesizer.
        let synthesizer = AVSpeechSynthesizer()

        // Tell the synthesizer to speak the utterance.
        synthesizer.speak(utterance)
    }

    class func playLoseSpeech() {
        // Create an utterance.
        let utterance = AVSpeechUtterance(string: "Oh noes")

        // Retrieve the British English voice.
        let voice = AVSpeechSynthesisVoice()

        // Assign the voice to the utterance.
        utterance.voice = voice

        // Create a speech synthesizer.
        let synthesizer = AVSpeechSynthesizer()

        // Tell the synthesizer to speak the utterance.
        synthesizer.speak(utterance)
    }

    private class func playSound(url: URL) {
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch {
            print("Error playing sound: \(error.localizedDescription)")
        }
    }

    class func playBuzzerSound() {
        guard let path = Bundle.main.path(forResource: "bbc_buzzer", ofType: "mp3") else {
            print("Sound file not found")
            return
        }
        
        let url = URL(fileURLWithPath: path)
        playSound(url: url)

    }

    class func playDingDingSound() {
        guard let path = Bundle.main.path(forResource: "ding-ding", ofType: "mp3") else {
            print("Sound file not found")
            return
        }

        let url = URL(fileURLWithPath: path)
        playSound(url: url)
    }
}
