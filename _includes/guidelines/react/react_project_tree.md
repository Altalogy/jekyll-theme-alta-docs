```

build                                     // The build artifact
node_modules                              // Installed Node modules
public
  |-- favicon
  |-- index.html
  |-- manifest.json
  |-- robots.txt
src
  |-- actions                             // Redux actions
  |   |-- app.js
  |   |-- products.js
  |
  |-- assets
  |   |-- images
  |
  |-- components                          // Components should not fetch
  |   |-- Products                        // data by itself (neither from Redux,
  |   |   |-- ProductThumb                // neither from API)
  |   |   |   |-- ProductThumb.jsx
  |   |   |   |-- ProductThumb.scss
  |   |   |   |-- index.js
  |   |   |     
  |   |   |-- ProductTable
  |   |       |-- ProductTable.jsx
  |   |       |-- ProductTable.scss
  |   |       |-- index.js
  |   |
  |   |-- UI                              // Reusable UI components grouped
  |       |-- Button                      // together in one folder
  |       |-- Tooltip
  |
  |--containers                           // Containers implement the logic
  |   |-- Products                        // and provide data to components
  |       |-- IndexProduct
  |       |   |-- ProductIndexContainer.jsx
  |       |   |-- index.js
  |       |
  |       |-- NewProduct
  |           |-- NewProductContainer.jsx
  |           |-- index.js
  |
  |-- config                              // Extract all configurable values
  |   |-- app.js                          // from components and containers
  |   |-- products.js                     // to config files.
  |
  |-- helpers                             // Reusable functions
  |
  |-- layouts                             // Layouts
  |   |-- MainLayout
  |       |-- MainLayout.jsx
  |       |-- MainLayout.scss
  |       |-- index.js
  |
  |-- locales                             // I18n
  |
  |-- models                              // Models provide a better
  |   |-- Product.js                      // representation of objects
  |
  |-- modules                             // Here you can import or build
  |                                       // modules that should be easily moved
  |                                       // to other projects
  |
  |-- reducers                            // Redux reducers
  |   |-- appReducer.js
  |   |-- productReducer.js
  |   |-- index.js
  |
  |-- routes                              // Routing
  |   |-- home
  |   |   |-- HomeRoute.jsx
  |   |
  |   |-- products
  |   |   |-- [id]
  |   |   |   |-- ProductRoute.jsx
  |   |   |
  |   |   |-- ProductsRoute.jsx
  |   |
  |   |-- routes.jsx
  |
  |-- services                           // Services
  |   |-- APIService.js
  |   |-- PayPalService.js
  |
  |-- App.jsx                         // Imports routes and connects with Redux
  |-- index.jsx                       // Entrypoint of the app. Imports App.jsx
  |-- init.js                         // Used in the app initialization stage
  |-- serviceWorker
  |-- store.js                        // Redux store

.eslintignore
.eslintrc.js
.eslintrc.json
.gitignore
package.json
README.md

```
