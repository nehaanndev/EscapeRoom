import SwiftUI

struct LaunchScreen: View {
    @State private var codeInput = "" // Stores the user input
    @State private var message = "Find the code to escape!"
    @State private var isDoorUnlocked = false

    var body:  some View {
        ZStack {
            // Background
            Image("roomBackground")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)

            VStack(spacing: 20) {
                // Feedback message
                Text(message)
                    .font(.title)
                    .foregroundColor(.white)
                    .padding()

                // Input field for the code
                TextField("Enter the code", text: $codeInput)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                    .frame(width: 200)

                // Button to check the code
                Button(action: checkCode) {
                    Text("Unlock Box")
                        .font(.headline)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }

                // Door navigation
                if isDoorUnlocked {
                    NavigationLink(destination: NextRoomView()) {
                        Text("Instructor")
                            .font(.title)
                            .padding()
                            .background(Color.teal)
                            .foregroundColor(.black)
                            .cornerRadius(10)
                    }
                }
            }
        }
    }

    // Move the checkCode function here
    func checkCode() {
        if codeInput == "75561" { // Correct code
            message = "The box is unlocked! You can proceed."
            isDoorUnlocked = true
        } else {
            message = "Incorrect code. Try again!!"
        }
    }
}

// Move the NextRoomView struct outside the body
struct NextRoomView: View {
    var body: some View {
        Text("Welcome to the next room!")
            .font(.largeTitle)
            .foregroundColor(.green)
    }
}
