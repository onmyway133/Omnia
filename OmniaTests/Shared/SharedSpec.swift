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

      describe("greatest common divisor") {
        it("passes") {
          expect(Math.greatestCommonDivisor(a: 0, b: 1)).to(equal(1))
          expect(Math.greatestCommonDivisor(a: 2, b: 6)).to(equal(2))
        }
      }
    }
  }
}
