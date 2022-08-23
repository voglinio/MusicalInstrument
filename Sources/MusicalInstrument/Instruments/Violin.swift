//  Violin.swift
//
//  Copyright © 2022 live77. All rights reserved.

import Foundation
import MusicSymbol
import AVFoundation

/// violin
public class Violin: MusicalInstrument {
    
    @discardableResult public func play(at pitch: Pitch, with option: NotePlayingOption) -> MusicalInstrument {
        controller.play(at: pitch, with: option.noteOnVelocity)
        return self
    }
    
    @discardableResult public func stop(at pitch: Pitch) -> MusicalInstrument {
        controller.stop(at: pitch)
        return self
    }
    
    public func adjust(with option: InstrumentControlOption) {
        switch option {
        case .pressure(let pressure):
            controller.sendPressure(pressure: pressure)
        case .volume(let volume):
            controller.sendController(SamplerController.VOLUME_CONTROL, withValue: volume)
        }
    }

    public func stopAll() {
        controller.stopAll()
    }
    
    public func name() -> String {
        return "Violin"
    }

    public func type() -> InstrumentFamily {
        return .strings
    }

    public init(sampler: AVAudioUnitSampler) {
        self.controller = SamplerController(sampler: sampler)
    }
    
    /// default, easy to use Violine
    public static var `default` : Violin = {
        let engine = AudioEngine.default
        let sampler = engine.sampler(.strings)!
        return Violin(sampler: sampler)
    }()

    /// private
    private let controller: SamplerController
}
