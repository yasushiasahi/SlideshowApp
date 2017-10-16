import UIKit

class ViewController: UIViewController {

	@IBOutlet weak var startPauseButton: UIButton!
	@IBOutlet weak var imageButton: UIButton!
	
	let PPP: [UIImage] = [UIImage(named:"penguin1")!,
	                      UIImage(named:"penguin2")!,
	                      UIImage(named:"penguin3")!,
	                      UIImage(named:"penguin4")!,
	                      UIImage(named:"penguin5")!
	]
	var currentArrayNum: Int = 0
	var maxArrayNum: Int = 0
	
	var timer: Timer!

	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		maxArrayNum = PPP.count - 1
		imageButton.setBackgroundImage(PPP[currentArrayNum], for: .normal)
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
	}
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		let image: UIImage = PPP[currentArrayNum]
		let bigImageViewController: BigImageViewController = segue.destination as! BigImageViewController
		bigImageViewController.image = image
	}
	
	
	@IBAction func nextButton(_ sender: Any) {
		if self.timer == nil {
			moveImage(direction: "forward")
		}
	}
	
	@IBAction func prevButton(_ sender: Any) {
		if self.timer == nil {
			moveImage(direction: "backward")
		}
	}
	
	@IBAction func startPauseButton(_ sender: Any) {
		if self.timer == nil {
			self.timer = Timer.scheduledTimer(timeInterval: 1.0,
			                                  target: self,
			                                  selector: #selector(playImage),
			                                  userInfo: nil,
			                                  repeats: true)
			startPauseButton.setTitle("停止", for: .normal)
		} else {
			self.timer.invalidate()
			self.timer = nil
			startPauseButton.setTitle("再生", for: .normal)
		}
	}
	
	@objc func playImage(timer: Timer) {
		moveImage(direction: "forward")
	}
	
	func moveImage(direction: String) {
		if direction == "forward" {
			if currentArrayNum < maxArrayNum {
				currentArrayNum += 1
			} else {
				currentArrayNum = 0
			}
		} else if direction == "backward" {
			if currentArrayNum != 0 {
				currentArrayNum -= 1
			} else {
				currentArrayNum = maxArrayNum
			}
		}
		print(currentArrayNum)
		imageButton.setBackgroundImage(PPP[currentArrayNum], for: .normal)
	}
	
	@IBAction func unwind(_ segue: UIStoryboardSegue) {
	}

	
}

