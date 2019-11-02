//
//  ImagePicker.swift
//  Omnia
//
//  Created by khoa on 02/11/2019.
//  Copyright © 2019 Khoa Pham. All rights reserved.
//

#if canImport(UIKit) && os(iOS)

import SwiftUI
import UIKit

public struct ImagePicker: UIViewControllerRepresentable {
    @Binding var image: UIImage?
    @Binding var isPresented: Bool

    public func makeCoordinator() -> ImagePicker.Coordinator {
        return ImagePicker.Coordinator(
            image: $image,
            isPresented: $isPresented
        )
    }

    public func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
        let controller = UIImagePickerController()
        controller.delegate = context.coordinator
        return controller
    }

    public func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePicker>) {
        // No op
    }
}

public extension ImagePicker {
    class Coordinator: NSObject, UINavigationControllerDelegate {
        @Binding var isPresented: Bool
        @Binding var image: UIImage?

        public init(image: Binding<UIImage?>, isPresented: Binding<Bool>) {
            self._image = image
            self._isPresented = isPresented
        }
    }
}

extension ImagePicker.Coordinator: UIImagePickerControllerDelegate {
    public func imagePickerController(
        _ picker: UIImagePickerController,
        didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        self.image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        isPresented = false
    }

    public func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        isPresented = false
    }
}

#endif
