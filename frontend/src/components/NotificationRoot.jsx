import { useNotification } from "../context/NotificationContext";
import Notification from "./Notification";

export default function NotificationRoot() {
    const { notification } = useNotification();

    return (
        <>
            {notification && (
                <Notification 
					key={notification.id}
					notification={notification} 
				/>
            )}
        </>
    );
}