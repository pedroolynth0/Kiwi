import SwiftUI

struct AddRecipeView2: View {
    @EnvironmentObject var recipeViewModel: RecipeViewModel
    @EnvironmentObject var recipeFlow: RecipeFlow

    var body: some View {
        ZStack {
            VStack {
                Text("Etapas")
                    .font(.largeTitle)
                    .bold()
                ScrollView {
                    LazyVStack(spacing: 20) {
                        ForEach(Array(recipeViewModel.recipe.steps.enumerated()), id: \.offset) { index, step in
                            HStack {
                                TextEditor(text: $recipeViewModel.recipe.steps[index])
                                    .frame(minHeight: 100, idealHeight: getTextHeight(text: step, width: UIScreen.main.bounds.width - 70), maxHeight: .infinity)
                                    .padding(4)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(Color.gray, lineWidth: 1)
                                    )
                                
                                Button(action: {
                                    deleteStep(at: .init(integer: index))
                                }) {
                                    Image(systemName: "minus.circle.fill")
                                        .foregroundColor(.red)
                                }
                                .padding(.leading, 5)
                            }
                            .padding(.horizontal)
                        }
                        .onDelete(perform: deleteStep)

                        Button(action: addStep) {
                            Label("Adicionar Etapa", systemImage: "plus.circle")
                        }
                        .padding(.top, 10)
                    }
                    .padding(.bottom, 50)
                }
            }
            
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Button(action: {
                        recipeFlow.navigateToAddRecipeView3()
                    }) {
                        Text("Próximo")
                            .padding()
                            .background(Color(UIColor.systemGray6))
                            .cornerRadius(10)
                    }
                    .padding(20)
                }
            }
        }
    }

    private func getTextHeight(text: String, width: CGFloat) -> CGFloat {
        let textView = UITextView(frame: CGRect(x: 0, y: 0, width: width, height: CGFloat.greatestFiniteMagnitude))
        textView.text = text
        textView.sizeToFit()
        return textView.frame.height
    }

    private func addStep() {
        recipeViewModel.recipe.steps.append("")
    }

    private func deleteStep(at offsets: IndexSet) {
        recipeViewModel.recipe.steps.remove(atOffsets: offsets)
    }
}

struct AddRecipeView2_Previews: PreviewProvider {
    static var previews: some View {
        AddRecipeView2()
            .environmentObject(RecipeViewModel())
    }
}
