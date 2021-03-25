//
//  SeededGenerator.swift
//  NeatoTest
//
//  Created by Arcangelo Pisa on 25/03/21.
//

import UIKit
import GameKit

struct SeededGenerator : RandomNumberGenerator {

    mutating func next() -> UInt64 {
        let next1 = UInt64(bitPattern: Int64(gameKitRandom.nextInt()))
        let next2 = UInt64(bitPattern: Int64(gameKitRandom.nextInt()))
        return next1 ^ (next2 << 32)
    }

    init(seed: UInt64) {
        self.gameKitRandom = GKMersenneTwisterRandomSource(seed: seed)
    }

    private let gameKitRandom: GKRandom
}
