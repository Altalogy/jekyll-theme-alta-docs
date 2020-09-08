
### 1. Naming convention

Cases:

* PascalCase
* camelCase
* snake_case
* SCREAMING_SNAKE_CASE or CONSTANT_CASE
* dash-case
* flatcase
* TRAIN-CASE
* Train-Case


Basic rules:

* Use **PascalCase** in models, classes or any kind of "blueprint" (when it's not an particular instance).
* Use **camelCase** in functions, methods and variables (when it is an instance). Use it also to name files containing helper functions (exports only functions or set of functions).
* Use **CONSTANT_CASE** with constants.

```js
# PascalCase vs camelCase vs CONSTANT_CASE

const GOOGLE_API_KEY = 'xxxxxx'

class Product {
  static resourceName = 'product'

  getResourceName() {
    return this.resourceName
  }
}

const product = new Product()

```

#### Plural vs Singular

Class, models, components and containers names should be Singular. Variables and constants should be singular, unless they contains a list. Also file names can be plural, i.e. `routes.js` because file defines a **list** of routes.


#### Verb vs noun

Functions and methods should be composed with (commanding) verbs: `getName()`, `convertText()`, `calculatePrice()`. Variables and class names should be nouns: `Product`, `products`.

#### Name decorators

* `_` use with private functions / methods (`_getName()`)


#### Prefixes & suffixes

* Components - `Resource.jsx`
* Routes - `ResourceRoute.jsx`, `NewResourceRoute.jsx`
* Containers - `ResourceContainer.jsx`
* Layouts - `MainLayout.jsx`


### 2. REST naming

```
[GET]    /resources/         - index, list of resources
[GET]    /resources/new      - displays a form to create a new resource
[GET]    /resources/:id      - show a resource
[GET]    /resources/:id/edit - edit form

[POST]   /resources/         - create a new resource
[PUT]    /resources/:id      - update a resource
[DELETE] /resources/:id      - delete a resource

# Related resources:
[GET]    /resources/:id/comments      - list of "comments" related to the "resource"
[GET]    /resources/:id/comments/new  - displays a form to create a new comment related with the "resource"
( . . . )

```


### 3. Nest components and follow the context

1. Group components with similar purposes, for example: UI components:

        |-- components
            |-- UI
                |-- Button
                |-- List
                |-- Tooltip

2. If components are strongly related to the specific component or they are used in the specific context, store them in particular component's folder:

        |-- components
            |-- Product
                |-- components
                |   |-- ProductThumb
                |   |   |-- ProductThumb.jsx
                |   |   |-- ProductThumb.scss
                |   |   |-- index.js
                |   |
                |   |-- ProductPrice
                |       |-- ProductPrice.jsx
                |       |-- ProductPrice.scss
                |       |-- index.js
                |
                |-- Product.jsx
                |-- Product.scss
                |-- index.js

### 4. Components vs containers vs routes vs layouts

**Components - HTML components**<br>
Components are used to build HTML code. Components can be stateless or stateful.
Components cannot be directly connected with Redux.

**Containers - Logic**<br>
Containers implement the logic, connect with Redux, import components and provide data to components.
The amount of HTML code should be minimal in containers. Containers are not pages!

**Routes - pages**<br>
Routes are defined with `react-router` (or other library). Each route is a subpage of the website. The route's page should compose the whole subpage by setting up layout and building other view elements with containers and/or plain components.

**Layouts - the page frame**<br>
Layouts sets up a page fram. Layouts are used in routes.



### 5. URL friendly routes

Routes are implemented in `src/routes/*` and they should follow REST naming convention:

```
|-- routes
    |-- products
    |   |-- new
    |   |   |-- NewProductRoute.jsx
    |   |
    |   |-- :id
    |   |   |-- edit
    |   |   |   |-- EditProductRoute.jsx
    |   |   |
    |   |   |-- ShowProductRoute.jsx
    |   |
    |   |-- IndexProductRoute.jsx
    |
    |-- routes.js
```


### 6. Small components

Keep components small. It's easier to test, reuse and keep code DRY.
Choose wisely between stateless and stateful components.
Containers should keep logic and components should focus on rendering the view.


### 7. Configurability of components

Try to not hard-code any value in the components. Instead, give an option to pass in props and handle following cases:

1. the prop is not passed > display default value (it can be hardcoded)
2. the prop is passed > display the prop's value
3. the prop's turn-off flag passed > do not display it at all

```
const MyComponent = ({ title = null, titleOff = false }) => {
  const defaultTitle = 'Hello World!'

  return (
    <div>
      { !titleOff &&
        <h1>{ title ? title : defaultTitle }</h1>
      }
    </div>
  )
}


<MyComponent />  // Display default: "Hello World!"

<MyComponent title="Good morning!" />  // Display prop: "Good morning!"

<MyComponent titleOff="Good morning!" />  // Display nothing

```



### 8. Configurability of the project

Use `src/config/*` to store configuration in multiple files:

```
|-- config
    |-- app.js // Contains basic configuration
    |-- aws.js // Contains AWS configuration
    |-- resource.js // Contains "Resource" configuration
```

Instead of setting constants in components, containers and other files, define them in `src/config/*.js` file and import to other files.



### 9. Environment variables

In `src/config/*.js` use `process.env.NODE_ENV` to define the environment variables:

```
const prod = {
  MY_VAR = 'xxx'
}

const dev = {
  MY_VAR = 'yyy'
}

const config = process.env.NODE_ENV === 'production'
  ? prod
  : dev

const GOOGLE_API_KEY = '1234567890'

export default {
  ...config,
  GOOGLE_API_KEY
}

```


### 10. Conditional Rendering

```
// Wrong:
{
  condition ?
  <div>
    // Do sth...
  </div> :
  null
}

// Good:
{condition &&
  <div>
    // Do sth...
  </div>
}
```

### 9. Stylesheets

#### BEM

Follow BEM conventions:

* block - `.block`
* elements - `.block__element`
* modifier - `.block--modifier`, `.block__element--modifier`

Example:

```sass

.product { }

.product .product__header { }

.product .product--dark { }

.product .product__header--dark { }

```

#### SCSS

```scss
// 1. Variables
$primary-color: #23ab56;

h1 {
  color: $primary-color;
}


// 2. Nesting
.navbar {
  .brand { }
}



// 3. Import
@import '_some_styles'




// 4. Mixins
@mixin shadow($alpha) {
  -webkit-box-shadow: 0px 0px 10px -2px rgba(20,34,51,$alpha);
  -moz-box-shadow: 0px 0px 10px -2px rgba(20,34,51,$alpha);
  box-shadow: 0px 0px 10px -2px rgba(20,34,51,$alpha);
}

.box { @include shadow(0.2); }

// Optional argument
@mixin shadow($alpha: 0.5) { ... }

// Keyword arguments and @if
@mixin square($size, $radius: 0) {
  width: $size;
  height: $size;

  @if $radius != 0 {
    border-radius: $radius;
  }
}

.avatar {
  @include square(100px, $radius: 4px);
}



// 5. Extend/Inheritance
%message-shared {
  border: 1px solid #ccc;
  padding: 10px;
  color: #333;
}

.message {
  @extend %message-shared;
}

.success {
  @extend %message-shared;
  border-color: green;
}

.error {
  @extend %message-shared;
  border-color: red;
}

.warning {
  @extend %message-shared;
  border-color: yellow;
}

// 6. Operators: +, -, *, /, %
article {
  width: 600px / 960px * 100%;
}



// 7. Functions
@function pow($base, $exponent) {
  $result: 1;
  @for $_ from 1 through $exponent {
    $result: $result * $base;
  }
  @return $result;
}

.sidebar {
  float: left;
  margin-left: pow(4, 3) * 1px;
}

```


#### Stylesheets in the project tree

Follow SASS 7-1 pattern:

```
stylesheets/
|
|– base/
|   |– _reset.scss       # Reset/normalize
|   |– _typography.scss  # Typography rules
|   ...                  # Etc…
|
|– components/
|   |– _buttons.scss     # Buttons
|   |– _carousel.scss    # Carousel
|   |– _cover.scss       # Cover
|   |– _dropdown.scss    # Dropdown
|   ...                  # Etc…
|
|– layout/
|   |– _navigation.scss  # Navigation
|   |– _grid.scss        # Grid system
|   |– _header.scss      # Header
|   |– _footer.scss      # Footer
|   |– _sidebar.scss     # Sidebar
|   |– _forms.scss       # Forms
|   ...                  # Etc…
|
|– pages/
|   |– _home.scss        # Home specific styles
|   |– _contact.scss     # Contact specific styles
|   ...                  # Etc…
|
|– themes/
|   |– _theme.scss       # Default theme
|   |– _admin.scss       # Admin theme
|   ...                  # Etc…
|
|– utils/
|   |– _variables.scss   # Sass Variables
|   |– _functions.scss   # Sass Functions
|   |– _mixins.scss      # Sass Mixins
|   |– _helpers.scss     # Class & placeholders helpers
|
|– vendors/
|   |– _bootstrap.scss   # Bootstrap
|   |– _jquery-ui.scss   # jQuery UI
|   ...                  # Etc…
|
|
|– main.scss             # Main Sass file
```


#### Project's stylesheets vs component's stylesheets

In the `src/stylesheets`, build general project styles. Styles which are limited to a specific components, implement in the component's folder:

```
|-- Product
     |-- Product.jsx
     |-- Product.scss
```

### 10. Linter

Use Linter to keep the same coding style with other team members.
