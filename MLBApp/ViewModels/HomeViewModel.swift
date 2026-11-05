import Foundation
import Combine

@MainActor
final class HomeViewModel: ObservableObject {
    @Published var items: [ItemModel]
    @Published var searchText = ""
    @Published private(set) var filteredItems: [ItemModel] = []

    private var subscription: AnyCancellable?

    init(items: [ItemModel] = ItemModel.samples) {
        self.items = items

        subscription = $items
            .combineLatest($searchText.removeDuplicates())
            .map { items, text in
                let query = text.trimmingCharacters(in: .whitespacesAndNewlines)

                return items.filter { item in
                    query.isEmpty || "\(item.name) \(item.team)".localizedStandardContains(query)
                }
            }
            .sink { [weak self] items in
                self?.filteredItems = items
            }
    }
}
