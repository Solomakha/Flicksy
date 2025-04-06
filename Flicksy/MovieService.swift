import Foundation
import Alamofire

class MovieService {

    static let shared = MovieService() // синглтон, если удобно
    private init() {}

    private let apiKey = "7604dc04d5ee57bf0d3989b51605750e"
    private let baseURL = "https://api.themoviedb.org/3"

    func searchMovies(query: String, completion: @escaping (Swift.Result<[Result], Error>) -> Void) {
        let url = "\(baseURL)/search/movie"

        let parameters: Parameters = [
            "api_key": apiKey,
            "query": query,
            "language": "ru-RU"
        ]

        AF.request(url, parameters: parameters)
            .validate()
            .responseDecodable(of: MovieRequestModel.self) { response in
                switch response.result {
                case .success(let popularMovie):
                    completion(.success(popularMovie.results))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
}
