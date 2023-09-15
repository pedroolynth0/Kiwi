//
//  AddRecipeView4.swift
//  Kiwi
//
//  Created by dti digital on 12/09/23.
//

import SwiftUI


struct AddRecipeView4: View {
    @State private var image: Image? = nil
    @State private var isImagePickerPresented: Bool = false
    @EnvironmentObject var recipeViewModel: RecipeViewModel
    var body: some View {
        NavigationStack {
            VStack (spacing: 0){
                
                Text("Adicionar Imagem")
                    .font(.largeTitle)
                    .bold()
                    .padding()
                if recipeViewModel.recipe.image != nil {
                    HorizontalRecipeView(recipe: recipeViewModel.recipe)
                       
                }
                Spacer()
                Button(action: {
                    self.isImagePickerPresented = true
                }) {
                    Text("Selecionar Imagem")
                }
                .sheet(isPresented: $isImagePickerPresented, onDismiss: loadImage) {
                    ImagePicker(image: self.$image)
                }
                
                Spacer()
                VStack(alignment: .leading) {
                    NavigationLink(destination: RecipeDetailsView(recipe: recipeViewModel.recipe)) {
                        
                        HStack {
                            Spacer()
                            Text("Proximo")
                                .padding()
                                .background(Color(UIColor.systemGray6))
                                .cornerRadius(10)
                        }
                    }.padding()
                }
            }.padding()
        }
    }
    
    func loadImage() {
        if let selectedImage = image {
            recipeViewModel.recipe.image = selectedImage
        }
    }
}

struct ImagePicker: UIViewControllerRepresentable {
    @Binding var image: Image?

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        picker.sourceType = .photoLibrary
        return picker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePicker>) {
    }

    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        var parent: ImagePicker

        init(_ parent: ImagePicker) {
            self.parent = parent
        }

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let uiImage = info[.originalImage] as? UIImage {
                parent.image = Image(uiImage: uiImage)
            }

            picker.dismiss(animated: true)
        }
    }
}

struct AddRecipeView4_Previews: PreviewProvider {
    static var previews: some View {
        AddRecipeView4()
            .environmentObject(RecipeViewModel())
    }
}