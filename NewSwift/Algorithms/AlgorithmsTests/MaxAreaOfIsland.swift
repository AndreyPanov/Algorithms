//https://leetcode.com/problems/max-area-of-island/

import XCTest

final class MaxAreaOfIsland: XCTestCase {

    func testExample() throws {
        /*XCTAssertEqual(6, maxAreaOfIsland([[0,0,1,0,0,0,0,1,0,0,0,0,0],[0,0,0,0,0,0,0,1,1,1,0,0,0],
                                           [0,1,1,0,1,0,0,0,0,0,0,0,0],[0,1,0,0,1,1,0,0,1,0,1,0,0],
                                           [0,1,0,0,1,1,0,0,1,1,1,0,0],[0,0,0,0,0,0,0,0,0,0,1,0,0],
                                           [0,0,0,0,0,0,0,1,1,1,0,0,0],[0,0,0,0,0,0,0,1,1,0,0,0,0]])
        )*/
        XCTAssertEqual(0, maxAreaOfIsland([[0,0,0,0,0,0,0,0]]))
    }
    
    func maxAreaOfIsland(_ grid: [[Int]]) -> Int {
        func dfs(_ i: Int, _ j: Int, _ grid: [[Int]], _ visited: inout [[Bool]], _ row: Int, _ col: Int, _ count: inout Int) {
            guard i >= 0 && j >= 0 && i < row, j < col && !visited[i][j] && grid[i][j] != 0 else { return }
    
            count += 1
            visited[i][j] = true
            dfs(i+1, j, grid, &visited, row, col, &count)
            dfs(i-1, j, grid, &visited, row, col, &count)
            dfs(i, j+1, grid, &visited, row, col, &count)
            dfs(i, j-1, grid, &visited, row, col, &count)
        }
        
        var visited: [[Bool]] = Array(repeating: Array(repeating: false, count: grid[0].count), count: grid.count)
        let row = grid.count
        let col = grid[0].count
        var count = 0
        for i in 0..<grid.count {
            for j in 0..<grid[0].count {
                if grid[i][j] == 1 && !visited[i][j] {
                    var c = 0
                    dfs(i, j, grid, &visited, row, col, &c)
                    count = max(count, c)
                }
            }
        }
        return count
    }
}
