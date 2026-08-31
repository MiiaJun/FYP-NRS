import { BrowserRouter, Routes, Route } from "react-router-dom";
import { AuthProvider } from "./context/AuthContext";
import LandingPage from "./pages/LandingPage";

export default function App() {
	return (
		<BrowserRouter>
			<AuthProvider>
				<Routes>
					<Route path="/" element={<LandingPage />} />
				</Routes>
			</AuthProvider>
		</BrowserRouter>
	);
}