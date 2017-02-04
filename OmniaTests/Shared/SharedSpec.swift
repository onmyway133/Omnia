import Omnia
import Quick
import Nimble

class SharedSpec: QuickSpec {

  override func spec() {
    describe("Shared") {
      describe("test") {
        it("passes") {
          expect(true).to(beTrue())
        }
      }
    }

    describe("Math") {
      describe("prime") {
        it("passes") {
          expect(Math.isPrime(number: 0)).to(beFalse())
          expect(Math.isPrime(number: 1)).to(beFalse())
          expect(Math.isPrime(number: 2)).to(beFalse())
          expect(Math.isPrime(number: 3)).to(beTrue())
        }
      }
    }
  }
}
