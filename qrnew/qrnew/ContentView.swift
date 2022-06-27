//
//  ContentView.swift
//  qrnew
//
//  Created by Stefano  on 24/06/22.
//

import SwiftUI
import CoreImage
import CoreImage.CIFilterBuiltins

struct ContentView: View {
    
    
    
    let context = CIContext()
    let filter = CIFilter.qrCodeGenerator()
    
    var body: some View {
        
        ScrollView{
            VStack{
                
                Text("Random Wikipedia page generator")
                    .font(.title)
                    .fontWeight(.heavy)
                    .foregroundColor(.cyan)
                
                Image(uiImage: generateQrCodeFromString(string: "https://github.com/stefanospin7/ImageRecognition-ML-iOsApp"))
                    .resizable()
                    .interpolation(.none)
                    .scaledToFit()
                    .frame(width: 250, height: 250, alignment: .center)
                
                
                }
                
                DisclosureGroup(
                    content: {
                        // Date and Note
                        Text("IL MIO TITOLO").lineLimit(nil).multilineTextAlignment(.leading)
                            .padding()
                        
                        Text("LoremIpsumissimplydummytextoftheprintingandtypesettingindustry.LoremIpsumhasbeentheindustry'sstandarddummytexteversincethe1500s,whenanunknownprintertookagalleyoftypeandscrambledittomakeatypespecimenbook.Ithassurvivednotonlyfivecenturies,butalsotheleapintoelectronictypesetting,remainingessentiallyunchanged.Itwaspopularisedinthe1960swiththereleaseofLetrasetsheetscontainingLoremIpsumpassages,andmorerecentlywithdesktoppublishingsoftwarelikeAldusPageMakerincludingversionsofLoremIpsum.LoremIpsumissimplydummytextoftheprintingandtypesettingindustry.LoremIpsumhasbeentheindustry'sstandarddummytexteversincethe1500s,whenanunknownprintertookagalleyoftypeandscrambledittomakeatypespecimenbook.Ithassurvivednotonlyfivecenturies,butalsotheleapintoelectronictypesetting,remainingessentiallyunchanged.Itwaspopularisedinthe1960swiththereleaseofLetrasetsheetscontainingLoremIpsumpassages,andmorerecentlywithdesktoppublishingsoftwarelikeAldusPageMakerincludingversionsofLoremIpsum.")
                            .font(.body)
                            .bold()
                            //.lineLimit(1)
                        
                        
                    },
                    label: {
                        Text("IL MIO TITOLO")
                            .font(.system(size: 20))
                            .fontWeight(.bold)
                       
                        
                    }
                ).padding()
            
          
        }
        
        Spacer()
        Button("Prossimo") {
            ()
            
        }
    }
    func generateQrCodeFromString(string:String) -> UIImage{
        
        filter.message = Data(string.utf8)
        
        if let outputImage = filter.outputImage {
            
            if let cgImage = context.createCGImage(outputImage , from: outputImage.extent){
                
                return UIImage(cgImage:  cgImage)
            }
        }
        return UIImage(systemName: "xmark.circle") ?? UIImage()
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
