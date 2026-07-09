import SwiftUI
import Combine

struct ContentView: View {
    
    @State private var kalanSure = 30
    @State private var skor = 0
    
    // Highscore kalıcı olarak saklanır
    @AppStorage("highScore") private var yuksekSkor = 0
    
    // Hangi Kenny'nin görüneceğini tutar
    @State private var aktifKenny = 0
    
    // Oyun aktif mi?
    @State private var oyunAktif = true
    
    // Alert gösterilecek mi?
    @State private var alertGoster = false
    
    // Kenny her 0.7 saniyede bir yer değiştirir
    let kennyTimer = Timer.publish(
        every: 0.7,
        on: .main,
        in: .common
    ).autoconnect()
    
    // Süre her 1 saniyede bir azalır
    let sayacTimer = Timer.publish(
        every: 1.0,
        on: .main,
        in: .common
    ).autoconnect()
    
    var body: some View {
        
        VStack(spacing: 20) {
            
            // Kalan süre
            Text("\(kalanSure)")
                .font(.system(size: 45))
                .fontWeight(.bold)
            
            // Anlık skor
            Text("Score: \(skor)")
                .font(.title3)
            
            Spacer()
            
            // 3x3 oyun alanı
            VStack(spacing: 20) {
                
                HStack(spacing: 20) {
                    kennyKutusu(index: 0)
                    kennyKutusu(index: 1)
                    kennyKutusu(index: 2)
                }
                
                HStack(spacing: 20) {
                    kennyKutusu(index: 3)
                    kennyKutusu(index: 4)
                    kennyKutusu(index: 5)
                }
                
                HStack(spacing: 20) {
                    kennyKutusu(index: 6)
                    kennyKutusu(index: 7)
                    kennyKutusu(index: 8)
                }
            }
            
            Spacer()
            
            // Highscore
            Text("Highscore: \(yuksekSkor)")
                .font(.title3)
            
            Spacer()
        }
        .padding()
        
        // Kenny'nin rastgele yer değiştirmesi
        .onReceive(kennyTimer) { _ in
            
            if oyunAktif {
                aktifKenny = Int.random(in: 0...8)
            }
        }
        
        // Geri sayım
        .onReceive(sayacTimer) { _ in
            
            if oyunAktif {
                
                if kalanSure > 1 {
                    kalanSure -= 1
                } else {
                    kalanSure = 0
                    oyunuBitir()
                }
            }
        }
        
        // Oyun bitince gösterilecek uyarı
        .alert("Oyun Bitti", isPresented: $alertGoster) {
            
            Button("Evet") {
                oyunuYenidenBaslat()
            }
            
            Button("Hayır", role: .cancel) {
                // Hiçbir şey yapma
                // Oyun durmuş şekilde kalır
            }
            
        } message: {
            Text("""
            Skorun: \(skor)
            Tekrar oynamak istiyor musun?
            """)
        }
    }
    
    // Her Kenny kutusunu oluşturur
    @ViewBuilder
    private func kennyKutusu(index: Int) -> some View {
        
        if aktifKenny == index && oyunAktif {
            
            Image("kenny")
                .resizable()
                .scaledToFit()
                .frame(width: 90, height: 90)
                .onTapGesture {
                    skor += 1
                }
            
        } else {
            
            Color.clear
                .frame(width: 90, height: 90)
        }
    }
    
    // Oyun bitince çalışır
    private func oyunuBitir() {
        
        oyunAktif = false
        
        // Highscore kontrolü
        if skor > yuksekSkor {
            yuksekSkor = skor
        }
        
        // Alert'i göster
        alertGoster = true
    }
    
    // Evet butonuna basılınca çalışır
    private func oyunuYenidenBaslat() {
        
        // Süre yeniden 30
        kalanSure = 30
        
        // Anlık skor sıfırlanır
        skor = 0
        
        // İlk Kenny rastgele seçilir
        aktifKenny = Int.random(in: 0...8)
        
        // Oyun yeniden aktif olur
        oyunAktif = true
    }
}

#Preview {
    ContentView()
}
