import Omnia
import Quick
import Nimble

class SharedSpec: QuickSpec {

  override func spec() {
    describe("Shared") {
      describe("test") {
        it("passes") {
          print(Emoji.flag("NO"))
          print(Emoji.standardName("🇳🇴"))
          print(Emoji.list())
          print(Emoji.search(["GRINNING"]))
          expect(true).to(beTrue())
        }
      }
    }
  }
}
