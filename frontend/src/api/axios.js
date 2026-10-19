import axios from "axios";

const api = axios.create({
	baseURL: "https://api.rabutenri.com/api",
	withCredentials: true
});

export default api;