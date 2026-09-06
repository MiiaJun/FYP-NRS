import { useAuth } from "../context/AuthContext";
import NavBar from "./NavBar";
import FollowBar from "./FollowBar";
import "./LeftSideBar.css"

export default function LeftSidebar() {
    const { isLoggedIn } = useAuth();

    return (
        <aside className="left-sidebar">
            <NavBar />
            {isLoggedIn && <FollowBar />}
        </aside>
    );
}