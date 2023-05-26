
import Foundation

class Rover {
    private var x = 0
    private var y = 0

    private let board: [[Int]]

    init(x: Int, y: Int, board: [[Int]]) {
        self.x = x
        self.y = y
        self.board = board
    }

    private var boardLength: Int { board.count - 1 }
    private var boardWidth: Int { board.first!.count - 1 }

    func execute(commands: String) -> String {
        for command in commands {
            switch command {
            case "R":
                if x == boardWidth {
                    if board[y][0] == 1 {
                        return obstacleAt(0, y)
                    }
                    x = 0
                } else {
                    if board[y][x + 1] == 1 {
                        return obstacleAt(x + 1, y)
                    }
                    x += 1
                }

            case "L":
                if x == 0 {
                    if board[y][boardWidth] == 1 {
                        return obstacleAt(boardWidth, y)
                    }
                    x = boardWidth
                } else {
                    if board[y][x - 1] == 1 {
                        return obstacleAt(x - 1, y)
                    }
                    x -= 1
                }

            case "F":
                if y == boardLength {
                    if board[0][x] == 1 {
                        return obstacleAt(x, 0)
                    }
                    y = 0
                } else {
                    if board[y + 1][x] == 1 {
                        return obstacleAt(x, y + 1)
                    }
                    y += 1
                }

            case "B":
                if y == 0 {
                    if board[boardLength][x] == 1 {
                        return obstacleAt(x, boardLength)
                    }
                    y = boardLength
                } else {
                    if board[y - 1][x] == 1 {
                        return obstacleAt(x, y - 1)
                    }
                    y -= 1
                }

            default:
                return "Invalid command '\(command)'"
            }
        }

        return "Rover at \(x):\(y)"
    }

    private func obstacleAt(_ ox: Int, _ oy: Int) -> String {
        return "Obstacle at (\(ox):\(oy)) - Rover at (\(x):\(y))"
    }
}
