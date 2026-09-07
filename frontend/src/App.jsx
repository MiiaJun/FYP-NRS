import { BrowserRouter, Routes, Route } from "react-router-dom";
import { AuthProvider } from "./context/AuthContext";
import { ModalProvider } from "./context/ModalContext";
import { NotificationProvider } from "./context/NotificationContext";
import LandingPage from "./pages/LandingPage";
import ArticlePage from "./pages/ArticlePage";
import CreateArticlePage from "./pages/CreateArticlePage";
import ProfilePage from "./pages/ProfilePage"
import EditDraftPage from "./pages/EditDraftPage";
import EditPublishedPage from "./pages/EditPublishedPage";
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
							<Route path="/profile" element={<ProfilePage />} />
							<Route path="edit-draft" element={<EditDraftPage />} />
							<Route path="edit-published" element={<EditPublishedPage />} />
						</Routes>
						<ModalRoot />
						<NotificationRoot />
					</NotificationProvider>
				</ModalProvider>
			</AuthProvider>
		</BrowserRouter>
	);
}