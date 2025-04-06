import UIKit

class FilmDetailsScreenVC: UIViewController {

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
    
    private let filmsImageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.layer.cornerRadius = 30
        iv.clipsToBounds = true
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
        backgroundImageView.image = UIImage(named: "Spider")
        view.addSubview(backgroundImageView)
        
        let blurEffect = UIBlurEffect(style: .dark)
        view.addSubview(blurView)
        blurView.effect = blurEffect
        backgroundImageView.addSubview(blurView)
        
        filmsImageView.image = UIImage(named: "Spider")
        blurView.contentView.addSubview(filmsImageView)
        
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
            
            blurView.bottomAnchor.constraint(equalTo: backgroundImageView.bottomAnchor),
            blurView.leadingAnchor.constraint(equalTo: backgroundImageView.leadingAnchor),
            blurView.trailingAnchor.constraint(equalTo: backgroundImageView.trailingAnchor),
            blurView.centerXAnchor.constraint(equalTo: backgroundImageView.centerXAnchor),
            blurView.centerYAnchor.constraint(equalTo: backgroundImageView.centerYAnchor),
            
            filmsImageView.topAnchor.constraint(equalTo: blurView.safeAreaLayoutGuide.topAnchor),
            filmsImageView.centerXAnchor.constraint(equalTo: blurView.centerXAnchor),
            filmsImageView.widthAnchor.constraint(equalToConstant: 300),
            filmsImageView.heightAnchor.constraint(equalToConstant: 450),
 
        ])
    }
    
}
