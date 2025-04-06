import UIKit

class SearchTableViewCell: UITableViewCell {

    private let matchView: UIView = {
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
    
    private lazy var containerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 12
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var matchStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 12
        stackView.alignment = .center
        stackView.distribution = .equalCentering
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private func homeTeamStackView(imageView: UIImageView, titleLabel: UILabel) -> UIStackView {
        let stackView = UIStackView(arrangedSubviews: [titleLabel, imageView])
        stackView.axis = .horizontal
        stackView.spacing = 8
        stackView.alignment = .center
        return stackView
    }
    
    private func awayTeamStackView(imageView: UIImageView, titleLabel: UILabel) -> UIStackView {
        let stackView = UIStackView(arrangedSubviews: [imageView, titleLabel])
        stackView.axis = .horizontal
        stackView.spacing = 8
        stackView.alignment = .center
        return stackView
    }
    
    private let homeCommandImageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.widthAnchor.constraint(equalToConstant: 45).isActive = true
        iv.heightAnchor.constraint(equalToConstant: 45).isActive = true
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    private let homeCommandTitle: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13, weight: .semibold)
        label.textColor = .white
        label.textAlignment = .right
        return label
    }()
    
    private let awayCommandImageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.widthAnchor.constraint(equalToConstant: 45).isActive = true
        iv.heightAnchor.constraint(equalToConstant: 45).isActive = true
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    private let awayCommandTitle: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13, weight: .semibold)
        label.textColor = .white
        label.textAlignment = .left
        return label
    }()
    
    private lazy var centerDataStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [timeLabel, dateLabel])
        stackView.axis = .vertical
        stackView.spacing = 4
        stackView.alignment = .center
        return stackView
    }()
    
    private let timeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.textColor = .white
        return label
    }()
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.textColor = UIColor(white: 1, alpha: 0.6)
        return label
    }()
    
    private let stadiumLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.textColor = UIColor(white: 1, alpha: 0.7)
        label.textAlignment = .center
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        contentView.backgroundColor = .clear
        
        contentView.addSubview(matchView)
        matchView.addSubview(containerStackView)
        
        let homeStack = homeTeamStackView(imageView: homeCommandImageView, titleLabel: homeCommandTitle)
        let awayStack = awayTeamStackView(imageView: awayCommandImageView, titleLabel: awayCommandTitle)
        
        matchStackView.addArrangedSubview(homeStack)
        matchStackView.addArrangedSubview(centerDataStackView)
        matchStackView.addArrangedSubview(awayStack)
        
        containerStackView.addArrangedSubview(matchStackView)
        containerStackView.addArrangedSubview(stadiumLabel)
        
        NSLayoutConstraint.activate([
            matchView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            matchView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            matchView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            matchView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            
            containerStackView.topAnchor.constraint(equalTo: matchView.topAnchor, constant: 12),
            containerStackView.bottomAnchor.constraint(equalTo: matchView.bottomAnchor, constant: -12),
            containerStackView.leadingAnchor.constraint(equalTo: matchView.leadingAnchor, constant: 16),
            containerStackView.trailingAnchor.constraint(equalTo: matchView.trailingAnchor, constant: -16),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(homeTeam: String) {
        homeCommandTitle.text = homeTeam
//        awayCommandTitle.text = awayTeam
//        homeCommandImageView.image = UIImage(named: homeTeamImage)
//        awayCommandImageView.image = UIImage(named: awayTeamImage)
//        timeLabel.text = time
//        dateLabel.text = date
//        stadiumLabel.text = "\(stadium), \(city)"
    }

}
