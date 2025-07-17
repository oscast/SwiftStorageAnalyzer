//
//  StorageAnalyzerView.swift
//  AtomPic
//
//  Created by Oscar Castillo on 2/11/24.
//

import SwiftUI

public struct StorageAnalyzerView: View {
    
    @StateObject var viewModel = StorageViewModel(systemService: DefaultSystemService())

    public init() {}
    
    public var body: some View {
        VStack {
            StorageView(viewModel: viewModel)
            Spacer()
        }
    }
}

struct StorageAnalyzerView_Previews: PreviewProvider {
    static var previews: some View {
        StorageAnalyzerView()
    }
}
