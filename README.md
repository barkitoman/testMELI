# MELI Test

# Technical Approach

## Architecture VIP

VIP is an architectural pattern like MVC, MVP or MVVM. Its main difference is the clear logic separation between its components. VIP was created to fix MVC, or Massive View Controllers, a common problem in UIKit apps where View Controllers become the main object where code is kept and they become Massive in that most if not all of your logic is kept within them. This can also cause problems when testing your code.

VIPER already existed, but its implementation was a bit too complex and didn’t allow you to use segues.

The VIP pattern is a unidirectional architectural pattern. You might have already heard of some others, such as Redux, Flux or Model-View-Intent (MVI). These patterns focus on reactive UIs and state management.

Unidirectional patterns share one property: Their components are all interconnected and aren’t designed to mix. Each has its own clear responsibility.

[Architecting iOS Apps with VIP Clean Code](https://www.raywenderlich.com/29416318-getting-started-with-the-vip-clean-architecture-pattern#toc-anchor-003).

![alt text](https://github.com/barkitoman/testMELI/blob/main/Evidences/model.png)

### View

> The View is your app’s UI. This corresponds to a SwiftUI View. It sends requests to the interactor every time the user interacts with the UI.

### Presenter

> The Presenter handles the presentation logic. It formats the received data into view models suitable for display and then passes it to the view.

### Router

> This layer is responsible to manage the communication between modules, its allows us changing between views and, create modules for each feature on the app.

### Interactor

> The Interactor handles your app’s business logic, such as fetching data from the network or saving data in a database. When the view requests something, the interactor does the processing and sends the result as a response to the presenter.

## Good Practices

With the following practices, we've achieved create a product with highly quality.

- **Clean code**
- **SOLID Principles**
- **Dependency Injection**
- **Modularized architecture**

## Installation

This project require `Xcode 13.0`, `Swift 5` and should be run on `iOS 14.0`.

1. Install Cocoapods.

2. Then, execute the next command. `Pod install`.

3. Then, you should `run` the app.

## Evidence

On this Section we are going to watch the app running.

| Search Section Loader                                                              | Search Section                                                                    |
| ---------------------------------------------------------------------------------- | --------------------------------------------------------------------------------- |
| ![alt text](https://github.com/barkitoman/testMELI/blob/main/Evidences/loader.png) | ![alt text](https://github.com/barkitoman/testMELI/blob/main/Evidences/items.png) |

| Search Section With Pagination                                                     |
| ---------------------------------------------------------------------------------- |
| ![alt text](https://github.com/barkitoman/testMELI/blob/main/Evidences/detail.png) |

## Unit test Log

![alt text](https://github.com/barkitoman/testMELI/blob/main/Evidences/unitTest.png)
