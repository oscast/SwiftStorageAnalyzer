//
//  StorageView.swift
//  AtomPic
//
//  Created by Oscar Castillo on 2/11/24.
//

import SwiftUI

// MARK: - Storage View

public struct StorageView: View {
    @ObservedObject var viewModel: StorageViewModel
    
    public init(viewModel: StorageViewModel) {
        self.viewModel = viewModel
    }
    
    public var body: some View {
        VStack {
            ZStack() {
                SemiCircularProgressView(progress: viewModel.usagePercentage)
                
                VStack(spacing: 8) {
                    Text("\(Int(viewModel.usagePercentage * 100))%")
                        .font(.system(size: 44, weight: .bold))
                        .foregroundColor(Color.init(hex: "314058"))
                    Text("\(String(format: "%.1f", viewModel.usedStorage)) GB / \(String(format: "%.1f", viewModel.totalStorage)) GB")
                        .font(.title3)
                        .foregroundColor(.black)
                }
            }
            .onAppear {
                viewModel.updateStorageInfo()
            }
        }
    }
}

#Preview {
    StorageView(viewModel: StorageViewModel(systemService: DefaultSystemService()))
}
