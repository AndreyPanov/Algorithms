//https://leetcode.com/problems/flood-fill/

import XCTest

final class FloodFill: XCTestCase {

    func testExample() throws {
        //XCTAssertEqual([[2,2,2],[2,2,0],[2,0,1]], floodFill([[1,1,1],[1,1,0],[1,0,1]], 1, 1, 2))
        XCTAssertEqual([[0,0,0],[0,0,0]], floodFill([[0,0,0],[0,0,0]], 0, 0, 0))
    }
    
    func floodFill(_ image: [[Int]], _ sr: Int, _ sc: Int, _ color: Int) -> [[Int]] {
        
        func dfs(_ image: inout [[Int]], _ sr: Int, _ sc: Int, _ row: Int, _ col: Int, _ source: Int, _ color: Int) {
            guard sr < row && sc < col && sr >= 0 && sc >= 0 else { return } //out of bounds
            guard image[sr][sc] == source else { return } // infinite loop
            
            print("coordinates: \(sr), \(sc), value: \(image[sr][sc]), changed to \(color)")
            image[sr][sc] = color
            dfs(&image, sr+1, sc, row, col, source, color) //left
            dfs(&image, sr-1, sc, row, col, source, color) //right
            dfs(&image, sr, sc+1, row, col, source, color) //top
            dfs(&image, sr, sc-1, row, col, source, color) //bottom
        }
        
        let source = image[sr][sc]
        if source == color {
            return image
        }
        let row = image.count
        let col = image[0].count
        var image = image
        print("source: \(source)")
        print("row: \(row)")
        print("col: \(col)")
        dfs(&image, sr, sc, row, col, source, color)
        return image
    }
}
