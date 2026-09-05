import "./Notification.css";

export default function Notification({ notification }) {
    return (
        <div className={`notification ${notification.type}`}>
            {notification.message}
        </div>
    );
}