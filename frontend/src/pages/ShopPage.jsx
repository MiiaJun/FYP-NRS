import Header from "../components/Header";
import LeftSidebar from "../components/LeftSideBar";
import Shop from "../components/Shop";
import "./NewsPage.css";

export default function ShopPage() {
    return (
        <div>
            <Header />
            <main className="page">
                <LeftSidebar />
                <Shop />
            </main>
        </div>
    );
}