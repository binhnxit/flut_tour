
enum Tutorial {
  layoutState, // Remove - Hide/Show UI
  listView, // TBV
  gridView, // CLV
  mixin, // Delegate
  updateLayout, // Reload TBV, CLV, LayoutIfNeeded
  fetchData // Dependency Injection & Route
}

extension TutorialExtension on Tutorial {
  String getName() {
    switch (this) {
      case Tutorial.layoutState:
        return 'Layout\'s State';
      case Tutorial.listView:
        return 'Table View / List View';
      case Tutorial.gridView:
        return 'Collection View / Grid View';
      case Tutorial.mixin:
        return 'Protocol / Mixin';
      case Tutorial.updateLayout:
        return 'Update UI / setState';
      case Tutorial.fetchData:
        return 'Fetch Data';
      default:
        return '';
    }
  }
}

enum Identity {
  front,
  back
}

extension IdentityExtension on Identity {
  String title() {
    switch (this) {
      case Identity.front:
        return 'Front side of your ID';
      case Identity.back:
        return 'Back side of your ID';
      default:
        return '';
    }
  }
}