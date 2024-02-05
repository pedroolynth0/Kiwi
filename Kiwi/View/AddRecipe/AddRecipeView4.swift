//
//  AddRecipeView4.swift
//  Kiwi
//
//  Created by dti digital on 12/09/23.
//

import SwiftUI


struct AddRecipeView4: View {
    @State private var image: UIImage? = nil
    @State private var isImagePickerPresented: Bool = false
    @EnvironmentObject var recipeViewModel: RecipeViewModel
    @EnvironmentObject var recipeFlow: RecipeFlow
    @Environment(\.managedObjectContext) var moc
    var body: some View {

            
            VStack {
                
                Text("Adicionar Imagem")
                    .font(.largeTitle)
                    .bold()
                    .padding()
                ScrollView {
                    VStack (spacing: 40){
                            if recipeViewModel.recipe.image != nil {
                                CardRecipeView(recipe: recipeViewModel.recipe)
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
                        Button(action: addStep) {
                            Label("Salvar Receita", systemImage: "plus.circle")
                        }
                    }.padding()
                }
            }
        
    }
    
    func loadImage() {
        recipeViewModel.recipe.image = image?.base64
    }
    private func addStep() {
        RecipeManager.saveRecipe(recipeViewModel.recipe)
        recipeFlow.done()
    }

}

struct ImagePicker: UIViewControllerRepresentable {
    @Binding var image: UIImage?

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
                parent.image = uiImage
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
