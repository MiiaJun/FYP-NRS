import { BrowserRouter, Routes, Route } from "react-router-dom";
import { AuthProvider } from "./context/AuthContext";
import LandingPage from "./pages/LandingPage";
import ArticlePage from "./pages/ArticlePage";

export default function App() {
	return (
		<BrowserRouter>
			<AuthProvider>
				<Routes>
					<Route path="/" element={<LandingPage />} />
					<Route path="/article/:id" element={<ArticlePage />} />
				</Routes>
			</AuthProvider>
		</BrowserRouter>
	);
}