# Product Collections - Flutter Accordion App

A Flutter application that displays product collections in an elegant accordion-style interface. Each collection can be expanded to reveal all product images with smooth animations.

## 📱 Features

- **Accordion UI**: Tap any collection card to expand/collapse it
- **Single Expansion**: Only one collection expands at a time for a clean experience
- **Smooth Animations**: Beautiful expand/collapse animations with rotating arrow indicators
- **Image Preview**: Horizontal row shows the first 3 product images
- **Overflow Indicator**: Displays a "+N" overlay when more images exist beyond the preview
- **Responsive Cards**: Cards with rounded corners, elevation, and professional styling
- **Scrollable List**: Smooth vertical scrolling through all collections
- **Network Images**: Uses placeholder images from picsum.photos
- **Error Handling**: Graceful fallbacks for failed image loads
- **Loading States**: Shows loading indicators while images are fetching

## 🏗️ Project Structure

```
lib/
├── main.dart                      # App entry point and MaterialApp configuration
├── models/
│   ├── collection.dart            # Collection data model
│   └── product.dart               # Product data model
├── screens/
│   └── collections_screen.dart    # Main screen with list of collections
└── widgets/
    └── collection_card.dart       # Reusable accordion card widget
```

## 📝 Architecture & Approach

### Data Models

- **Product**: Simple model with `id` and `imageUrl` properties
- **Collection**: Contains `id`, `title`, and a list of `Product` objects

### Widget Hierarchy

1. **CollectionsScreen** (StatefulWidget)
   - Manages the state of which collection is expanded
   - Generates sample data (10 collections with 5-8 products each)
   - Uses ListView.builder for efficient rendering
   - Handles tap events to expand/collapse collections

2. **CollectionCard** (StatelessWidget)
   - Displays collection title, preview images, and expand indicator
   - Shows horizontal row of up to 3 product images
   - Displays "+N" overlay for remaining products
   - Uses AnimatedSize and AnimatedRotation for smooth transitions
   - Expands to show all products in a wrap layout when opened

### Key Implementation Details

#### Accordion Behavior
- State is managed in `CollectionsScreen` via `expandedIndex`
- When a card is tapped, `expandedIndex` updates to that card's index
- Tapping an already expanded card sets `expandedIndex` to null (collapses it)
- Only one collection can be expanded at any time

#### Animations
- **Card Expansion**: Uses `AnimatedSize` widget with 300ms duration and easeInOut curve
- **Arrow Rotation**: Uses `AnimatedRotation` to rotate the arrow icon 180° when expanding
- Both animations are synchronized for a cohesive user experience

#### Image Handling
- Network images loaded from `https://picsum.photos/200/200?random={id}`
- Each product gets a unique image ID based on collection and product numbers
- `loadingBuilder`: Shows a loading indicator while images fetch
- `errorBuilder`: Displays a fallback icon if image loading fails
- Images are wrapped in `ClipRRect` for rounded corners

#### Styling
- **Cards**: 12px border radius, elevation of 4 for depth
- **Images**: 80x80px in preview, 100x100px in expanded view, with 8px border radius
- **Typography**: Bold 18px titles, 16px section headers
- **Spacing**: Consistent 8-16px padding and margins throughout
- **Colors**: Material 3 design with deep purple color scheme

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (3.10.8 or higher)
- Dart SDK (included with Flutter)
- An IDE (VS Code, Android Studio, or IntelliJ IDEA)
- Android/iOS emulator or physical device

### Installation

1. **Clone the repository**
   ```bash
   git clone (https://github.com/Saksham0205/faym_flutter)
   cd task_faym
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the app**
   ```bash
   flutter run
   ```

   Or select your device/emulator in your IDE and press F5 (or click Run).

### Building for Production

**Android APK:**
```bash
flutter build apk --release
```

**iOS:**
```bash
flutter build ios --release
```
