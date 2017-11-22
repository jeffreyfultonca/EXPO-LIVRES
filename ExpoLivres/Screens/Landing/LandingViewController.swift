import UIKit

class LandingViewController: UIViewController {

    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var logoImageView: UIImageView!
    
    @IBOutlet weak var frenchButton: LandingPageGradientButton!
    @IBOutlet weak var englishButton: LandingPageGradientButton!
    
    override func viewDidDisappear(_ animated: Bool) {
        backgroundImageView.image = nil
        logoImageView.image = nil
    }
    
    override func viewWillAppear(_ animated: Bool) {
        backgroundImageView.image = UIImage(named: "LandingPageBackground")
        logoImageView.image = UIImage(named: "Logo")
    }
    
    deinit {
        print("LandingPageVC.deinit")
    }
    
    @IBAction func enterApplicationPressed(_ sender: AnyObject?) {
        performSegue(withIdentifier: "enterApplication", sender: sender)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Set lanuage
        if let senderButton = sender as? LandingPageGradientButton {
            LanguageService.currentLanguage = (senderButton == frenchButton) ? .french : .english
        }
    }
}
