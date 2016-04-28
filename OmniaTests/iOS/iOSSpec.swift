import Omnia
import Quick
import Nimble
import UIKit

class iOSSpec: QuickSpec {

  override func spec() {
    describe("iOS") {
      describe("test") {
        it("passes") {
          let _ = UIColor.Farge.hummingBird

          Warlock.swizzleInstance(UIViewController.self, original: #selector(UIViewController.viewDidLoad)) {
            print("your swizzled implementation goes here")
          }

          let throttle = Throttle(interval: 0.5, actionBlock: {
            print("action goes here")
          })

          throttle.fire()
          throttle.fire()

          Hourglass.every(1) {
            print("code run every 1 second")
          }

          Performer.on(.background) {

          }.delay(2) {
              
          }

          expect(true).to(beTrue())
        }
      }
    }
  }
}
