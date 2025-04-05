import UIKit

class filmDetailsScreenVC: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        
    }
    
    private let backgroundImageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    
    private let blurView: UIVisualEffectView = {
        let view = UIVisualEffectView()
        view.layer.cornerRadius = 20
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    func setupView() {
        view.backgroundColor = .blue
        backgroundImageView.image = UIImage(named: "colisium")
        view.addSubview(backgroundImageView)
        
        let blurEffect = UIBlurEffect(style: .light)
        view.addSubview(blurView)
        blurView.effect = blurEffect
        
        backgroundImageView.addSubview(blurView)
        addConstraints()
    }
    
    func addConstraints() {
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            backgroundImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            
            
            blurView.centerXAnchor.constraint(equalTo: backgroundImageView.centerXAnchor),
            blurView.centerYAnchor.constraint(equalTo: backgroundImageView.centerYAnchor),
            blurView.heightAnchor.constraint(equalToConstant: 350),
            blurView.widthAnchor.constraint(equalToConstant: 350),
//            addCityButton.widthAnchor.constraint(equalToConstant: 130),
//
//            locationView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
//            locationView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            locationView.widthAnchor.constraint(equalToConstant: 150),
//            locationView.heightAnchor.constraint(equalToConstant: 40),
//
//            locationLabel.centerXAnchor.constraint(equalTo: locationView.centerXAnchor),
//            locationLabel.centerYAnchor.constraint(equalTo: locationView.centerYAnchor),
//
//            weatherImgView.topAnchor.constraint(equalTo: locationLabel.bottomAnchor, constant: 50),
//            weatherImgView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            weatherImgView.widthAnchor.constraint(equalToConstant: 150),
//            weatherImgView.heightAnchor.constraint(equalToConstant: 150),
//
//            temperatureLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            temperatureLabel.topAnchor.constraint(equalTo: weatherImgView.bottomAnchor, constant: 20),
//
//            weatherMeaningLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            weatherMeaningLabel.topAnchor.constraint(equalTo: temperatureLabel.bottomAnchor, constant: 10),
//
//            weatherGraphView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            weatherGraphView.topAnchor.constraint(equalTo: weatherMeaningLabel.bottomAnchor, constant: 10),
//            weatherGraphView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
//            weatherGraphView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
//            weatherGraphView.heightAnchor.constraint(equalToConstant: 200),
//
//            segmentedControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            segmentedControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
//            segmentedControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
//            segmentedControl.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
//            segmentedControl.heightAnchor.constraint(equalToConstant: 40),
//            segmentedControl.widthAnchor.constraint(equalToConstant: 350)
            
        ])
    }
    
}
