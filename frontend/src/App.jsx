import { BrowserRouter, Routes, Route } from "react-router-dom";
import { AuthProvider } from "./context/AuthContext";
import { ModalProvider } from "./context/ModalContext";
import { NotificationProvider } from "./context/NotificationContext";
import LandingPage from "./pages/LandingPage";
import ArticlePage from "./pages/ArticlePage";
import CreateArticlePage from "./pages/CreateArticlePage";
import ModalRoot from "./components/ModalRoot";
import NotificationRoot from "./components/NotificationRoot";

export default function App() {
	return (
		<BrowserRouter>
			<AuthProvider>
				<ModalProvider>
					<NotificationProvider>
						<Routes>
							<Route path="/" element={<LandingPage />} />
							<Route path="/create" element={<CreateArticlePage/>} />
							<Route path="/article/:id" element={<ArticlePage />} />
						</Routes>
						<ModalRoot />
						<NotificationRoot />
					</NotificationProvider>
				</ModalProvider>
			</AuthProvider>
		</BrowserRouter>
	);
}