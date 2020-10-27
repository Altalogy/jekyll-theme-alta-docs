
The application should perform initialization on start.

The default strategy is to execute successive functions sequentially.
Each function is a step that performs one and specific action.
If the result is as expected, trigger next function. If the result is not as expected, stop the chain and return the response.

Responses:

```javascript
// SUCCESS
// Everything went OK. Handle the returned data, i.e. store the data in Redux with actions.
{
  status: 0,
  data: { ... }
}

// ERROR
// Something went wrong and application cannot be loaded
{
  status: 1,
  error: 'API_UNREACHABLE', // The error code
  data: { ... } // optional
}

// REDIRECT
// The application should redirect the user
{
  status: 2,
  url: '/sign-in', // User has to be redirected
  message: 'MESSAGE_CODE' // i.e. message to display to the user
}
```

### Plan

#### 1. Add initialization script

```javascript
// src/Init.js
/**
 * Initialization script loading functions in a sequence.
 *
 * Statuses:
 * 0 - sequence has been halted. It may mean that there was an error during initialization
 * 1 - initialized with success.
 * 2 - redirection
 *
 * @returns
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

#### 2. Execute initialization script:

```
// src/App.jsx
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
    // Do something with response.. (i.e. Set Redux), check status (0,1,2), etc.
    setInitPerformed(true)
  }

(...)
}

```
