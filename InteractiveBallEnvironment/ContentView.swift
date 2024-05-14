//
//  ContentView.swift
//  InteractiveBallEnvironment
//
//  Created by Ryan Hayashi on 5/13/24.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {
    var body: some View {
        VStack {
            Button("^") {
                // do something
                
            }
            .background(Color.blue)
            .foregroundColor(.white)
            .padding(.leading, 1000)

            Text("Choose Shapes")
                .font(.largeTitle)
                .fontWeight(.bold)
            
//            Model3D(named: "Scene", bundle: realityKitContentBundle)
//                .padding(.bottom, 30)
            HStack {
                VStack {
                    Ball()
                    Cone()
                }.padding(.leading, 300)
                VStack {
                    Cube()
                    Cylinder()
                }.padding(.trailing, 300)
            }
            .padding(.top, 80)
            .padding(.bottom, 120)
        }
        .padding()
    }
}

struct Ball: View {
    
    @State private var scale = false
    var body: some View {
        RealityView { content in
            let model = ModelEntity(
                mesh: .generateSphere(radius: 0.04),
                materials: [SimpleMaterial(color: .blue, isMetallic: false)])
            
//            model.position = SCNVector3(0, 0, 0)
            
            // Enable interations on the entity
            model.components.set(InputTargetComponent())
            model.components.set(CollisionComponent(shapes:[.generateSphere(radius: 0.04)]))
            content.add(model)
        } update: { content in
            content.entities.forEach{ entity in
                entity.transform.scale = scale ? SIMD3<Float>(1.5,1.5,1.5) : SIMD3<Float>(1,1,1)
            }
        }
        .gesture(TapGesture().targetedToAnyEntity().onEnded {
            _ in scale.toggle()
        })
    }
}

struct Cube: View {
    
    @State private var scale = false
    var body: some View {
        RealityView { content in
            let model = ModelEntity(
                mesh: .generateBox(width: 0.07, height: 0.07, depth: 0.07),
                materials: [SimpleMaterial(color: .red, isMetallic: false)])
            
//            model.position = SIMD3(0, 0, 0)
            
            // Enable interations on the entity
            model.components.set(InputTargetComponent())
            model.components.set(CollisionComponent(shapes:[.generateBox(width: 0.07, height: 0.07, depth: 0.07)]))
            content.add(model)
        } update: { content in
            content.entities.forEach{ entity in
                entity.transform.scale = scale ? SIMD3<Float>(1.5,1.5,1.5) : SIMD3<Float>(1,1,1)
            }
        }
        .gesture(TapGesture().targetedToAnyEntity().onEnded {
            _ in scale.toggle()
        })
    }
}

struct Cone: View {
    
    @State private var scale = false
    var body: some View {
        RealityView { content in
            let model = ModelEntity(
                mesh: .generateCone(height: 0.07, radius: 0.04),
                materials: [SimpleMaterial(color: .yellow, isMetallic: false)])
            
//            model.position = SIMD3(0, 0, 0)
            
            // Enable interations on the entity
            model.components.set(InputTargetComponent())
            model.components.set(CollisionComponent(shapes:[.generateSphere(radius: 0.07)]))
            content.add(model)
        } update: { content in
            content.entities.forEach{ entity in
                entity.transform.scale = scale ? SIMD3<Float>(1.5,1.5,1.5) : SIMD3<Float>(1,1,1)
            }
        }
        .gesture(TapGesture().targetedToAnyEntity().onEnded {
            _ in scale.toggle()
        })
    }
}

struct Cylinder: View {
    
    @State private var scale = false
    var body: some View {
        RealityView { content in
            let model = ModelEntity(
                mesh: .generateCylinder(height: 0.07, radius: 0.04),
                materials: [SimpleMaterial(color: .green, isMetallic: false)])
            
//            model.position = SIMD3(0, 0, 0)
            
            // Enable interations on the entity
            model.components.set(InputTargetComponent())
            model.components.set(CollisionComponent(shapes:[.generateSphere(radius: 0.07)]))
            content.add(model)
        } update: { content in
            content.entities.forEach{ entity in
                entity.transform.scale = scale ? SIMD3<Float>(1.5,1.5,1.5) : SIMD3<Float>(1,1,1)
            }
        }
        .gesture(TapGesture().targetedToAnyEntity().onEnded {
            _ in scale.toggle()
        })
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
}
