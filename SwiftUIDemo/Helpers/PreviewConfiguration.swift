//
//  PreviewConfiguration.swift
//  SwiftUIDemo
//
//  Created by Rezo Joglidze on 12.08.24.
//

#if DEBUG
import Foundation

func configurePreview() {
    let previewConfigurator = PreviewConfigurator()
    
    Task {
        await previewConfigurator.configurePreview()
    }
}

actor PreviewConfigurator {
    private var isConfigured: Bool = false
    
    func configurePreview() {
        guard !isConfigured else { return }
        isConfigured = true
        
        DIContainer.shared.injectPreviewDependencies()
    }
}
#endif
