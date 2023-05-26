
import XCTest
@testable import MarsRoverMac

final class MarsRoverMacTests: XCTestCase {
    
    func testRoverRightAndLeft() {
        let mockBoard = [
            [0, 0, 0, 0, 0, 0, 0, 1],
            [1, 0, 1, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0, 0, 1],
            [0, 0, 0, 0, 1, 0, 0, 0],
            [0, 0, 0, 0, 0, 0, 0, 0],
            [0, 1, 0, 0, 0, 1, 0, 0],
            [0, 0, 0, 0, 0, 0, 0, 0],
            [0, 0, 0, 1, 0, 0, 0, 0]
        ]

        let tests: [(commands: String, expected: String)] = [
            ("", finalDestination(0, 0)),
            ("R", finalDestination(1, 0)),
            ("RRL", finalDestination(1, 0)),
            ("RFFFLLL", finalDestination(6, 3)),
            ("RRRRRRFFFRR", finalDestination(0, 3)),
            ("RRRRRRFFFFFFFF", finalDestination(6, 0)),
            ("B", finalDestination(0, 7)),
            ("F", obstacleAt(ox: 0, oy: 1, rx: 0, ry: 0)),
            ("L", obstacleAt(ox: 7, oy: 0, rx: 0, ry: 0)),
            ("RFL", obstacleAt(ox: 0, oy: 1, rx: 1, ry: 1)),
            ("RRRB", obstacleAt(ox: 3, oy: 7, rx: 3, ry: 0)),
            ("RFFRB", obstacleAt(ox: 2, oy: 1, rx: 2, ry: 2)),
            ("RRRRRRFFFFFFFRF", obstacleAt(ox: 7, oy: 0, rx: 7, ry: 7)),
            ("RRRRRRFRR", obstacleAt(ox: 0, oy: 1, rx: 7, ry: 1)),
            ("RFFX", "Invalid command 'X'")
        ]

        for test in tests {
            let rover = Rover(x: 0, y: 0, board: mockBoard)
            let position = rover.execute(commands: test.commands)

            XCTAssertEqual(position, test.expected)
        }
    }

    private func finalDestination(_ x: Int, _ y: Int) -> String {
        "Rover at \(x):\(y)"
    }

    private func obstacleAt(ox: Int, oy: Int, rx: Int, ry: Int) -> String {
        "Obstacle at (\(ox):\(oy)) - Rover at (\(rx):\(ry))"
    }

}
