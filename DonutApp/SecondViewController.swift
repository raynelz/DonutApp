//
//  SecondViewController.swift
//  DonutApp
//
//  Created by Захар Литвинчук on 25.10.2024.
//

import UIKit

final class SecondViewController: UIViewController {
	
	// MARK: - UI Components
	
	private let imageView = UIImageView()
	private let titleLabel = UILabel()
	private let descriptionLabel = UILabel()
	private let priceLabel = UILabel()
	private let productInfoView = UIView()
	private let buyButton = UIButton()
	
	// градиент
	private let gradientLayer = CAGradientLayer()
	
	// MARK: - Life Cycle
	
	override func viewDidLoad() {
		super.viewDidLoad()
		embedViews()
		setupLayout()
		setupAppearance()
		setupBehavior()
	}
	
	override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()
		gradientLayer.frame = productInfoView.bounds
	}
	
	func embedViews() {
		view.addSubview(imageView)
		view.addSubview(productInfoView)
		
		[
			titleLabel,
			descriptionLabel,
			priceLabel,
			buyButton
		].forEach { productInfoView.addSubview($0) }
	}
	
	func setupLayout() {
		[imageView, productInfoView].forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
		
		NSLayoutConstraint.activate([
			imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
			imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
			imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
			imageView.heightAnchor.constraint(equalToConstant: 356),
			
			productInfoView.topAnchor.constraint(equalTo: view.centerYAnchor),
			productInfoView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
			productInfoView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
			productInfoView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
		])
	}
	
	func setupAppearance() {
		view.backgroundColor = .systemBackground
		
		gradientLayer.colors = [
			UIColor.gradientPink.cgColor,
			UIColor.gradientOrange.cgColor
		]
		
		gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
		gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
		
		imageView.image = UIImage(named: "marshmellow")
		imageView.contentMode = .scaleAspectFit
		
		
		productInfoView.layer.insertSublayer(gradientLayer, at: 0)
		productInfoView.layer.cornerRadius = 50
		productInfoView.clipsToBounds = true
	}
}
