Network and API Services norms the way how the application sends HTTP requests.
The API Service overrides the Network service by setting the host URL and adding necessary headers.

### Network Service

Create file `src/services/NetworkService.js`:

```javascript
import axios from 'axios'

class NetworkService {
  static async get(path, query, options) {
    options = {
      response: true,
      queryStringParameters: {},
      ...options
    }
    return await axios({
      url: query ? `${path}?${query}` : path,
      method: 'get',
      ...options
    })
  }

  static async post(path, query, data, options) {
    options = {
      response: true,
      queryStringParameters: {},
      ...options
    }
    return await axios({
      url: query ? `${path}?${query}` : path,
      data,
      method: 'post',
      ...options
    })
  }

  static async put(path, query, data, options) {
    options = {
      response: true,
      queryStringParameters: {},
      ...options
    }
    return await axios({
      url: query ? `${path}?${query}` : path,
      data,
      method: 'put'
    })
  }

  static async delete(path, query) {
    return await axios({
      url: query ? `${path}?${query}` : path,
      method: 'delete'
    })
  }
}

export default NetworkService

```



### API Service

Add API URL to the config file `src/config/config.js`:

```
const prod = {
  API_URL: 'https://domain.com/api/v1/',
}

const dev = {
  API_URL: 'http://xxx.xxx.xx.xx:4000/api/v1/',
}
```

Create file `src/services/APIService.js`:

```javascript
import config from '../config/config'
import NetworkService from './NetworkService'
// import AuthService from './AuthService' // Use to get Auth token to get an access to API

class APIService {
  static async get(path, query, options = {}) {
    /* const header = await AuthService.getAuthToken()
    const options = Object.assign(options, {
      headers: header
    }) */
    const opts = Object.assign(options, {})
    const response = await NetworkService.get(config.BACKEND_URL + path, query, opts)
    return response
  }

  static async post(path, query, data, options = {}) {
    /* const header = await AuthService.getAuthToken()
    const options = Object.assign(options, {
      headers: header
    }) */
    const opts = Object.assign(options, {})
    const response = await NetworkService.post(config.BACKEND_URL + path, query, data, opts)
    return response
  }

  static async put(path, query, data, options = {}) {
    /* const header = await AuthService.getAuthToken()
    const options = Object.assign(options, {
      headers: header
    }) */
    const opts = Object.assign(options, {})
    const response = await NetworkService.put(config.BACKEND_URL + path, query, data, opts)
    return response
  }

  static async delete(path, options = {}) {
    /* const header = await AuthService.getAuthToken()
    const options = Object.assign(options, {
      headers: header
    }) */
    const opts = Object.assign(opt, {})
    const response = await NetworkService.delete(config.BACKEND_URL + path, opts)
    return response
  }
}

export default APIService

```
