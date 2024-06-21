//
//  MovieTableViewCell.swift
//  Cinetopia
//
//  Created by Paulo Andres on 21/06/24.
//

import UIKit
import Kingfisher

protocol MovieTableViewCellDelegate: AnyObject {
    func didSelectFavoriteButton(sender: UIButton)
}

class MovieTableViewCell: UITableViewCell {
    
    private lazy var moviePosterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 12.0
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    private lazy var movieTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 20.0, weight: .bold)
        label.textColor = .white
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var movieReleaseDateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 18)
        label.textColor = .white.withAlphaComponent(0.75)
        return label
    }()
    
    private lazy var favoriteButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        let iconImage = UIImage(systemName: "heart")?.withTintColor(.buttonBackground, renderingMode: .alwaysOriginal)
        button.setImage(iconImage, for: .normal)
        button.addTarget(self, action: #selector(didTapFavoriteButton), for: .touchUpInside)
        
        return button
    }()
    
    weak var delegate: MovieTableViewCellDelegate?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviews()
        setupConstraints()
        backgroundColor = .background // ou .clear
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCell(movie: Movie) {
        let url = URL(string: movie.image)
        moviePosterImageView.kf.setImage(with: url)
        movieTitleLabel.text = movie.title
        movieReleaseDateLabel.text = "Lançamento: \(movie.releaseDate)"
        
        let heart = UIImage(systemName: "heart")?.withTintColor(.buttonBackground, renderingMode: .alwaysOriginal)
        let heartFill = UIImage(systemName: "heart.fill")?.withTintColor(.buttonBackground, renderingMode: .alwaysOriginal)
        
        if movie.isSelected ?? false {
            favoriteButton.setImage(heartFill, for: .normal)
        } else {
            favoriteButton.setImage(heart, for: .normal)
        }
    }
    
    private func addSubviews() {
        addSubview(moviePosterImageView)
        addSubview(movieTitleLabel)
        addSubview(movieReleaseDateLabel)
        contentView.addSubview(favoriteButton)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            moviePosterImageView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            moviePosterImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            moviePosterImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            moviePosterImageView.widthAnchor.constraint(equalToConstant: 100),
            
            movieTitleLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -16),
            movieTitleLabel.leadingAnchor.constraint(equalTo: moviePosterImageView.trailingAnchor, constant: 16),
            movieTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            movieReleaseDateLabel.topAnchor.constraint(equalTo: movieTitleLabel.bottomAnchor, constant: 8),
            movieReleaseDateLabel.leadingAnchor.constraint(equalTo: moviePosterImageView.trailingAnchor, constant: 16),
            
            favoriteButton.topAnchor.constraint(equalTo: movieReleaseDateLabel.bottomAnchor, constant: 8),
            favoriteButton.leadingAnchor.constraint(equalTo: moviePosterImageView.trailingAnchor, constant: 16),
            favoriteButton.heightAnchor.constraint(equalToConstant: 25),
            favoriteButton.widthAnchor.constraint(equalToConstant: 25)
        ])
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    // MARK: - Actions
    
    @objc
    func didTapFavoriteButton(sender: UIButton) {
        delegate?.didSelectFavoriteButton(sender: sender)
    }
    
}
