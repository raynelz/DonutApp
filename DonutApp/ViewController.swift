//
//  ViewController.swift
//  DonutApp
//
//  Created by Захар Литвинчук on 25.10.2024.
//

import UIKit

final class ViewController: UIViewController {
	
	private let imageView = UIImageView()
	private let startButton = UIButton()
	private let mainText = UILabel()

	override func viewDidLoad() {
		super.viewDidLoad()
		embedViews()
		setupLayout()
		setupAppearance()
		setupBehavior()
	}
	
	// MARK: - функция добавления элементов на главный (родительский) экран
	
	func embedViews() {
		view.addSubview(imageView)
		imageView.addSubview(mainText)
		imageView.addSubview(startButton)
	}
	
	// MARK: - функция расчёта констрейнты
	
	func setupLayout() {
		NSLayoutConstraint.activate([
			imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 45),
			imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
			imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
			imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
			
			startButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
			startButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
			startButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
			startButton.heightAnchor.constraint(equalToConstant: 55),
			
			mainText.topAnchor.constraint(equalTo: startButton.topAnchor, constant: -300),
			mainText.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
			mainText.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
		])
	}
	
	// MARK: - функция для настройки цветов, шрифтов и всего UI
	func setupAppearance() {
		view.backgroundColor = .systemBackground
		
		imageView.image = UIImage(named: "monster")
		imageView.contentMode = .scaleAspectFill
		imageView.translatesAutoresizingMaskIntoConstraints = false
		imageView.isUserInteractionEnabled = true
		
		mainText.text = "Hello, Swift!"
		mainText.textColor = .white
		mainText.font = .systemFont(ofSize: 96, weight: .black)
		mainText.textAlignment = .left
		mainText.numberOfLines = 0
		mainText.translatesAutoresizingMaskIntoConstraints = false
		
		startButton.setTitle("Начать!", for: .normal)
		startButton.setTitleColor(.white, for: .normal)
		startButton.backgroundColor = .black
		startButton.layer.cornerRadius = 20
		startButton.translatesAutoresizingMaskIntoConstraints = false
	}
	
	// MARK: - функция для настройки поведения, делегаты, нажатия и т.д.
	func setupBehavior() {
		let action = UIAction(handler: { _ in
			let nextView = SecondViewController()
			self.navigationController?.pushViewController(nextView, animated: true)
		})
		startButton.addAction(action, for: .touchUpInside)
	}
}

