import UIKit

class FilmDetailsScreenVC: UIViewController {
    
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    
    let customView = RoundedView()
    
    private let backgroundImageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFill
        iv.image = UIImage(named: "Spider")
        return iv
    }()
    
    private let blurView: UIVisualEffectView = {
        let blurEffect = UIBlurEffect(style: .dark)
        let view = UIVisualEffectView(effect: blurEffect)
        view.layer.cornerRadius = 20
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let filmsImageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.layer.cornerRadius = 30
        iv.clipsToBounds = true
        iv.contentMode = .scaleAspectFill
        iv.image = UIImage(named: "Spider")
        return iv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        view.backgroundColor = .blue
        
        // background + blur
        view.addSubview(backgroundImageView)
        view.addSubview(blurView)
        
        // scrollView hierarchy
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        blurView.contentView.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        // content subviews
        contentView.addSubview(filmsImageView)
        
        customView.translatesAutoresizingMaskIntoConstraints = false
        customView.backgroundColor = .systemBlue
        contentView.addSubview(customView)
        contentView.addSubview(textView)
        
        // Constraints
        NSLayoutConstraint.activate([
            // background
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            blurView.topAnchor.constraint(equalTo: view.topAnchor),
            blurView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            blurView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            blurView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            // scrollView
            scrollView.topAnchor.constraint(equalTo: blurView.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: blurView.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: blurView.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: blurView.bottomAnchor),
            
            // contentView
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            // filmsImageView
            filmsImageView.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 10),
            filmsImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            filmsImageView.widthAnchor.constraint(equalToConstant: 300),
            filmsImageView.heightAnchor.constraint(equalToConstant: 450),
            
            // customView
            customView.topAnchor.constraint(equalTo: filmsImageView.bottomAnchor, constant: 10),
            customView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            //customView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            customView.widthAnchor.constraint(equalToConstant: 300),
            customView.heightAnchor.constraint(equalToConstant: 70),
            
            textView.topAnchor.constraint(equalTo: customView.bottomAnchor, constant: 20),
            textView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            //textView.widthAnchor.constraint(equalToConstant: 300),
            textView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            textView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
            textView.heightAnchor.constraint(equalToConstant: 400),
            textView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20) // критически важно!
        ])
    }
    
    private func makeTestView(color: UIColor) -> UIView {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = color
        v.layer.cornerRadius = 16
        return v
    }
    
    private let textView: UITextView = {
        let textView: UITextView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.contentInsetAdjustmentBehavior = .automatic
        //textView.center = self.view.center
        textView.textAlignment = NSTextAlignment.justified
        textView.textColor = UIColor.blue
        textView.backgroundColor = UIColor.lightGray
        textView.font = UIFont.systemFont(ofSize: 20)
        textView.textColor = UIColor.white
        textView.font = UIFont.boldSystemFont(ofSize: 20)
        textView.font = UIFont(name: "Verdana", size: 17)
        textView.isEditable = false
        textView.autocapitalizationType = UITextAutocapitalizationType.allCharacters
        textView.isSelectable = true
        textView.dataDetectorTypes = UIDataDetectorTypes.link
        textView.layer.cornerRadius = 10
        textView.autocorrectionType = UITextAutocorrectionType.yes
        textView.spellCheckingType = UITextSpellCheckingType.yes
        textView.text = "dslknzlkanlvnaldsnvalvnlanlvnaldnvladnvlandlvlanvladnvlkandskvnaklsdnvlkansdvlnalsdvnlakdnvlanvlanvlana;lanldnvafvnsgbbvuebvuebrvauklvrbuvakervbalkrjbkuvbkevbakrvrvuabjanjnrufnnvajrnvubvanrlarvurbvkardslknzlkanlvnaldsnvalvnlanlvnaldnvladnvlandlvlanvladnvlkandskvnaklsdnvlkansdvlnalsdvnlakdnvlanvlanvlana;lanldnvafvnsgbbvuebvuebrvauklvrbuvakervbalkrjbkuvbkevbakrvrvuabjanjnrufnnvajrnvubvanrlarvurbvkardslknzlkanlvnaldsnvalvnlanlvnaldnvladnvlandlvlanvladnvlkandskvnaklsdnvlkansdvlnalsdvnlakdnvlanvlanvlana;lanldnvafvnsgbbvuebvuebrvauklvrbuvakervbalkrjbkuvbkevbakrvrvuabjanjnrufnnvajrnvubvanrlarvurbvkar"
        return textView
    }()
    
    func configure(image: String, title: String, description: String) {
        backgroundImageView.image = UIImage(named: image)
        filmsImageView.image = UIImage(named: image)
        textView.text = description
    }
}
