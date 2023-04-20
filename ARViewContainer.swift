//
//  ARViewContainer.swift
//  SpeakAR
//
//  Created by Wahid Hidayat on 18/04/23.
//

import SwiftUI
import RealityKit
import ARKit
import FocusEntity

struct ARViewContainer: UIViewRepresentable {
    @Binding var modelName: String?
    
    func makeUIView(context: Context) -> ARView {
        let arView = ARView(frame: .zero)
        let config = ARWorldTrackingConfiguration()
        config.planeDetection = [.horizontal]
        config.environmentTexturing = .automatic
        
        if ARWorldTrackingConfiguration.supportsSceneReconstruction(.mesh) {
            config.sceneReconstruction = .mesh
        }
        arView.session.run(config)
        _ = FocusEntity(on: arView, style: .classic())
        return arView
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {
        if let modelName {
            guard let modelEntity = try? ModelEntity.load(named: modelName) else { return }
            
            let newScale = simd_float3(x: 0.003, y: 0.003, z: 0.003)
            modelEntity.transform.scale = newScale
            
            let anchorEntity = AnchorEntity(plane: .horizontal)
            anchorEntity.addChild(modelEntity)
            uiView.scene.addAnchor(anchorEntity)
        }
    }
}
