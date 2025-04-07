import UIKit

class SearchScreenVC: UIViewController {
    
    private var searchResults: [Result] = []
    private var searchController: UISearchController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func performSearch(query: String) {
        MovieService.shared.searchMovies(query: query) { [weak self ] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let movies):
                    self?.mainLabel.isHidden = true
                    self?.searchResultTable.isHidden = false
                    self?.searchResults = movies
                    self?.searchResultTable.reloadData()
                    
                    if movies.isEmpty {
                        self?.showNoResultsMessage()
                    } else {
                        self?.warningView.isHidden = true
                    }
                case .failure(let error):
                    print("❌ Ошибка: \(error.localizedDescription)")
                    self?.showNoResultsMessage()
                }
            }
        }
    }
    
    func showNoResultsMessage() {
        warningView.alpha = 0
        warningView.isHidden = false
        UIView.animate(withDuration: 0.3) {
            self.warningView.alpha = 1
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            UIView.animate(withDuration: 0.3) {
                self.warningView.alpha = 0
            } completion: { _ in
                self.warningView.isHidden = true
            }
        }
    }
    
    private let filtersButton: UIButton = {
        let filtersButton = UIButton()
        //Change backgroundColor
        filtersButton.backgroundColor = .green
        filtersButton.setImage(UIImage(systemName: "slider.horizontal.3"), for: .normal)
        filtersButton.layer.shadowColor = UIColor.black.cgColor
        filtersButton.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        filtersButton.layer.shadowOpacity = 1.0
        filtersButton.layer.shadowRadius = 0.0
        filtersButton.layer.masksToBounds = false
        filtersButton.layer.cornerRadius = 4
        
        filtersButton.widthAnchor.constraint(equalToConstant: 35).isActive = true
        filtersButton.heightAnchor.constraint(equalToConstant: 35).isActive = true
        return filtersButton
    }()
    
    private let searchResultTable: UITableView = {
        let searchResultTable = UITableView()
        searchResultTable.translatesAutoresizingMaskIntoConstraints = false
        searchResultTable.register(SearchTableViewCell.self, forCellReuseIdentifier: "cell")
        searchResultTable.separatorStyle = .none
        searchResultTable.backgroundColor = .clear // или любой другой
        return searchResultTable
    }()
    
    private let warningView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .gray
        view.layer.cornerRadius = 25
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.15
        view.layer.shadowOffset = CGSize(width: 0, height: 4)
        view.layer.shadowRadius = 8
        view.layer.masksToBounds = false
        view.heightAnchor.constraint(equalToConstant: 50).isActive = true
        view.isHidden = true
        return view
    }()
    
    private let warningLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Nothing found"
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    private let mainLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Search movies"
        label.textColor = .lightGray
        label.textAlignment = .center
        return label
    }()
    
    func setupView() {
        view.backgroundColor = .white
        view.addSubview(searchResultTable)
        view.addSubview(warningView)
        warningView.addSubview(warningLabel)
        view.addSubview(mainLabel)
        
        searchController = UISearchController(searchResultsController: nil)
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search..."
        searchController.searchResultsUpdater = self
        
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false // Оставляет строку видимой при скролле
        
        let rightItem = UIBarButtonItem(customView: filtersButton)
        navigationItem.rightBarButtonItem = rightItem
        
        searchResultTable.delegate = self
        searchResultTable.dataSource = self
        searchResultTable.isHidden = true
        
        addConstraints()
    }
    
    func addConstraints() {
        NSLayoutConstraint.activate([
            searchResultTable.topAnchor.constraint(equalTo: view.topAnchor, constant: 5),
            searchResultTable.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -5),
            searchResultTable.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            searchResultTable.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            searchResultTable.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            mainLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mainLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            warningLabel.topAnchor.constraint(equalTo: warningView.topAnchor, constant: 10),
            warningLabel.bottomAnchor.constraint(equalTo: warningView.bottomAnchor, constant: -10),
            warningLabel.leadingAnchor.constraint(equalTo: warningView.leadingAnchor, constant: 15),
            warningLabel.trailingAnchor.constraint(equalTo: warningView.trailingAnchor, constant: -15),
            
            warningView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            warningView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30),
            warningView.leadingAnchor.constraint(greaterThanOrEqualTo: view.leadingAnchor, constant: 40),
            warningView.trailingAnchor.constraint(lessThanOrEqualTo: view.trailingAnchor, constant: -40)
            
            
        ])
    }
}

extension SearchScreenVC: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        let query = searchController.searchBar.text ?? ""
        
        guard query.count >= 5 else {
            searchResults = []
            searchResultTable.reloadData()
            warningView.isHidden = true
            return
        }
        
        performSearch(query: query)
    }
}

extension SearchScreenVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchResults.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SearchTableViewCell
        let movie = searchResults[indexPath.row]
        cell.backgroundColor = .clear
        cell.configure(filmTitle: movie.title, filmRelease: String("\(movie.releaseDate.prefix(4)) year"), filmPopularity: String("★ \(movie.popularity)"))
        return cell
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        
        let toFavorite = UIContextualAction(style: .destructive, title: "") { (_, _, completionHandler) in
            print("Added to favorite \(indexPath.row)")
            completionHandler(true)
        }
        toFavorite.backgroundColor = .white
        toFavorite.image = makeSwipeButtonImage(color: .systemYellow, icon: "star.fill")
        
        return UISwipeActionsConfiguration(actions: [toFavorite])
    }
    
    func makeSwipeButtonImage(color: UIColor, icon: String) -> UIImage? {
        let size = CGSize(width: 80, height: 80) // Размер кнопки
        let renderer = UIGraphicsImageRenderer(size: size)
        
        return renderer.image { _ in
            let rect = CGRect(origin: .zero, size: size)
            
            // Закруглённая кнопка
            let path = UIBezierPath(roundedRect: rect, cornerRadius: 16)
            color.setFill()
            path.fill()
            
            // Добавляем системную иконку
            if let iconImage = UIImage(systemName: icon)?.withConfiguration(UIImage.SymbolConfiguration(pointSize: 30, weight: .medium)) {
                let iconRect = CGRect(
                    x: (size.width - iconImage.size.width) / 2,
                    y: (size.height - iconImage.size.height) / 2,
                    width: iconImage.size.width,
                    height: iconImage.size.height
                )
                iconImage.withTintColor(.white, renderingMode: .alwaysOriginal).draw(in: iconRect)
            }
        }
    }
}
