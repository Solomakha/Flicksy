import UIKit

class SearchTableViewCell: UITableViewCell {
    
    private let searchResultsView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        //change view.backgroundColor
        view.backgroundColor = UIColor(red: 27/255, green: 29/255, blue: 42/255, alpha: 1)
        view.layer.cornerRadius = 20
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.15
        view.layer.shadowOffset = CGSize(width: 0, height: 4)
        view.layer.shadowRadius = 8
        return view
    }()
    
    private func setupContainer(imageView: UIImageView, descriptionStackView: UIStackView) -> UIStackView {
        let stackView = UIStackView(arrangedSubviews: [imageView, descriptionStackView])
        stackView.axis = .horizontal
        stackView.spacing = 8
        stackView.alignment = .center
        return stackView
    }
    
    private let movieImageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.layer.cornerRadius = 10
        iv.layer.masksToBounds = true
        iv.widthAnchor.constraint(equalToConstant: 70).isActive = true
        iv.heightAnchor.constraint(equalToConstant: 150).isActive = true
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    private lazy var movieDetailsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 5
        stackView.alignment = .leading
        stackView.distribution = .fillProportionally
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let movieTitle: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        label.textColor = .white
        label.textAlignment = .left
        return label
    }()
    
    private let movieRelease: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        label.textColor = .white
        label.textAlignment = .left
        return label
    }()
    
    private let moviePopularity: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.textColor = UIColor(white: 1, alpha: 0.6)
        label.textAlignment = .left
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        contentView.backgroundColor = .clear
        
        contentView.addSubview(searchResultsView)
        
        movieDetailsStackView.addArrangedSubview(movieTitle)
        movieDetailsStackView.addArrangedSubview(movieRelease)
        movieDetailsStackView.addArrangedSubview(moviePopularity)
        
        let homeStack = setupContainer(imageView: movieImageView, descriptionStackView: movieDetailsStackView)
        homeStack.translatesAutoresizingMaskIntoConstraints = false
        
        searchResultsView.addSubview(homeStack)
        
        NSLayoutConstraint.activate([
            
            homeStack.topAnchor.constraint(equalTo: searchResultsView.topAnchor, constant: 10),
            homeStack.bottomAnchor.constraint(equalTo: searchResultsView.bottomAnchor, constant: -10),
            homeStack.leadingAnchor.constraint(equalTo: searchResultsView.leadingAnchor, constant: 10),
            homeStack.trailingAnchor.constraint(equalTo: searchResultsView.trailingAnchor, constant: -10),
            
            searchResultsView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            searchResultsView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            searchResultsView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            searchResultsView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(filmTitle: String, filmRelease: String, filmPopularity: String) {
        movieTitle.text = filmTitle
        movieRelease.text = filmRelease
        moviePopularity.text = filmPopularity
    }
    
}
