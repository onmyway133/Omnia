import Omnia
import Quick
import Nimble

class SharedSpec: QuickSpec {

  override func spec() {
    describe("Shared") {
      describe("test") {
        it("passes") {
          print(String(UnicodeScalar("🍟")))
          print(Emoji.flag("AX"))
          expect(true).to(beTrue())
        }
      }
    }
  }
}
