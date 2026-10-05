export function getTimeAgo(dateString) {
    const date = new Date(dateString.replace(" ", "T") + "+08:00");
    const now = new Date();
	const diff = now - date;
    const diffSeconds = Math.floor(diff / 1000);
    const diffMinutes = Math.floor(diffSeconds / 60);
    const diffHours = Math.floor(diffMinutes / 60);
    const diffDays = Math.floor(diffHours / 24);

	if (diffSeconds < 0) return "Scheduled";
	if (diffSeconds < 60) return "Just now";
    if (diffMinutes < 60) return `${diffMinutes} min${diffMinutes !== 1 ? "s" : ""} ago`;
    if (diffHours < 24) return `${diffHours} hour${diffHours !== 1 ? "s" : ""} ago`;
    if (diffDays < 7) return `${diffDays} day${diffDays !== 1 ? "s" : ""} ago`;

    return date.toLocaleDateString("en-GB", {
        day: "numeric",
        month: "short",
        year: "numeric",
    });
}

export function getTaskCountdown(resetAt) {
	const resetDate = new Date(resetAt.replace(" ", "T") + "+08:00").getTime();
	const now = new Date();
	const remaining = Math.max(0, Math.ceil((resetDate - now) / 1000));
	const hours = Math.floor(remaining / 3600);
	const minutes = Math.floor((remaining % 3600) / 60);
	const seconds = remaining % 60;

	return [hours, minutes, seconds]
		.map(value => String(value).padStart(2, "0"))
		.join(":");
}