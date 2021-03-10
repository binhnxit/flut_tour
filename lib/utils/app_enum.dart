
enum Tutorial {
  layoutState, // Remove - Hide/Show UI
  listView, // TBV
  gridView, // CLV
  mixin, // Delegate
  updateLayout, // Reload TBV, CLV, LayoutIfNeeded
  passData // Dependency Injection & Route
}

extension TutorialExtension on Tutorial {
  String getName() {
    switch (this) {
      case Tutorial.layoutState:
        return 'Layout Sate';
      case Tutorial.listView:
        return 'Table View / List View';
      case Tutorial.gridView:
        return 'Collection View / Grid View';
      case Tutorial.mixin:
        return 'Protocol / Mixin';
      case Tutorial.updateLayout:
        return 'Update UI / setState';
      case Tutorial.passData:
        return 'Pass Data';
      default:
        return '';
    }
  }
}