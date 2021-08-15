import axios from 'axios'

// define axios client
const nodeAPI = axios.create({
    // read REACT_APP_API_URL from environment variable
    baseURL: process.env.REACT_APP_API_URL
});

export { nodeAPI };