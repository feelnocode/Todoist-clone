//
//  textFieldWrapper.swift
//  todoist-clone
//
//  Created by Andrii Pashuta on 31.10.2024.
//

import Foundation

import SwiftUI
import UIKit

class UIKitTextInputViewController: UIViewController, UITextViewDelegate {
    var text: String = ""
    var placeholder: String = "Enter text here..."  // Set a default placeholder
    var onTextChange: ((String) -> Void)?

    private let textView: UITextView = {
        let textView = UITextView()
        textView.font = .systemFont(ofSize: 18)
        textView.backgroundColor = .clear  // No border
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()

    private let placeholderLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.font = .systemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(textView)
        view.addSubview(placeholderLabel)
        textView.delegate = self
        textView.text = text
        placeholderLabel.text = placeholder
        placeholderLabel.isHidden = !text.isEmpty

        // Layout constraints
        NSLayoutConstraint.activate([
            textView.topAnchor.constraint(equalTo: view.topAnchor),
            textView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            textView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            textView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            placeholderLabel.leadingAnchor.constraint(equalTo: textView.leadingAnchor, constant: 5),
            placeholderLabel.centerYAnchor.constraint(equalTo: textView.centerYAnchor)
        ])
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        textView.becomeFirstResponder()  // Automatically show keyboard
    }

    func textViewDidChange(_ textView: UITextView) {
        placeholderLabel.isHidden = !textView.text.isEmpty
        onTextChange?(textView.text)
    }
}


struct UIKitTextInputView: UIViewControllerRepresentable {
    @Binding var text: String
    var placeholder: String = "Enter text here..."

    func makeUIViewController(context: Context) -> UIKitTextInputViewController {
        let viewController = UIKitTextInputViewController()
        viewController.text = text
        viewController.placeholder = placeholder
        viewController.onTextChange = { newText in
            self.text = newText
        }
        return viewController
    }

    func updateUIViewController(_ uiViewController: UIKitTextInputViewController, context: Context) {
        uiViewController.text = text
    }
}
