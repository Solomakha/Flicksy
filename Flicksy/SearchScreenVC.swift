import UIKit

class SearchScreenVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private let filtersButton: UIButton = {
        let filtersButton = UIButton()
        //Change backgroundColor
        filtersButton.backgroundColor = .green
        filtersButton.setImage(UIImage(systemName: "slider.horizontal.3"), for: .normal)
        filtersButton.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
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
    
    func setupView() {
        view.backgroundColor = .white
        view.addSubview(searchResultTable)
        
        let searchController = UISearchController(searchResultsController: nil)
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Поиск..."
        
        navigationItem.titleView = searchController.searchBar
        navigationItem.hidesSearchBarWhenScrolling = false // Оставляет строку видимой при скролле

        let rightItem = UIBarButtonItem(customView: filtersButton)
        navigationItem.rightBarButtonItem = rightItem
        
        searchResultTable.delegate = self
        searchResultTable.dataSource = self
        
        addConstraints()
    }
    
    func addConstraints() {
        NSLayoutConstraint.activate([
            searchResultTable.topAnchor.constraint(equalTo: view.topAnchor, constant: 5),
            searchResultTable.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -5),
            searchResultTable.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            searchResultTable.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            searchResultTable.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
        ])
    }
}

extension SearchScreenVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SearchTableViewCell
        cell.backgroundColor = .clear
        //cell.configure(homeTeam: "Real Madrid", awayTeam: "Barselona", homeTeamImage: "real", awayTeamImage: "barsa", time: "19:00", date: "23.03", stadium: "Estadio Nacional de Fútbol", city: "Managua")
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        
        let toFavorite = UIContextualAction(style: .destructive, title: "") { (_, _, completionHandler) in
            print("Удаление элемента \(indexPath.row)")
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
