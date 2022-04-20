# CSVReader **Your one and only CSV Reader**

## How to Run

1) Open `CSVReader.xcodeproj` file and wait XCode to resolve all dependencies.
2) Swap the developer profile as needed at `Signing & Capabilities`.
3) Press run on your desired device (Simulator or Real device).
4) In order to properly select a file, it is needed to Sign in with iCloud account on the device and have a .csv file stored in a folder.
	- 2 CSV files are provided inside `/CSV` folder in the project: issues.csv and teams.csv.

---------

## How to Use

The application has 2 screens, File Search and File Visualizer.
In the first screen, the user will be prompted to tap a file button and select a file in iCloud storage.
When successfully reading a .csv file, the app will then go to the next screen where the user will be able to visualize the file in a spreadsheet like form.

---------

## Current Features

- Spreadsheet like file visualization
- iCloud communication for easy selection of files
- Simple and elegant UI to use
- Smooth UX for pleasant viewing

---------

## Future Releases

- Selection and configuration of Headers
- Enable file edition
- Localization for other languages
- UI Tests
- Coordinators Unit Tests

---------

## Architecture

## Third-party dependencies

### CSVImporter

This application utilizes https://github.com/Flinesoft/CSVImporter to enable the reading of .csv files. **(1)**

## Folder Structure

- **Packages**: This folder contains all local implementations for the application. Each package inside this folder contains it's own Readme file. Furthermore, each package also has it's own repository.
- **CSVReader**: The application itself only handles the initialization of the app, not containing any Business Logic related code.

## Architecture design

The project makes use of MVVM-C pattern. This allows each package to be lightweight while also providing a public interface through the `Coordinator` making it easy to be reused in any other project.

The flow of the navigation is controlled by the `RootCoordinator` that has visibility on all other packages, making it simple to change the flow of the application if required. **(2)**

## Tests

The project provides Unit Tests for `FileSearch` and `CSVServiceProvider`.

All packages should be self testable and self buildable.

## UI Tests

The project does not provide any UI Test.

To implement UI Tests for this project, i would follow the native implementation of `XCUITest` for a few reasons:
	- Widely used by the developer community
	- Native and faster support inside XCode, by using latest Swift releases
	- Many Third-party tools support automation
	- Less probability to have flaky tests
	- No need for crossplatform support

---------

## Disclosure

I have taken this opportunity to play and experiment with my own self built framework, which is implemented inside the `Core` package. The package contains its own readme file.

### 1

- The utilization of CSVImporter is due to the fact that building a CSV parser from scratch has many points to be considered:
	- **Format**: Files can contain different types of separators, headers and empty fields.
	- **Memory**: Files can contain thousands of lines, that could potentially allocate huge amounts of memory.
- For a more visual representation of concerns, please check `Readme Images/Rabobank.jpg` inside the project.

### 2

- All packages have a `Coordinator` instance and its the only class available with `Public` access.