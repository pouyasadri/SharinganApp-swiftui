//
//  ContentView.swift
//  ShirnganAPp
//
//  Created by Pouya Sadri on 24/01/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ItachiUchihaView()
    }
}

#Preview {
    ContentView()
}

struct ItachiUchihaView : View {
	@State private var isSharinganActive = false
	var body: some View {
		ZStack{
			backgroundView
			sharinganImage
			itachiImage
			bottomBlackCircle
			welcomeText
			particleSystemView
			chevronView
		}
	}
	
	private var backgroundView : some View{
		Color.red
			.ignoresSafeArea()
	}
	
	private var sharinganImage : some View{
		Image("sharingan")
			.resizable()
			.frame(width: 400,height: 400)
			.rotationEffect(.degrees(isSharinganActive ? 180 : -180))
			.offset(y: -180)
			.opacity(0.6)
			.onAppear{
				withAnimation(Animation.easeInOut(duration: 2).repeatForever(autoreverses: false)){
					isSharinganActive.toggle()
				}
			}
	}
	
	private var itachiImage : some View {
		Image("itachi")
			.resizable()
			.offset(y: -30)
	}
	
	private var bottomBlackCircle : some View{
		Circle()
			.foregroundStyle(.black)
			.frame(width: 500,height: 500)
			.offset(y: 470)
		
	}
	
	private var welcomeText : some View{
		Text("Welcome To Uchiha's")
			.font(.title2)
			.fontWeight(.light)
			.foregroundStyle(.white)
			.offset(y:280)
	}
	
	private var particleSystemView : some View{
		ParticleSystem()
	}
	
	private var chevronView : some View{
		ZStack{
			Circle()
				.foregroundStyle(.clear)
				.frame(width: 80,height: 80)
				.overlay(
					Circle().stroke(Color.white,lineWidth: 4)
				)
			
			Image(systemName: "chevron.right")
				.resizable()
				.frame(width: 15,height: 25)
				.foregroundStyle(.white)
				.opacity(0.4)
		}
		.offset(y: 360)
	}
}


struct ParticleSystem : UIViewRepresentable{
	func makeUIView(context: Context) -> some UIView {
		
		let host = UIView()
		let particleLayer = createParticleLayer()
		host.layer.addSublayer(particleLayer)
		host.layer.masksToBounds = true
		return host
	}
	
	private func createParticleLayer() -> CAEmitterLayer{
		let particlesLayer = CAEmitterLayer()
		particlesLayer.backgroundColor = UIColor.black.cgColor
		particlesLayer.emitterShape = .circle
		particlesLayer.emitterPosition = CGPoint(x: 509.4, y: 707.7)
		particlesLayer.emitterSize = CGSize(width: 1648.0, height: 1112.0)
		particlesLayer.emitterMode = .surface
		particlesLayer.renderMode = .oldestLast
		particlesLayer.emitterCells = [createSnowParticle()]
		
		return particlesLayer
	}
	
	private func createSnowParticle() -> CAEmitterCell{
		let snowParticles = CAEmitterCell()
		
		snowParticles.contents = UIImage(named: "snowflake")?.cgImage
		snowParticles.name = "Snow"
		
		snowParticles.birthRate = 92.0
		snowParticles.lifetime = 30
		snowParticles.velocity = 59.0
		snowParticles.velocityRange = -15.0
		snowParticles.xAcceleration = 5.0
		snowParticles.yAcceleration = 40.0
		snowParticles.emissionRange = 180.0 * (.pi / 45)
		snowParticles.spin = -26.6 * (.pi / 180.0)
		snowParticles.spinRange = 57.2 * (.pi / 180.0)
		snowParticles.scale = 0.002
		snowParticles.scaleRange = 0.05
		snowParticles.color = UIColor(red: 1, green: 1, blue: 1, alpha: 1).cgColor
		return snowParticles
	}
	func updateUIView(_ uiView: UIViewType, context: Context) {
		
	}
}
