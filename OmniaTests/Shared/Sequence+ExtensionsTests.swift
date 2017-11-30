import XCTest
import Omnia

class Sequence_ExtensionsTests: XCTestCase {

  func testShuffle() {
    do {
      let array = [1]
      XCTAssertEqual(array.e_shuffled().count, 1)
    }

    do {
      let array = Array(0..<10_000)
      let _ = array.e_shuffled()
    }
  }
}
