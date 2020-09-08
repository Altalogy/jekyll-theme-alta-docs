{% assign project_name = 'project-name' %}
{% if include.project_name %}
  {% assign project_name = include.project_name %}
{% endif %}

*Node: 10.16.0, Yarn: 1.21.1, NPM: 6.9.0, NPX: 6.9.0*

**Purpose:** Create-react-app (Client Side Rendering)

### Prerequisites

* Node installed
* Yarn, NPM or NPX installed

### A) Create project with Create-react-app

1. Run:

        $ npx create-react-app {{ project_name }}-web

        # ...OR...
        $ yarn create react-app {{ project_name }}-web

        # ...OR
        $ npm init react-app {{ project_name }}-web

2. Go to the project folder:

        $ cd {{ project_name }}-web



### B) Setup project tree

The example of the project tree. The final outcome depends on the project needs.

{% include guidelines/react/react_project_tree.md %}



#### 1. Config

Create folder `src/config` and add `src/config/app.js` file:

```javascript
const prod = {
  API_URL: 'https://domain.com/api/v1/'
}

const dev = {
  API_URL: 'http://xxx.xxx.xx.xx:4000/api/v1/'
}

const config = process.env.NODE_ENV === 'production'
  ? prod
  : dev

// const EXAMPLE_VAR = 'xxx'

export default {
  ...config,
  // EXAMPLE_VAR,
}
```

#### 2. Add basic folders to the project tree

```
|--src
  |-- assets
  |   |-- images
  |       |-- .keep
  |
  |-- components
  |   |-- UI
  |       |-- .keep
  |
  |-- containers
  |   |-- .keep
  |
  |-- helpers
  |   |-- .keep
  |
  |-- layouts
  |   |-- .keep
  |
  |-- models
  |   |-- .keep
  |
  |-- modules
  |   |-- .keep
  |
  |-- services
      |-- .keep
```



#### 3. Add Routes and set up App.jsx

Install:

```bash
$ yarn add react-router-dom
```

Create `src/routes` folder and add `src/routes/routes.jsx` file:

```javascript
import React from 'react'
import {
  Route,
  Switch
} from 'react-router'
import HomeRoute from './home/HomeRoute'

const routes = (
  <Switch>
    <Route exact path='/' component={HomeRoute} />
  </Switch>
)

export default routes
```

Add file `src/routes/home/HomeRoute.jsx`:

```javascript
import React from 'react'

const Home = () => (
  <div>
    <h1>Home page</h1>
  </div>
)

export default Home
```

Add `src/history.js`:

```javascript
import { createBrowserHistory } from 'history'

export default createBrowserHistory()
```


Edit `src/App.jsx`:

```javascript
import React, {
  useState,
  useEffect,
} from 'react'
import PropTypes from 'prop-types'
import { Router } from 'react-router'
import routes from './routes/routes'
import history from './history'
import './App.css'

function App() {
  return (
    <div className='app'>
      <Router history={history}>
        {routes}
      </Router>
    </div>
  )
}

export default App
```





#### 4. Add initialization script

Add file `src/Init.js`:

```javascript
/**
 * Initialization script loading functions in a sequence.
 *
 * Statuses:
 * 0 - sequence has been halted. It may mean that there was an error during initialization
 * 1 - initialized with success.
 * 2 - redirection
 *
 * @returns {{status: number, message: string, data: Object }}
 */
class Init {
  static init() {
    return this.firstFunction()
  }

  static async firstFunction() {
    if (true) {
      return this.secondFunction()
    }
    return {
      status: 0,
      message: 'APP_INITIALIZATION_FAILED',
    }
  }

  static async secondFunction() {
    return {
      status: 0,
      message: 'SUCCESS',
      data: { a: 1, b: 2 }
    }
  }
}

export default Init
```

Add the Init to the `src/App.jsx`:

```javascript
import Init from './Init.js'

function App() {
  const [initPerformed, setInitPerformed] = useState(false)
  useEffect(() => {
    if (!initPerformed) {
      initializeApp()
    }
  }, [initPerformed])

  async function initializeApp() {
    await Init.init()
    // OR:
    // const response = await Init.init()
    // Do something with response.. (i.e. Set Redux)
    setInitPerformed(true)
  }

(...)
}
```


#### 5. Add I18n

Install:

```bash
$ yarn add react-i18next i18next
```

Create file `src/i18n.js`:

```javascript
import i18n from "i18next"
import { initReactI18next } from "react-i18next"

const appEn = require('./locales/en/app.json')

const resources = {
  en: {
    app: appEn
  }
}

i18n
  .use(initReactI18next) // passes i18n down to react-i18next
  .init({
    resources,
    lng: 'en',
    fallbackLng: 'en',
    interpolation: {
      escapeValue: false // react already safes from xss
    }
  })

  export default i18n
```

Add file: `src/locales/en/app.json`

```json
{
    "MY_TRANSLATION": "Translation example"
}
```

Import `i18n` in `src/index.js`:

```javascript
import './i18n'
```


#### 6. Add Redux

**Add Redux only if necessary.**

Install:

```bash
$ yarn add redux react-redux redux-devtools-extension redux-thunk
```

Add folders:

```
|-- src
    |-- actions
    |   |-- .keep
    |
    |-- reducers
    |   |-- index.js
    |
    |-- store.js
```

Edit `src/reducers/index.js`:

```javascript
import { combineReducers } from 'redux'
// import appReducer from './appReducer'

export default () => combineReducers({
  // app: appReducer,
})
```

Edit `src/store.js`:

```javascript
import { createStore, applyMiddleware } from 'redux'
import thunk from 'redux-thunk'
import { composeWithDevTools } from 'redux-devtools-extension/developmentOnly'
import rootReducer from './reducers'


export const store = createStore(
  rootReducer(),
  composeWithDevTools(
    applyMiddleware(
      thunk
    )
  )
)
export default store
```

Edit `src/index.js`:

```javascript
(...)
import { Provider } from 'react-redux'
import { store } from './store'
(...)

ReactDOM.render(
  <React.StrictMode>
    <Provider store={store}>
      <App />
    </Provider>
  </React.StrictMode>,
  document.getElementById('root')
)
(...)

```


### C) Install other Node modules

Install only required modules.

#### 1. Axios

```bash
$ yarn add axios
```

#### 2. AWS Amplify

```bash
$ yarn add aws-amplify
```




### D) Set up SCSS and 7-1 pattern

Install:

```bash
$ yarn add node-sass
```

Rename `src/App.css` to `src/App.scss` and change import in `src/App.js`:

```javascript
import './App.scss'
```

Create `src/styles` folder and recreate 7-1 pattern:

```
|
|– base/
|   |– _reset.scss       # Reset/normalize
|   |– _typography.scss  # Typography rules
|   ...                  # Etc…
|
|– components/
|   |– .keep
|
|– layout/
|   |– .keep
|
|– pages/
|   |– .keep
|
|– themes/
|   |– _theme.scss       # Default theme
|
|– utils/
|   |– _variables.scss   # Sass Variables
|   |– _functions.scss   # Sass Functions
|   |– _mixins.scss      # Sass Mixins
|   |– _helpers.scss     # Class & placeholders helpers
|
|– vendors/
|   |– .keep
|
|
|– main.scss             # Main Sass file
```

Edit `src/styles/main.scss`:

```scss
@import
  'utils/variables',
  'utils/functions',
  'utils/mixins',
  'utils/helpers';

// @import 'vendors/bootstrap';

@import
  'base/reset',
  'base/typography';

// @import
//   'layout/navigation',
//   'layout/grid',
//   'layout/header',
//   'layout/footer',
//   'layout/sidebar',
//   'layout/forms';

// @import 'components/buttons';

// @import 'pages/home';

@import 'themes/theme';

```


Import `src/styles/main.scss` in `src/App.scss`:

```scss
@import './styles/main.scss'
```

### E) Set up ESlint and Prettier

Install:

```bash
$ yarn add -D babel-eslint eslint eslint-config-airbnb \
  eslint-config-prettier eslint-plugin-react eslint-plugin-import \
  prettier pretty-quick eslint-plugin-jsx-a11y
```

Initialize eslint:

```bash
$ ./node_modules/bin/eslint.js --init
# OR:
$ npx eslint --init
```

Add file `.prettierrc`:

```javascript
{
 "printWidth": 100,
 "trailingComma": "all",
 "tabWidth": 2,
 "semi": false,
 "singleQuote": true
}
```

Add file `.eslintignore`:

```
build/*
node_modules/*
```

Add file `.eslintrc.js`:

```
module.exports = {
  "extends": ["airbnb", "prettier"],
  "parser": "babel-eslint",
  "env": {
    "browser": true,
    "es2021": true
  },
  "parserOptions": {
    "ecmaFeatures": {
        "jsx": true
    },
    "ecmaVersion": 12,
    "sourceType": "module"
  },
  "plugins": [
    "react"
  ],
  "rules": {
    "semi": [2, "never"],
    "no-use-before-define": ["error", { "functions": false, "classes": false, "variables": false }],
    "import/no-extraneous-dependencies": ["error", {"devDependencies": false, "optionalDependencies": false, "peerDependencies": false}],
    "import/no-cycle": 0,
    'jsx-quotes': ["error", "prefer-single"],
    "no-underscore-dangle": 0,
    "react/require-default-props": 0,
    "jsx-a11y/anchor-is-valid": 0,
    "jsx-a11y/label-has-for": [ 2, {
      "required": {
          "some": [ "nesting", "id" ]
      }
    }],
    "react-hooks/exhaustive-deps": 0,
    "react/forbid-prop-types": 0,
    "comma-dangle": ["error", {
      "arrays": "only-multiline",
      "objects": "only-multiline",
      "imports": "only-multiline",
      "exports": "only-multiline",
      "functions": "never",
    }],
    "react/jsx-pascal-case": 0,
    "react/no-array-index-key": 0,
  },
};

```

Add to `package.json`:

```json
"scripts": {
  (...)
  "lint": "./node_modules/eslint/bin/eslint.js --ext .js --ext .jsx .",
  "format": "prettier --write \"**/*.+(js|jsx|json|css|md)\""
},
```

And you can run:

```bash
$ yarn lint
$ yarn format
```



### F) Set up tests

TODO



### G) Edit README.md

```markdown
{% include templates/react/react_readme.md project_name=project_name %}
```



### H) Service worker

TODO
