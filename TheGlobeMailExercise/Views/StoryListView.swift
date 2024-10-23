import SwiftUI
import Combine

struct StoryListView: View {
    @ObservedObject var viewModel = StoriesViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                if viewModel.isLoading {
                    ProgressView(Strings.loadingTitle)
                        .progressViewStyle(CircularProgressViewStyle(tint: .red))
                        .foregroundColor(.red)
                        .padding()
                }
                else if let errorMessage = viewModel.errorMessage {
                    ErrorView(message: errorMessage, retryAction: {
                        viewModel.fetchStories()
                    })
                } else {
                    List(viewModel.stories) { story in
                        StoryRow(story: story)
                    }.listStyle(.plain)
                    .navigationTitle(Strings.storiesNavigationTitle)
                }
            }
            .onAppear {
                viewModel.fetchStories()
            }
        }
    }
}

// Preview
struct StoryListView_Previews: PreviewProvider {
    static var previews: some View {
        StoryListView()
    }
}
