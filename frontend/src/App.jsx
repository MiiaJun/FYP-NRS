import { BrowserRouter, Routes, Route } from "react-router-dom";
import { AuthProvider } from "./context/AuthContext";
import { ModalProvider } from "./context/ModalContext";
import { NotificationProvider } from "./context/NotificationContext";
import LandingPage from "./pages/LandingPage";
import SearchPage from "./pages/SearchPage";
import ArticlePage from "./pages/ArticlePage";
import CreateArticlePage from "./pages/CreateArticlePage";
import ProfilePage from "./pages/ProfilePage"
import EditProfilePage from "./pages/EditProfilePage"
import UserProfilePage from "./pages/UserProfilePage";
import EditDraftPage from "./pages/EditDraftPage";
import EditPublishedPage from "./pages/EditPublishedPage";
import BookmarkPage from "./pages/BookmarkPage";
import NotificationPage from "./pages/NotifcationPage";
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
							<Route path="/search" element={<SearchPage />} />
							<Route path="/create" element={<CreateArticlePage/>} />
							<Route path="/article/:id" element={<ArticlePage />} />
							<Route path="/profile" element={<ProfilePage />} />
							<Route path="/edit-profile" element={<EditProfilePage />} />
							<Route path="/profile/:id" element={<UserProfilePage />} />
							<Route path="edit-draft" element={<EditDraftPage />} />
							<Route path="edit-published" element={<EditPublishedPage />} />
							<Route path="/bookmark" element={<BookmarkPage />} />
							<Route path="/notification" element={<NotificationPage />} />
						</Routes>
						<ModalRoot />
						<NotificationRoot />
					</NotificationProvider>
				</ModalProvider>
			</AuthProvider>
		</BrowserRouter>
	);
}