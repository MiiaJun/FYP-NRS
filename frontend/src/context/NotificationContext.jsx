import { createContext, useContext, useRef, useState, useCallback } from "react";

const NotificationContext = createContext(null);

export function NotificationProvider({ children }) {
    const [notification, setNotification] = useState(null);
	const notificationTimer = useRef(null);

    const showNotification = useCallback((message, type = "error") => {
		if (notificationTimer.current) {
			clearTimeout(notificationTimer.current);
		}

		setNotification({
			id: Date.now(),
			message,
			type
		});

		notificationTimer.current = setTimeout(() => {
			notificationTimer.current = null;
			setNotification(null);
		}, 4000);
	}, []);

    return (
        <NotificationContext.Provider
            value={{
                notification,
                showNotification
            }}
        >
            {children}
        </NotificationContext.Provider>
    );
}

export function useNotification() {
    return useContext(NotificationContext);
}