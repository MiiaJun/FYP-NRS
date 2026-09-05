import api from "../api/axios";

export default function uploadAdapter(loader) {
	return {
		upload() {
			return loader.file.then((file) => {
				const formData = new FormData();
				formData.append("upload", file);

				return api.post("/article/uploadImage.php", formData)
					.then((response) => {
						return {
							default: response.data.url
						};
					});
			});
		},

		abort() {
			// Upload cancellation can be handled here later.
		}
	};
}